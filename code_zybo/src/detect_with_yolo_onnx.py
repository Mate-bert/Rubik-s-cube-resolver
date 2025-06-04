# detect_with_yolo_onnx.py
"""
Détection avec YOLOv8 exporté en ONNX via OpenCV
Auteur : Gad
Date : 2025-05-18
"""

import cv2
import numpy as np
import onnx
import yaml
from pathlib import Path

def load_classes(yaml_path):
    with open(yaml_path, 'r') as f:
        data = yaml.safe_load(f)
    return data['names']

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def preprocess(img_path, input_size=(640, 640)):
    image = cv2.imread(img_path)
    if image is None:
        raise FileNotFoundError(f"Image non trouvée : {img_path}")
    image_resized = cv2.resize(image, input_size)
    blob = cv2.dnn.blobFromImage(image_resized, 1/255.0, input_size, swapRB=True, crop=False)
    return image_resized, blob  # correction ici : on retourne l'image redimensionnée

def postprocess(output, image_shape, classes, conf_thresh=0.25, nms_thresh=0.45):
    output = output.squeeze(0)           # [11, 8400]
    output = output.transpose(1, 0)      # [8400, 11]
    
    H, W = image_shape[:2]
    boxes, confidences, class_ids = [], [], []

    for det in output:
        x, y, w, h = det[:4]
        class_scores = det[5:]
        class_id = np.argmax(class_scores)
        class_conf = class_scores[class_id]  # Déjà sigmoid dans ONNX

        if class_conf < conf_thresh:
            continue

        # Conversion en pixels
        x1 = int(x - w / 2)
        y1 = int(y - h / 2)
        box_w = int(w)
        box_h = int(h)

        box = [x1, y1, box_w, box_h]

        boxes.append(box)
        confidences.append(float(class_conf))
        class_ids.append(class_id)

    indices = cv2.dnn.NMSBoxes(boxes, confidences, conf_thresh, nms_thresh)
    results = []

    for i in indices:
        i = i[0] if isinstance(i, (tuple, list, np.ndarray)) else i
        results.append((boxes[i], class_ids[i], confidences[i]))

    return results

def draw_detections(image, detections, classes):
    for box, class_id, score in detections:
        x, y, w, h = box
        label = f"{classes[class_id]}: {score:.2f}" if class_id < len(classes) else f"id {class_id}: {score:.2f}"
        color = (0, 255, 0)
        cv2.rectangle(image, (x, y), (x + w, y + h), color, 2)
        cv2.putText(image, label, (x, max(y - 5, 0)), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)
        print(f"Box: ({x}, {y}, {w}, {h}) → Classe: {class_id}, Score: {score:.2f}")
    return image

def draw_cube_faces_custom(image, detections, classes):
    center_class_id = 5
    center_box = None
    positions = {}

    # 1. Trouver le centre
    for box, class_id, score in detections:
        if class_id == center_class_id:
            center_box = box
            break

    if not center_box:
        print("❌ Centre non détecté.")
        return image

    x, y, w, h = center_box
    cx_center = x + w // 2
    cy_center = y + h // 2
    positions["centre"] = (cx_center, cy_center)
    cv2.circle(image, (cx_center, cy_center), 5, (0, 0, 255), -1)

    # 2. Analyser les autres positions
    for box, class_id, score in detections:
        if class_id == center_class_id:
            continue
        x, y, w, h = box
        cx = x + w // 2
        cy = y + h // 2

        dx = cx - cx_center
        dy = cy - cy_center

        if abs(dx) < 20 and dy < 0:
            pos = "haut"
        elif abs(dx) < 20 and dy > 0:
            pos = "bas"
        elif dx < 0 and abs(dy) < 20:
            pos = "gauche"
        elif dx > 0 and abs(dy) < 20:
            pos = "droite"
        elif dx < 0 and dy < 0:
            pos = "haut-gauche"
        elif dx > 0 and dy < 0:
            pos = "haut-droite"
        elif dx < 0 and dy > 0:
            pos = "bas-gauche"
        elif dx > 0 and dy > 0:
            pos = "bas-droite"
        else:
            pos = "inconnu"

        positions[pos] = (cx, cy)
        cv2.circle(image, (cx, cy), 4, (0, 255, 0), -1)
        cv2.putText(image, pos, (cx + 5, cy - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (255, 255, 255), 1)
    
    # 3. Extrapoler haut-gauche
    if "haut" in positions and "haut-droite" in positions and "haut-gauche" not in positions:
        hx, hy = positions["haut"]
        hdx, hdy = positions["haut-droite"]
        vx = hx - hdx
        vy = hy - hdy
        px = int(cx_center + vx)
        py = int(cy_center + vy - 15)
        cv2.circle(image, (px, py), 4, (0, 255, 255), -1)
        cv2.putText(image, "extrapolé HG", (px + 5, py + 5), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (0, 255, 255), 1)
        print("🟡 Point extrapolé : haut-gauche =", (px, py))
        positions["haut-gauche"] = (px, py)

    # 4. Nouvelle extrapolation : gauche ← à partir de bas & bas-droite
    if "haut-gauche" in positions and "bas-gauche" not in positions and "gauche" not in positions:
        bx, by = positions["bas"]
        brx, bry = positions["bas-droite"]
        vx = bx - brx
        vy = by - bry
        px = int(cx_center + vx)
        py = int(cy_center + vy + 13)
        cv2.circle(image, (px, py), 4, (0, 165, 255), -1)
        cv2.putText(image, "extrapolé G", (px + 5, py - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (0, 165, 255), 1)
        print("🟠 Point extrapolé : gauche =", (px, py))
        positions["gauche"] = (px, py)
    
    # 5. Extrapoler droite ← depuis haut et haut-gauche
    if "haut-droite" in positions and "bas-droite" not in positions and "droite" not in positions:
        hx, hy = positions["haut"]
        hdx, hdy = positions["haut-droite"]
        vx = hdx - hx
        vy = hdy - hy
        px = int(cx_center + vx + 13)
        py = int(cy_center + vy - 5)  # +5 pour abaisser un peu le point
        cv2.circle(image, (px, py), 4, (255, 255, 0), -1)
        cv2.putText(image, "extrapolé D", (px + 5, py - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (255, 255, 0), 1)
        print("🔷 Point extrapolé : droite =", (px, py))
        positions["droite"] = (px, py)
        
    # 6. Extrapoler bas ← depuis haut-gauche et bas-gauche
    if "haut-gauche" in positions and "bas-gauche" in positions and "bas" not in positions:
        hgx, hgy = positions["haut-gauche"]
        bgx, bgy = positions["bas-gauche"]
        vx = bgx - hgx
        vy = bgy - hgy
        px = int(cx_center + vx + 5)
        py = int(cy_center + vy)
        cv2.circle(image, (px, py), 4, (128, 255, 0), -1)
        cv2.putText(image, "extrapolé B", (px + 5, py - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (128, 255, 0), 1)
        print("🟢 Point extrapolé : bas =", (px, py))
        positions["bas"] = (px, py)

    print("✅ Positions relatives par rapport au centre :")
    for label, (px, py) in positions.items():
        print(f"  - {label}: ({px}, {py})")

    return image, positions

def enregistrer_faces_coords(positions: dict, image_source: str):
    from pathlib import Path

    face_points_order = [
        ("haut", "haut-droite", "centre", "haut-gauche", "3face_1.jpg", "face_rectified_1.jpg"),
        ("haut-gauche", "centre", "bas", "bas-gauche", "3face_1.jpg", "face_rectified_2.jpg"),
        ("centre", "haut-droite", "bas-droite", "bas", "3face_1.jpg", "face_rectified_3.jpg"),
        ("droite", "centre", "haut", "haut-droite", "3face_2.jpg", "face_rectified_4.jpg"),
        ("centre", "bas-gauche", "haut-gauche", "haut", "3face_2.jpg", "face_rectified_5.jpg"),
        ("droite", "bas", "bas-gauche", "centre", "3face_2.jpg", "face_rectified_6.jpg"),
    ]

    output_path = Path("data/config/faces_coords.txt")
    image_name = Path(image_source).name
    lines_to_append = []

    for face in face_points_order:
        src_img, dst_img = face[-2], face[-1]
        if src_img != image_name:
            continue  # ⛔ ignorer les faces qui ne concernent pas cette image

        coords = []
        complete = True
        for label in face[:-2]:
            if label not in positions:
                complete = False
                break
            x, y = positions[label]
            coords.append(f"{x} {y}")
        if complete:
            line = f"{src_img}, {dst_img}: {', '.join(coords)}"
            lines_to_append.append(line)

    if lines_to_append:
        with open(output_path, "a", encoding="utf-8") as f:
            f.write("\n".join(lines_to_append) + "\n")
        print(f"📝 Coordonnées enregistrées dans {output_path}")

def process_image(image_path, model_path, class_file):
    classes = load_classes(class_file)
    net = cv2.dnn.readNetFromONNX(model_path)

    image, blob = preprocess(image_path)
    net.setInput(blob)
    output = net.forward()

    detections = postprocess(output, image.shape, classes)
    print(f"✅ Détections : {len(detections)} objets trouvés")

    result = draw_detections(image, detections, classes)
    for box, class_id, score in detections:
        label = classes[class_id] if class_id < len(classes) else str(class_id)
        print(f"✔️ class_id={class_id}, label={label}, score={score:.2f}")
    result, positions = draw_cube_faces_custom(result, detections, classes)

    # nom de sortie cohérent
    image_name = Path(image_path).stem
    output_img_path = f"{image_name}_predicted.jpg"
    cv2.imwrite(output_img_path, result)
    print(f"✅ Image annotée sauvegardée dans {output_img_path}")

    enregistrer_faces_coords(positions, image_path)


def main():
    from pathlib import Path

    # 🧹 Réinitialiser faces_coords.txt
    output_path = Path("data/config/faces_coords.txt")
    if output_path.exists():
        output_path.write_text("", encoding="utf-8")
        print(f"🧹 Fichier réinitialisé : {output_path}")

    model_path = "data/models/yolo/best.onnx"
    class_file = "IA/YOLO/yolo_config.yaml"

    image_paths = [
        "data/raw/3face_1.jpg",
        "data/raw/3face_2.jpg"
    ]

    for img_path in image_paths:
        print(f"\n🖼️ Traitement de l'image : {img_path}")
        process_image(img_path, model_path, class_file)

if __name__ == "__main__":
    main()

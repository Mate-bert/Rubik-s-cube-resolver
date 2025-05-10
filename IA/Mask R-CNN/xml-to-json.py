import os
import xml.etree.ElementTree as ET
import json
import numpy as np

# Dossiers de travail
image_dir = "IA/Mask R-CNN/images"           # Dossier contenant les images
annotation_dir = "IA/Mask R-CNN/annotations" # Dossier contenant les annotations XML
output_dir = "IA/Mask R-CNN/annotations"     # Dossier pour le fichier COCO JSON

# Dictionnaire COCO
coco_output = {
    "images": [],
    "annotations": [],
    "categories": [{"id": 1, "name": "point", "supercategory": "none"}]
}

# Fonction pour convertir un fichier XML en COCO Keypoints
def convert_xml_to_coco(xml_file):
    # Charger l'annotation XML
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # Extraire les informations de l'image
    image_info = root.find("image")
    image_id = int(image_info.attrib["id"])
    image_width = int(image_info.attrib["width"])
    image_height = int(image_info.attrib["height"])
    image_filename = image_info.attrib["name"]

    # Ajouter l'image au format COCO
    coco_image = {
        "id": image_id,
        "width": image_width,
        "height": image_height,
        "file_name": image_filename
    }
    coco_output["images"].append(coco_image)

    # Parcourir les points et créer les annotations pour chaque point
    annotation_id = 1
    for shape in root.findall("image/points"):
        # Extraire les coordonnées des points
        label = shape.attrib["label"]
        cx, cy = map(float, shape.attrib["points"].split(","))
        
        # Ajouter les annotations dans COCO
        annotation = {
            "id": annotation_id,
            "image_id": image_id,
            "category_id": 1,  # 1: point
            "keypoints": [cx, cy, 1],  # [x, y, visibilité]
            "num_keypoints": 1,  # 1 point par annotation
            "area": 1,  # Aire de la zone (peut être calculée)
            "bbox": [cx-1, cy-1, 2, 2]  # Boîte délimitante autour du point
        }
        coco_output["annotations"].append(annotation)
        annotation_id += 1

# Traitement des fichiers XML
if not os.path.exists(output_dir):
    os.makedirs(output_dir)  # Créer le dossier de sortie si nécessaire

for xml_file in os.listdir(annotation_dir):
    if xml_file.endswith(".xml"):
        xml_path = os.path.join(annotation_dir, xml_file)
        convert_xml_to_coco(xml_path)

# Sauvegarder les annotations en fichier COCO JSON
with open(os.path.join(output_dir, "annotations.json"), "w") as json_file:
    json.dump(coco_output, json_file)

print("Conversion terminée ! Le fichier COCO a été généré.")
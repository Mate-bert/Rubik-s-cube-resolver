# train.py
from ultralytics import YOLO

def main():
    # Charger le modèle pré-entraîné YOLOv8 segmentation (le plus léger pour CPU embarqué)
    model = YOLO("yolov8n-seg.pt")

    # Entraîner sur ton dataset
    model.train(
        data="yolo_config.yaml",   # config du dataset
        epochs=50,
        imgsz=640,
        batch=4,
        name="rubiks_faces_seg",
        project="runs",            # dossier où les résultats seront stockés
        verbose=True
    )

if __name__ == "__main__":
    main()
import tkinter as tk  # À utiliser uniquement si matplotlib ne fonctionne pas
import matplotlib  # À utiliser uniquement si matplotlib ne fonctionne pas
matplotlib.use("TkAgg")  # À utiliser uniquement si matplotlib ne fonctionne pas
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import sys
from pathlib import Path

# Ajouter le chemin du répertoire parent au PATH pour importer les modules personnalisés
sys.path.append(str(Path(__file__).resolve().parents[2]))

# Importer les fonctions utilitaires
from utils.config_loader import load_config
from utils.affichage_cube import draw_basic_face, face_positions

# Charger les chemins depuis le fichier de configuration
cfg = load_config()
pred_file = Path(cfg["paths"]["kociemba_txt"])  # Fichier contenant les prédictions
ref_file = Path(cfg["paths"]["kociemba_ref"])  # Fichier contenant les références
output_path = Path(cfg["paths"]["visu_cube"])  # Chemin pour sauvegarder le visuel

# Fonction pour parser un fichier Kociemba et extraire les faces du cube
def parse_kociemba_file(path):
    faces = {}
    with open(path, 'r') as f:
        for line in f:
            if not line.strip():  # Ignorer les lignes vides
                continue
            # Nettoyer la ligne et extraire les données
            line_clean = line.strip().replace('"', '').replace(',', '')
            face, values = line_clean.split(':')
            faces[face] = list(values)  # Stocker les valeurs sous forme de liste
    return faces

# Fonction pour dessiner une face avec les résultats (comparaison prédiction/référence)
def draw_result_face(ax, position, predicted, reference):
    x_offset, y_offset = position  # Position de la face sur le graphique
    for idx, (p, r) in enumerate(zip(predicted, reference)):
        row, col = divmod(idx, 3)  # Calculer la position dans la grille 3x3
        x = x_offset + col
        y = y_offset + (2 - row)  # Inverser l'axe Y pour correspondre à l'affichage
        # Déterminer la couleur de fond (vert si correct, rouge sinon)
        bg_color = 'green' if p == r else 'red'
        # Dessiner un rectangle pour chaque case
        rect = patches.Rectangle((x, y), 1, 1, linewidth=1.2, edgecolor='black', facecolor=bg_color)
        ax.add_patch(rect)
        # Ajouter le texte correspondant à la prédiction
        ax.text(x + 0.5, y + 0.5, p, ha='center', va='center', fontsize=12, color='white' if p == r else 'black')

if __name__ == "__main__":
    # Parser les fichiers de prédictions et de références
    pred_faces = parse_kociemba_file(pred_file)
    ref_faces = parse_kociemba_file(ref_file)

    # Création de la figure avec 3 sous-graphiques
    fig, axes = plt.subplots(1, 3, figsize=(18, 6))
    titles = ["✅ Référence (attendu)", "🔍 Prédiction (obtenu)", "📊 Résultat (bon/mauvais)"]

    # Dessiner les faces pour chaque sous-graphe
    for ax, title in zip(axes, titles):
        for face in ['U', 'L', 'F', 'R', 'B', 'D']:  # Parcourir les 6 faces du cube
            pos = face_positions[face]  # Obtenir la position de la face
            if title.startswith("✅"):  # Dessiner la référence
                draw_basic_face(ax, pos, ref_faces[face])
            elif title.startswith("🔍"):  # Dessiner la prédiction
                draw_basic_face(ax, pos, pred_faces[face])
            else:  # Dessiner le résultat (comparaison)
                draw_result_face(ax, pos, pred_faces[face], ref_faces[face])
        # Configurer les limites et l'apparence du graphique
        ax.set_xlim(0, 12)
        ax.set_ylim(0, 12)
        ax.set_aspect('equal')
        ax.axis('off')  # Désactiver les axes
        ax.set_title(title, fontsize=14)  # Ajouter un titre

    # Ajuster la mise en page et sauvegarder le visuel
    plt.tight_layout()
    plt.savefig(output_path)  # Sauvegarder l'image dans le chemin spécifié
    plt.show()  # Afficher le graphique

import matplotlib.pyplot as plt
import matplotlib.patches as patches
import sys
from pathlib import Path
sys.path.append(str(Path(__file__).resolve().parents[2]))
from utils.config_loader import load_config

# Charger les chemins
cfg = load_config()
pred_file = Path(cfg["paths"]["kociemba_txt"])
ref_file = Path(cfg["paths"]["kociemba_ref"])
output_path = Path(cfg["paths"]["visu_cube"])

# Définition des couleurs associées aux faces
color_map = {
    'U': 'yellow',
    'F': 'red',
    'R': 'green',
    'L': 'blue',
    'B': 'orange',
    'D': 'white',
    '?': 'gray'
}

# Fonction de parsing robuste
def parse_kociemba_file(path):
    faces = {}
    with open(path, 'r') as f:
        for line in f:
            if not line.strip():
                continue
            line_clean = line.strip().replace('"', '').replace(',', '')
            face, values = line_clean.split(':')
            faces[face] = list(values)
    return faces

pred_faces = parse_kociemba_file(pred_file)
ref_faces = parse_kociemba_file(ref_file)

# Fonction d'affichage simple
def draw_basic_face(ax, position, values):
    x_offset, y_offset = position
    for idx, v in enumerate(values):
        row, col = divmod(idx, 3)
        x = x_offset + col
        y = y_offset - row
        color = color_map.get(v, 'gray')
        rect = patches.Rectangle((x, y), 1, 1, linewidth=1.2, edgecolor='black', facecolor=color)
        ax.add_patch(rect)
        ax.text(x + 0.5, y + 0.5, v, ha='center', va='center', fontsize=12)

# Fonction de comparaison visuelle
def draw_result_face(ax, position, predicted, reference):
    x_offset, y_offset = position
    for idx, (p, r) in enumerate(zip(predicted, reference)):
        row, col = divmod(idx, 3)
        x = x_offset + col
        y = y_offset - row
        bg_color = 'green' if p == r else 'red'
        rect = patches.Rectangle((x, y), 1, 1, linewidth=1.2, edgecolor='black', facecolor=bg_color)
        ax.add_patch(rect)
        ax.text(x + 0.5, y + 0.5, p, ha='center', va='center', fontsize=12, color='white' if p == r else 'black')

# Disposition des faces
face_positions = {
    'U': (3, 9),
    'L': (0, 6),
    'F': (3, 6),
    'R': (6, 6),
    'B': (9, 6),
    'D': (3, 3)
}

# Création du visuel triple
fig, axes = plt.subplots(1, 3, figsize=(18, 6))
titles = ["✅ Référence (attendu)", "🔍 Prédiction (obtenu)", "📊 Résultat (bon/mauvais)"]

for ax, title in zip(axes, titles):
    for face in ['U', 'L', 'F', 'R', 'B', 'D']:
        pos = face_positions[face]
        if title.startswith("✅"):
            draw_basic_face(ax, pos, ref_faces[face])
        elif title.startswith("🔍"):
            draw_basic_face(ax, pos, pred_faces[face])
        else:
            draw_result_face(ax, pos, pred_faces[face], ref_faces[face])
    ax.set_xlim(0, 12)
    ax.set_ylim(0, 12)
    ax.set_aspect('equal')
    ax.axis('off')
    ax.set_title(title, fontsize=14)

plt.tight_layout()
plt.savefig(output_path)
plt.show()
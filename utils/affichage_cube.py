import matplotlib.pyplot as plt
import matplotlib.patches as patches

# 📍 Coordonnées des faces dans une grille 3x4
face_positions = {
    'U': (3, 9),  # haut
    'L': (0, 6),
    'F': (3, 6),
    'R': (6, 6),
    'B': (9, 6),
    'D': (3, 3),  # bas
}

# 🎨 Couleurs d'affichage
color_map = {
    'U': 'yellow',   # Up
    'F': 'red',      # Front
    'R': 'green',    # Right
    'L': 'blue',     # Left
    'B': 'orange',   # Back
    'D': 'white'     # Down
}

def draw_basic_face(ax, origin, stickers):
    """
    Dessine une face de Rubik's Cube à partir de son origine et de ses stickers.
    ax : matplotlib axis
    origin : (x, y) coin bas gauche de la face
    stickers : 9 lettres représentant les couleurs (ligne par ligne)
    """
    x0, y0 = origin
    size = 1
    for i in range(3):
        for j in range(3):
            idx = i * 3 + j
            color = color_map.get(stickers[idx], 'gray')
            square = patches.Rectangle(
                (x0 + j, y0 + (2 - i)), size, size,
                facecolor=color, edgecolor='black', linewidth=1.5
            )
            ax.add_patch(square)
            ax.text(
                x0 + j + 0.5, y0 + (2 - i) + 0.5, stickers[idx],
                color='black', ha='center', va='center', fontsize=12, fontweight='bold'
            )
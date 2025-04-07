import matplotlib.pyplot as plt
import matplotlib.patches as patches

# 📍 Coordonnées des faces dans une grille 3x4
# Chaque face du Rubik's Cube est positionnée sur une grille 3x4 (3 lignes, 4 colonnes)
# Les coordonnées correspondent au coin inférieur gauche de chaque face
face_positions = {
    'U': (3, 9),  # Face du haut (Up)
    'L': (0, 6),  # Face gauche (Left)
    'F': (3, 6),  # Face avant (Front)
    'R': (6, 6),  # Face droite (Right)
    'B': (9, 6),  # Face arrière (Back)
    'D': (3, 3),  # Face du bas (Down)
}

# 🎨 Couleurs d'affichage
# Associe chaque face à une couleur pour l'affichage
color_map = {
    'U': 'yellow',   # Jaune pour la face du haut (Up)
    'F': 'red',      # Rouge pour la face avant (Front)
    'R': 'green',    # Vert pour la face droite (Right)
    'L': 'blue',     # Bleu pour la face gauche (Left)
    'B': 'orange',   # Orange pour la face arrière (Back)
    'D': 'white'     # Blanc pour la face du bas (Down)
}

def draw_basic_face(ax, origin, stickers):
    """
    Dessine une face de Rubik's Cube à partir de son origine et de ses stickers.
    
    Paramètres :
    - ax : matplotlib axis, l'axe sur lequel dessiner la face
    - origin : (x, y), coordonnées du coin inférieur gauche de la face
    - stickers : chaîne de 9 lettres représentant les couleurs (ligne par ligne)
    
    Fonctionnement :
    - La face est divisée en une grille 3x3.
    - Chaque case est dessinée avec une couleur correspondant à la lettre donnée.
    """
    x0, y0 = origin  # Coordonnées du coin inférieur gauche de la face
    size = 1  # Taille d'une case (chaque case est un carré de 1x1)
    
    # Parcours des 9 cases de la grille 3x3
    for i in range(3):  # Parcourt les lignes
        for j in range(3):  # Parcourt les colonnes
            idx = i * 3 + j  # Calcul de l'index du sticker correspondant
            color = color_map.get(stickers[idx], 'gray')  # Récupère la couleur associée au sticker
            
            # Dessine un carré représentant une case
            square = patches.Rectangle(
                (x0 + j, y0 + (2 - i)), size, size,  # Position et taille du carré
                facecolor=color, edgecolor='black', linewidth=1.5  # Couleur de remplissage et bordure
            )
            ax.add_patch(square)  # Ajoute le carré à l'axe
            
            # Ajoute la lettre du sticker au centre de la case
            ax.text(
                x0 + j + 0.5, y0 + (2 - i) + 0.5, stickers[idx],  # Position du texte
                color='black', ha='center', va='center',  # Alignement horizontal et vertical
                fontsize=12, fontweight='bold'  # Style du texte
            )
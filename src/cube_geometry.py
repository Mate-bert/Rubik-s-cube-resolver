"""
Module de géométrie du cube Rubik's.
Ce module définit la structure géométrique du cube et ses pièces.
"""

# Couleurs des faces du cube
FACE_COLORS = {
    'U': (1, 1, 0),      # Jaune
    'D': (1, 1, 1),      # Blanc
    'F': (1, 0, 0),      # Rouge
    'B': (1, 0.5, 0),    # Orange
    'R': (0, 1, 0),      # Vert
    'L': (0, 0, 1),      # Bleu
}

# Définition des pièces centrales
center_pieces = [
    # Face avant (F)
    [[-1, -1, 3],
     [-1, 1, 3],
     [1, 1, 3],
     [1, -1, 3],
     [-1, -1, 1],
     [-1, 1, 1],
     [1, 1, 1],
     [1, -1, 1]],

    # Face gauche (L)
    [[-3, -1, 1],
     [-3, 1, 1],
     [-1, 1, 1],
     [-1, -1, 1],
     [-3, -1, -1],
     [-3, 1, -1],
     [-1, 1, -1],
     [-1, -1, -1]],

    # Face arrière (B)
    [[-1, -1, -1],
     [-1, 1, -1],
     [1, 1, -1],
     [1, -1, -1],
     [-1, -1, -3],
     [-1, 1, -3],
     [1, 1, -3],
     [1, -1, -3]],

    # Face droite (R)
    [[1, -1, 1],
     [1, 1, 1],
     [3, 1, 1],
     [3, -1, 1],
     [1, -1, -1],
     [1, 1, -1],
     [3, 1, -1],
     [3, -1, -1]],

    # Face supérieure (U)
    [[-1, 1, 1],
     [-1, 3, 1],
     [1, 3, 1],
     [1, 1, 1],
     [-1, 1, -1],
     [-1, 3, -1],
     [1, 3, -1],
     [1, 1, -1]],

    # Face inférieure (D)
    [[-1, -3, 1],
     [-1, -1, 1],
     [1, -1, 1],
     [1, -3, 1],
     [-1, -3, -1],
     [-1, -1, -1],
     [1, -1, -1],
     [1, -3, -1]]
]

# Définition des pièces d'arête
edge_pieces = [
    # Arêtes X
    [
        # Arête inférieure avant
        [[-1, -3, 3],
         [-1, -1, 3],
         [1, -1, 3],
         [1, -3, 3],
         [-1, -3, 1],
         [-1, -1, 1],
         [1, -1, 1],
         [1, -3, 1]],

        # Arête supérieure avant
        [[-1, 1, 3],
         [-1, 3, 3],
         [1, 3, 3],
         [1, 1, 3],
         [-1, 1, 1],
         [-1, 3, 1],
         [1, 3, 1],
         [1, 1, 1]],

        # Arête supérieure arrière
        [[-1, 1, -1],
         [-1, 3, -1],
         [1, 3, -1],
         [1, 1, -1],
         [-1, 1, -3],
         [-1, 3, -3],
         [1, 3, -3],
         [1, 1, -3]],

        # Arête inférieure arrière
        [[-1, -3, -1],
         [-1, -1, -1],
         [1, -1, -1],
         [1, -3, -1],
         [-1, -3, -3],
         [-1, -1, -3],
         [1, -1, -3],
         [1, -3, -3]]
    ],

    # Arêtes Y
    [
        # Arête gauche avant
        [[-3, -1, 3],
         [-3, 1, 3],
         [-1, 1, 3],
         [-1, -1, 3],
         [-3, -1, 1],
         [-3, 1, 1],
         [-1, 1, 1],
         [-1, -1, 1]],

        # Arête gauche arrière
        [[-3, -1, -1],
         [-3, 1, -1],
         [-1, 1, -1],
         [-1, -1, -1],
         [-3, -1, -3],
         [-3, 1, -3],
         [-1, 1, -3],
         [-1, -1, -3]],

        # Arête droite arrière
        [[1, -1, -1],
         [1, 1, -1],
         [3, 1, -1],
         [3, -1, -1],
         [1, -1, -3],
         [1, 1, -3],
         [3, 1, -3],
         [3, -1, -3]],

        # Arête droite avant
        [[1, -1, 3],
         [1, 1, 3],
         [3, 1, 3],
         [3, -1, 3],
         [1, -1, 1],
         [1, 1, 1],
         [3, 1, 1],
         [3, -1, 1]]
    ],

    # Arêtes Z
    [
        # Arête inférieure gauche
        [[-3, -3, 1],
         [-3, -1, 1],
         [-1, -1, 1],
         [-1, -3, 1],
         [-3, -3, -1],
         [-3, -1, -1],
         [-1, -1, -1],
         [-1, -3, -1]],

        # Arête supérieure gauche
        [[-3, 1, 1],
         [-3, 3, 1],
         [-1, 3, 1],
         [-1, 1, 1],
         [-3, 1, -1],
         [-3, 3, -1],
         [-1, 3, -1],
         [-1, 1, -1]],

        # Arête supérieure droite
        [[1, 1, 1],
         [1, 3, 1],
         [3, 3, 1],
         [3, 1, 1],
         [1, 1, -1],
         [1, 3, -1],
         [3, 3, -1],
         [3, 1, -1]],

        # Arête inférieure droite
        [[1, -3, 1],
         [1, -1, 1],
         [3, -1, 1],
         [3, -3, 1],
         [1, -3, -1],
         [1, -1, -1],
         [3, -1, -1],
         [3, -3, -1]]
    ]
]

# Définition des pièces de coin
corner_pieces = [
    # Coin avant inférieur gauche
    [[-3, -3, 3],
     [-3, -1, 3],
     [-1, -1, 3],
     [-1, -3, 3],
     [-3, -3, 1],
     [-3, -1, 1],
     [-1, -1, 1],
     [-1, -3, 1]],

    # Coin avant supérieur gauche
    [[-3, 1, 3],
     [-3, 3, 3],
     [-1, 3, 3],
     [-1, 1, 3],
     [-3, 1, 1],
     [-3, 3, 1],
     [-1, 3, 1],
     [-1, 1, 1]],

    # Coin avant supérieur droit
    [[1, 1, 3],
     [1, 3, 3],
     [3, 3, 3],
     [3, 1, 3],
     [1, 1, 1],
     [1, 3, 1],
     [3, 3, 1],
     [3, 1, 1]],

    # Coin avant inférieur droit
    [[1, -3, 3],
     [1, -1, 3],
     [3, -1, 3],
     [3, -3, 3],
     [1, -3, 1],
     [1, -1, 1],
     [3, -1, 1],
     [3, -3, 1]],

    # Coin arrière inférieur gauche
    [[-3, -3, -1],
     [-3, -1, -1],
     [-1, -1, -1],
     [-1, -3, -1],
     [-3, -3, -3],
     [-3, -1, -3],
     [-1, -1, -3],
     [-1, -3, -3]],

    # Coin arrière supérieur gauche
    [[-3, 1, -1],
     [-3, 3, -1],
     [-1, 3, -1],
     [-1, 1, -1],
     [-3, 1, -3],
     [-3, 3, -3],
     [-1, 3, -3],
     [-1, 1, -3]],

    # Coin arrière supérieur droit
    [[1, 1, -1],
     [1, 3, -1],
     [3, 3, -1],
     [3, 1, -1],
     [1, 1, -3],
     [1, 3, -3],
     [3, 3, -3],
     [3, 1, -3]],

    # Coin arrière inférieur droit
    [[1, -3, -1],
     [1, -1, -1],
     [3, -1, -1],
     [3, -3, -1],
     [1, -3, -3],
     [1, -1, -3],
     [3, -1, -3],
     [3, -3, -3]]
]

def apply_padding(pad_value):
    """
    Applique un espacement entre les pièces du cube.
    
    Args:
        pad_value (float): Valeur de l'espacement à appliquer
    """
    # Espacement des pièces centrales
    for piece in center_pieces:
        for vertex in piece:
            if abs(vertex[2]) > 0:  # Face avant/arrière
                vertex[2] += pad_value if vertex[2] > 0 else -pad_value
            if abs(vertex[0]) > 0:  # Face gauche/droite
                vertex[0] += pad_value if vertex[0] > 0 else -pad_value
            if abs(vertex[1]) > 0:  # Face supérieure/inférieure
                vertex[1] += pad_value if vertex[1] > 0 else -pad_value

    # Espacement des pièces d'arête
    for axis in edge_pieces:
        for piece in axis:
            for vertex in piece:
                if abs(vertex[2]) > 0:
                    vertex[2] += pad_value if vertex[2] > 0 else -pad_value
                if abs(vertex[0]) > 0:
                    vertex[0] += pad_value if vertex[0] > 0 else -pad_value
                if abs(vertex[1]) > 0:
                    vertex[1] += pad_value if vertex[1] > 0 else -pad_value

    # Espacement des pièces de coin
    for piece in corner_pieces:
        for vertex in piece:
            if abs(vertex[2]) > 0:
                vertex[2] += pad_value if vertex[2] > 0 else -pad_value
            if abs(vertex[0]) > 0:
                vertex[0] += pad_value if vertex[0] > 0 else -pad_value
            if abs(vertex[1]) > 0:
                vertex[1] += pad_value if vertex[1] > 0 else -pad_value 
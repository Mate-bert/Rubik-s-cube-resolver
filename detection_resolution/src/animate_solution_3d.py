# Fichier : animate_solution_3d.py
# Rôle : Affiche et anime un cube Rubik's 3D avec une solution
# Auteur : Gad Katamba
# Date : 2025-05-17

import pygame
from pygame.locals import *
from OpenGL.GL import *
from OpenGL.GLU import *
from pathlib import Path
import sys
import copy
import numpy as np
from math import pi
import re
from itertools import permutations

# Chargement dynamique des modules
sys.path.append(str(Path(__file__).resolve().parents[1]))
from utils.config_loader import load_config
from src.quaternion import (
    normalize, quaternion_multiply, axis_angle_to_quaternion,
    quaternion_to_matrix, rotate_x, rotate_y, rotate_z
)
from src.cube_geometry import (
    FACE_COLORS, center_pieces, edge_pieces, corner_pieces,
    apply_padding
)
from src.cube_animation import CubeAnimation
from src.cubie import Cubie

# Chargement de la configuration
cfg = load_config()

# Récupération des chemins depuis le fichier YAML
etat_initial_path = Path(cfg["paths"]["kociemba_test"])
solution_path = Path(cfg["paths"]["solver_output"])

# Normales et centres des faces
FACE_DEFS = [
    ((0, 1, 0), (0, 1.01, 0), 'U'),    # Up
    ((0, -1, 0), (0, -1.01, 0), 'D'),  # Down
    ((0, 0, 1), (0, 0, 1.01), 'F'),    # Front
    ((0, 0, -1), (0, 0, -1.01), 'B'),  # Back
    ((1, 0, 0), (1.01, 0, 0), 'R'),    # Right
    ((-1, 0, 0), (-1.01, 0, 0), 'L'),  # Left
]

LETTER_TO_COLOR = {
    'U': (1, 1, 0),      # Jaune
    'F': (1, 0, 0),      # Rouge
    'R': (0, 1, 0),      # Vert
    'L': (0, 0, 1),      # Bleu
    'B': (1, 0.5, 0),    # Orange
    'D': (1, 1, 1),      # Blanc
}

def draw_sticker(center, normal, u_vec, v_vec, color, size=0.6):
    """Dessine un sticker sur une face du cube."""
    half = size / 2
    glColor3fv(color)
    glBegin(GL_QUADS)
    for du, dv in [(-half, -half), (half, -half), (half, half), (-half, half)]:
        x = center[0] + du * u_vec[0] + dv * v_vec[0]
        y = center[1] + du * u_vec[1] + dv * v_vec[1]
        z = center[2] + du * u_vec[2] + dv * v_vec[2]
        glVertex3f(x, y, z)
    glEnd()

def draw_cube_body(size=2.0):
    """Dessine le corps du cube."""
    glColor3f(0.1, 0.1, 0.1)  # gris très foncé
    half = size / 2
    vertices = [
        (-half, -half, -half),
        ( half, -half, -half),
        ( half,  half, -half),
        (-half,  half, -half),
        (-half, -half,  half),
        ( half, -half,  half),
        ( half,  half,  half),
        (-half,  half,  half),
    ]
    faces = [
        (0,1,2,3),  # back
        (4,5,6,7),  # front
        (0,1,5,4),  # bottom
        (2,3,7,6),  # top
        (0,3,7,4),  # left
        (1,2,6,5),  # right
    ]
    glBegin(GL_QUADS)
    for face in faces:
        for vertex in face:
            glVertex3fv(vertices[vertex])
    glEnd()

def draw_piece(piece):
    """Dessine une pièce du cube."""
    glBegin(GL_QUADS)
    # Face avant
    glVertex3fv(piece[0])
    glVertex3fv(piece[1])
    glVertex3fv(piece[2])
    glVertex3fv(piece[3])
    # Face arrière
    glVertex3fv(piece[4])
    glVertex3fv(piece[5])
    glVertex3fv(piece[6])
    glVertex3fv(piece[7])
    # Face supérieure
    glVertex3fv(piece[1])
    glVertex3fv(piece[5])
    glVertex3fv(piece[6])
    glVertex3fv(piece[2])
    # Face inférieure
    glVertex3fv(piece[0])
    glVertex3fv(piece[4])
    glVertex3fv(piece[7])
    glVertex3fv(piece[3])
    # Face gauche
    glVertex3fv(piece[0])
    glVertex3fv(piece[1])
    glVertex3fv(piece[5])
    glVertex3fv(piece[4])
    # Face droite
    glVertex3fv(piece[3])
    glVertex3fv(piece[2])
    glVertex3fv(piece[6])
    glVertex3fv(piece[7])
    glEnd()

def draw_rubiks_cube(state, rotated_center_pieces=None, rotated_edge_pieces=None, rotated_corner_pieces=None):
    """Dessine le cube Rubik's avec l'état donné."""
    draw_cube_body(size=2.0)
    sticker_size = 0.6
    gap = 0.08

    # Utiliser les pièces rotées si fournies, sinon utiliser les pièces originales
    center_pieces_to_use = rotated_center_pieces if rotated_center_pieces else center_pieces
    edge_pieces_to_use = rotated_edge_pieces if rotated_edge_pieces else edge_pieces
    corner_pieces_to_use = rotated_corner_pieces if rotated_corner_pieces else corner_pieces

    # Pour chaque face
    for normal, center, face in FACE_DEFS:
        # Vecteurs u et v pour parcourir la grille 3x3 sur la face
        if face in ['U', 'D']:
            u_vec = (1, 0, 0)
            v_vec = (0, 0, 1)
        elif face in ['F', 'B']:
            u_vec = (1, 0, 0)
            v_vec = (0, 1, 0)
        else:  # R, L
            u_vec = (0, 0, 1)
            v_vec = (0, 1, 0)
        # Pour chaque sticker 3x3
        for i in range(3):
            for j in range(3):
                # Position du centre du sticker
                offset_u = (i - 1) * (sticker_size + gap)
                offset_v = (j - 1) * (sticker_size + gap)
                cx = center[0] + offset_u * u_vec[0] + offset_v * v_vec[0]
                cy = center[1] + offset_u * u_vec[1] + offset_v * v_vec[1]
                cz = center[2] + offset_u * u_vec[2] + offset_v * v_vec[2]
                # Utiliser la couleur correspondant au sticker dans l'état actuel
                sticker_color = FACE_COLORS[state[face][i][j]]
                draw_sticker((cx, cy, cz), normal, u_vec, v_vec, sticker_color, size=sticker_size)

    # Dessiner les pièces d'arête
    for axis in edge_pieces_to_use:
        for piece in axis:
            glColor3fv((0.2, 0.2, 0.2))  # Couleur grise pour les arêtes
            draw_piece(piece)

    # Dessiner les pièces de coin
    for piece in corner_pieces_to_use:
        glColor3fv((0.2, 0.2, 0.2))  # Couleur grise pour les coins
        draw_piece(piece)

def rotate_face(face, times=1):
    """Fait pivoter une face du cube."""
    # Rotation de la face elle-même
    for _ in range(times):
        face = [
            [face[2][0], face[1][0], face[0][0]],
            [face[2][1], face[1][1], face[0][1]],
            [face[2][2], face[1][2], face[0][2]]
        ]
    return face

def rotate_adjacent(cube, face, turns=1):
    """Fait pivoter les faces adjacentes lors d'une rotation."""
    for _ in range(turns):
        if face == 'U':
            # Rotation des pièces d'arête et de coin
            for i in range(8):
                # Rotation des pièces d'arête
                for piece in edge_pieces[0]:
                    if piece[0][1] > 0:  # Si la pièce est sur la face supérieure
                        for vertex in piece:
                            vertex[0], vertex[2] = -vertex[2], vertex[0]
                # Rotation des pièces de coin
                for piece in corner_pieces:
                    if piece[0][1] > 0:  # Si la pièce est sur la face supérieure
                        for vertex in piece:
                            vertex[0], vertex[2] = -vertex[2], vertex[0]
            
            # Mise à jour des couleurs des faces adjacentes
            F, R, B, L = cube['F'], cube['R'], cube['B'], cube['L']
            F0, R0, B0, L0 = F[0][:], R[0][:], B[0][:], L[0][:]
            F[0], R[0], B[0], L[0] = R0, B0, L0, F0

        elif face == 'D':
            # Rotation des pièces d'arête et de coin
            for i in range(8):
                # Rotation des pièces d'arête
                for piece in edge_pieces[0]:
                    if piece[0][1] < 0:  # Si la pièce est sur la face inférieure
                        for vertex in piece:
                            vertex[0], vertex[2] = vertex[2], -vertex[0]
                # Rotation des pièces de coin
                for piece in corner_pieces:
                    if piece[0][1] < 0:  # Si la pièce est sur la face inférieure
                        for vertex in piece:
                            vertex[0], vertex[2] = vertex[2], -vertex[0]
            
            # Mise à jour des couleurs des faces adjacentes
            F, L, B, R = cube['F'], cube['L'], cube['B'], cube['R']
            F2, L2, B2, R2 = F[2][:], L[2][:], B[2][:], R[2][:]
            F[2], L[2], B[2], R[2] = L2, B2, R2, F2

        elif face == 'F':
            # Rotation des pièces d'arête et de coin
            for i in range(8):
                # Rotation des pièces d'arête
                for piece in edge_pieces[1]:
                    if piece[0][2] > 0:  # Si la pièce est sur la face avant
                        for vertex in piece:
                            vertex[0], vertex[1] = vertex[1], -vertex[0]
                # Rotation des pièces de coin
                for piece in corner_pieces:
                    if piece[0][2] > 0:  # Si la pièce est sur la face avant
                        for vertex in piece:
                            vertex[0], vertex[1] = vertex[1], -vertex[0]
            
            # Mise à jour des couleurs des faces adjacentes
            U, R, D, L = cube['U'], cube['R'], cube['D'], cube['L']
            tmp = [U[2][i] for i in range(3)]
            for i in range(3):
                U[2][i] = L[2 - i][2]
                L[2 - i][2] = D[0][2 - i]
                D[0][2 - i] = R[i][0]
                R[i][0] = tmp[i]

        elif face == 'B':
            # Rotation des pièces d'arête et de coin
            for i in range(8):
                # Rotation des pièces d'arête
                for piece in edge_pieces[1]:
                    if piece[0][2] < 0:  # Si la pièce est sur la face arrière
                        for vertex in piece:
                            vertex[0], vertex[1] = -vertex[1], vertex[0]
                # Rotation des pièces de coin
                for piece in corner_pieces:
                    if piece[0][2] < 0:  # Si la pièce est sur la face arrière
                        for vertex in piece:
                            vertex[0], vertex[1] = -vertex[1], vertex[0]
            
            # Mise à jour des couleurs des faces adjacentes
            U, R, D, L = cube['U'], cube['R'], cube['D'], cube['L']
            tmp = [U[0][i] for i in range(3)]
            for i in range(3):
                U[0][i] = R[i][2]
                R[i][2] = D[2][2 - i]
                D[2][2 - i] = L[2 - i][0]
                L[2 - i][0] = tmp[i]

        elif face == 'L':
            # Rotation des pièces d'arête et de coin
            for i in range(8):
                # Rotation des pièces d'arête
                for piece in edge_pieces[2]:
                    if piece[0][0] < 0:  # Si la pièce est sur la face gauche
                        for vertex in piece:
                            vertex[1], vertex[2] = -vertex[2], vertex[1]
                # Rotation des pièces de coin
                for piece in corner_pieces:
                    if piece[0][0] < 0:  # Si la pièce est sur la face gauche
                        for vertex in piece:
                            vertex[1], vertex[2] = -vertex[2], vertex[1]
            
            # Mise à jour des couleurs des faces adjacentes
            U, F, D, B = cube['U'], cube['F'], cube['D'], cube['B']
            tmp = [U[i][0] for i in range(3)]
            for i in range(3):
                U[i][0] = B[2 - i][2]
                B[2 - i][2] = D[i][0]
                D[i][0] = F[i][0]
                F[i][0] = tmp[i]

        elif face == 'R':
            # Rotation des pièces d'arête et de coin
            for i in range(8):
                # Rotation des pièces d'arête
                for piece in edge_pieces[2]:
                    if piece[0][0] > 0:  # Si la pièce est sur la face droite
                        for vertex in piece:
                            vertex[1], vertex[2] = vertex[2], -vertex[1]
                # Rotation des pièces de coin
                for piece in corner_pieces:
                    if piece[0][0] > 0:  # Si la pièce est sur la face droite
                        for vertex in piece:
                            vertex[1], vertex[2] = vertex[2], -vertex[1]
            
            # Mise à jour des couleurs des faces adjacentes
            U, F, D, B = cube['U'], cube['F'], cube['D'], cube['B']
            tmp = [U[i][2] for i in range(3)]
            for i in range(3):
                U[i][2] = F[i][2]
                F[i][2] = D[i][2]
                D[i][2] = B[2 - i][0]
                B[2 - i][0] = tmp[i]

def apply_move(state, move):
    """Applique un mouvement au cube."""
    cube = copy.deepcopy(state)
    move = move.strip()
    face = move[0]
    suffix = move[1:] if len(move) > 1 else ''
    turns = {"": 1, "'": 3, "2": 2}.get(suffix, 1)

    cube[face] = rotate_face(cube[face], turns)
    rotate_adjacent(cube, face, turns)
    return cube

# Remplacement de load_state par la version mapping manuel de test_cube_3d.py
FILE_FACE_ORDER = ['U', 'R', 'F', 'D', 'L', 'B']
U_POSITIONS = [ (2,0),(1,0),(0,0), (2,1),(1,1),(0,1), (2,2),(1,2),(0,2) ]
R_POSITIONS = [ (0,2),(1,2),(2,2), (0,1),(1,1),(2,1), (0,0),(1,0),(2,0) ]
F_POSITIONS = [ (2,2),(1,2),(0,2), (2,1),(1,1),(0,1), (2,0),(1,0),(0,0) ]
D_POSITIONS = [ (2,2),(1,2),(0,2), (2,1),(1,1),(0,1), (2,0),(1,0),(0,0) ]
L_POSITIONS = [ (0,2),(1,2),(2,2), (0,1),(1,1),(2,1), (0,0),(1,0),(2,0) ]
B_POSITIONS = [ (2,2),(1,2),(0,2), (2,1),(1,1),(0,1), (2,0),(1,0),(0,0) ]
FACE_POSITIONS = {
    'U': U_POSITIONS,
    'R': R_POSITIONS,
    'F': F_POSITIONS,
    'D': D_POSITIONS,
    'L': L_POSITIONS,
    'B': B_POSITIONS,
}
def load_state(filepath):
    with open(filepath, "r") as f:
        lines = [l.strip().replace('"', '').replace(',', '') for l in f if l.strip()]
    state = {}
    for line, face in zip(lines, FILE_FACE_ORDER):
        face_name, stickers = line.split(":")
        grid = [[None for _ in range(3)] for _ in range(3)]
        positions = FACE_POSITIONS[face]
        for idx, (i, j) in enumerate(positions):
            grid[i][j] = stickers[idx]
        state[face] = grid
    return state

def print_cube_state(state):
    for face in FILE_FACE_ORDER:
        print(f"Face {face}:")
        for row in state[face]:
            print('  ' + ' '.join(row))

def load_solution(filepath):
    """Charge la solution depuis un fichier texte, en filtrant les points et en s'arrêtant à la balise (nombre de mouvements)."""
    with open(filepath, "r") as f:
        raw = f.read().strip()
    # Extraire le nombre de mouvements à la fin (ex: (19))
    match = re.search(r"\((\d+)\)\s*$", raw)
    if match:
        n_moves = int(match.group(1))
        raw = raw[:match.start()]
    else:
        n_moves = None
    moves = [m for m in raw.replace('(', '').replace(')', '').split() if m not in ['.', ''] and not m.isdigit()]
    if n_moves is not None:
        moves = moves[:n_moves]
    return moves

# Définition des coins et arêtes du cube résolu (faces dans l'ordre UFR, etc.)
CORNERS = [
    ('U', 'F', 'R'), ('U', 'R', 'B'), ('U', 'B', 'L'), ('U', 'L', 'F'),
    ('D', 'F', 'L'), ('D', 'L', 'B'), ('D', 'B', 'R'), ('D', 'R', 'F')
]
CORNERS_POS = [
    (2,2,2), (2,2,0), (0,2,0), (0,2,2),
    (0,0,2), (0,0,0), (2,0,0), (2,0,2)
]
CORNERS_ORIENT = [
    ('U','F','R'), ('U','R','B'), ('U','B','L'), ('U','L','F'),
    ('D','F','L'), ('D','L','B'), ('D','B','R'), ('D','R','F')
]

EDGES = [
    ('U','F'), ('U','R'), ('U','B'), ('U','L'),
    ('D','F'), ('D','R'), ('D','B'), ('D','L'),
    ('F','R'), ('B','R'), ('B','L'), ('F','L')
]
EDGES_POS = [
    (1,2,2), (2,2,1), (1,2,0), (0,2,1),
    (1,0,2), (2,0,1), (1,0,0), (0,0,1),
    (2,1,2), (2,1,0), (0,1,0), (0,1,2)
]
EDGES_ORIENT = [
    ('U','F'), ('U','R'), ('U','B'), ('U','L'),
    ('D','F'), ('D','R'), ('D','B'), ('D','L'),
    ('F','R'), ('B','R'), ('B','L'), ('F','L')
]

CENTERS = [
    ('U',), ('D',), ('F',), ('B',), ('R',), ('L',)
]
CENTERS_POS = [
    (1,2,1), (1,0,1), (1,1,2), (1,1,0), (2,1,1), (0,1,1)
]

# Fonction utilitaire pour trouver l'orientation d'un coin/arête
def find_corner(stickers):
    """Trouve l'index et l'orientation d'un coin à partir de ses stickers."""
    # Normaliser les stickers pour qu'ils soient dans l'ordre UFR
    for idx, model in enumerate(CORNERS):
        # Vérifier toutes les permutations possibles
        for perm in permutations(stickers):
            if perm == model:
                return idx, 0  # orientation 0
            elif perm == (model[1], model[2], model[0]):
                return idx, 1  # orientation 1
            elif perm == (model[2], model[0], model[1]):
                return idx, 2  # orientation 2
    print(f"[DEBUG] Coin non trouvé pour stickers {stickers}")
    print(f"[DEBUG] Modèles disponibles: {CORNERS}")
    return None, None

def find_edge(stickers):
    """Trouve l'index et l'orientation d'une arête à partir de ses stickers."""
    for idx, model in enumerate(EDGES):
        if stickers == model:
            return idx, 0
        elif stickers == (model[1], model[0]):
            return idx, 1
    print(f"[DEBUG] Arête non trouvée pour stickers {stickers}")
    print(f"[DEBUG] Modèles disponibles: {EDGES}")
    return None, None

def init_cubies_from_state(state):
    """
    Reconstruit la permutation et l'orientation des cubies à partir des stickers de l'état initial.
    Affiche les stickers de chaque coin pour debug.
    """
    cubies = []
    # Coins
    corner_sticker_pos = [
        # (face, i, j) pour chaque coin dans l'ordre UFR, URB, UBL, ULF, DFL, DLB, DRB, DFR
        [('U',0,2),('F',0,2),('R',0,0)],  # UFR
        [('U',0,0),('R',0,2),('B',0,2)],  # URB
        [('U',2,0),('B',0,0),('L',0,2)],  # UBL
        [('U',2,2),('L',0,0),('F',0,0)],  # ULF
        [('D',0,0),('F',2,0),('L',2,2)],  # DFL
        [('D',0,2),('L',2,0),('B',2,0)],  # DLB
        [('D',2,2),('B',2,2),('R',2,0)],  # DRB
        [('D',2,0),('R',2,2),('F',2,2)],  # DFR
    ]
    print("--- Coins trouvés dans l'état initial ---")
    for idx, (pos, sticker_pos) in enumerate(zip(CORNERS_POS, corner_sticker_pos)):
        stickers = tuple(state[face][i][j] for face,i,j in sticker_pos)
        print(f"Coin {idx} pos {pos} stickers {stickers}")
        idx_found, orient = find_corner(stickers)
        if idx_found is None:
            print(f"[ERREUR] Coin non trouvé pour stickers {stickers}")
            continue
        # Remettre les couleurs dans l'ordre UFR pour ce cubie
        colors = {}
        for k, face in enumerate(('U','F','R')):
            color_letter = stickers[(k-orient)%3]
            colors[face] = LETTER_TO_COLOR[color_letter]
        cubie = Cubie(pos, scale=1.5)
        cubie.face_colors = colors
        cubies.append(cubie)
    # Arêtes
    edge_sticker_pos = [
        # (face, i, j) pour chaque arête dans l'ordre UF, UR, UB, UL, DF, DR, DB, DL, FR, BR, BL, FL
        [('U',1,2),('F',0,1)],  # UF
        [('U',0,1),('R',0,1)],  # UR
        [('U',1,0),('B',0,1)],  # UB
        [('U',2,1),('L',0,1)],  # UL
        [('D',1,0),('F',2,1)],  # DF
        [('D',0,1),('R',2,1)],  # DR
        [('D',1,2),('B',2,1)],  # DB
        [('D',2,1),('L',2,1)],  # DL
        [('F',1,2),('R',1,0)],  # FR
        [('B',1,2),('R',1,2)],  # BR
        [('B',1,0),('L',1,2)],  # BL
        [('F',1,0),('L',1,0)],  # FL
    ]
    for pos, sticker_pos in zip(EDGES_POS, edge_sticker_pos):
        stickers = tuple(state[face][i][j] for face,i,j in sticker_pos)
        idx, orient = find_edge(stickers)
        if idx is None:
            print(f"[ERREUR] Arête non trouvée pour stickers {stickers}")
            continue
        colors = {}
        for k, face in enumerate(('U','F')):
            color_letter = stickers[(k-orient)%2]
            colors[face] = LETTER_TO_COLOR[color_letter]
        cubie = Cubie(pos, scale=1.5)
        cubie.face_colors = colors
        cubies.append(cubie)
    # Centres
    center_sticker_pos = [
        ('U',1,1),('D',1,1),('F',1,1),('B',1,1),('R',1,1),('L',1,1)
    ]
    for pos, sticker_pos in zip(CENTERS_POS, center_sticker_pos):
        face, i, j = sticker_pos
        color_letter = state[face][i][j]
        colors = {face: LETTER_TO_COLOR[color_letter]}
        cubie = Cubie(pos, scale=1.5)
        cubie.face_colors = colors
        cubies.append(cubie)
    return cubies

def get_rotation_axis_and_slice(move):
    """Retourne l'axe (0:x, 1:y, 2:z), l'indice de la tranche, et le sens pour un move ('U', 'D', etc)."""
    face = move[0]
    suffix = move[1:] if len(move) > 1 else ''
    turns = {"": 1, "'": -1, "2": 2}.get(suffix, 1)
    # U: y=2, D: y=0, F: z=2, B: z=0, R: x=2, L: x=0
    if face == 'U':
        return 1, 2, turns
    if face == 'D':
        return 1, 0, turns
    if face == 'F':
        return 2, 2, turns
    if face == 'B':
        return 2, 0, turns
    if face == 'R':
        return 0, 2, turns
    if face == 'L':
        return 0, 0, turns
    raise ValueError(f"Move inconnu: {move}")

def main():
    pygame.init()
    screen = pygame.display.set_mode((800, 600), DOUBLEBUF | OPENGL)
    pygame.display.set_caption("Rubik's Cube 3D - Animation de la solution")

    glEnable(GL_DEPTH_TEST)
    glMatrixMode(GL_PROJECTION)
    gluPerspective(45, (800 / 600), 0.1, 100.0)
    glMatrixMode(GL_MODELVIEW)
    glTranslatef(0.0, 0.0, -40.0)

    # Chargement de l'état initial et de la séquence de mouvements
    current_state = load_state(etat_initial_path)
    moves = load_solution(solution_path)
    current_move_index = 0
    move_timer = 0
    move_delay = 700  # Délai entre les mouvements en millisecondes

    # Générer les cubies à partir de l'état initial
    cubies = init_cubies_from_state(current_state)

    # Variables pour la rotation de la vue
    inc_x = 0
    inc_y = 0
    ang_x = 0
    ang_y = 0
    zoom = 1

    # Animation de tranche
    animating = False
    anim_axis = 0
    anim_slice = 0
    anim_dir = 1
    anim_angle = 0
    anim_speed = 6  # degrés par frame
    move_pending = False

    clock = pygame.time.Clock()
    running = True
    while running:
        current_time = pygame.time.get_ticks()
        clock.tick(60)
        
        for event in pygame.event.get():
            if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
                running = False
            elif event.type == KEYDOWN:
                if event.key == K_LEFT:
                    inc_y = 2
                elif event.key == K_RIGHT:
                    inc_y = -2
                elif event.key == K_UP:
                    inc_x = 2
                elif event.key == K_DOWN:
                    inc_x = -2
                # Désactiver le contrôle manuel pendant l'animation automatique
                # (décommenter pour le réactiver)
                # elif not animating:
                #     ...
            elif event.type == KEYUP:
                if event.key in [K_LEFT, K_RIGHT]:
                    inc_y = 0
                elif event.key in [K_UP, K_DOWN]:
                    inc_x = 0
            elif event.type == MOUSEBUTTONDOWN:
                if event.button == 4 and zoom < 1.6:
                    zoom += 0.05
                elif event.button == 5 and zoom > 0.3:
                    zoom -= 0.05

        ang_x += inc_x
        ang_y += inc_y

        # Animation automatique de la séquence
        if not animating and current_move_index < len(moves):
            if current_time - move_timer >= move_delay:
                move = moves[current_move_index]
                print(f"[DEBUG] Mouvement en cours : {move}")
                print_cube_state(current_state)  # Affiche l'état du cube après chaque mouvement
                # Décoder le mouvement
                face = move[0].upper()
                suffix = move[1:] if len(move) > 1 else ''
                axis = slice_idx = dir = None
                if face == 'U':
                    axis, slice_idx, dir = 1, 2, 1
                elif face == 'D':
                    axis, slice_idx, dir = 1, 0, 1
                elif face == 'F':
                    axis, slice_idx, dir = 2, 2, 1
                elif face == 'B':
                    axis, slice_idx, dir = 2, 0, 1
                elif face == 'R':
                    axis, slice_idx, dir = 0, 2, 1
                elif face == 'L':
                    axis, slice_idx, dir = 0, 0, 1
                if axis is not None:
                    if suffix == "'":
                        dir = -dir
                    elif suffix == "2":
                        # Pour un mouvement 180°, on animera deux fois 90°
                        dir = dir
                        moves.insert(current_move_index+1, face)  # Ajoute un second mouvement identique
                    animating = True
                    anim_axis = axis
                    anim_slice = slice_idx
                    anim_dir = dir
                    anim_angle = 0
                    move_pending = False
                move_timer = current_time

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glLoadIdentity()
        glTranslatef(0, 0, -40)
        glRotatef(ang_y, 0, 1, 0)
        glRotatef(ang_x, 1, 0, 0)
        glScalef(zoom, zoom, zoom)

        if animating:
            anim_angle += anim_speed
            if anim_angle >= 90:
                anim_angle = 90
            for cubie in cubies:
                cubie.draw(animate=True, angle=anim_angle, axis=anim_axis, slice_idx=anim_slice, dir=anim_dir)
            if anim_angle >= 90:
                for cubie in cubies:
                    cubie.update(anim_axis, anim_slice, anim_dir)
                animating = False
                anim_angle = 0
                current_move_index += 1
        else:
            for cubie in cubies:
                cubie.draw()

        pygame.display.flip()

    pygame.quit()

if __name__ == "__main__":
    main()

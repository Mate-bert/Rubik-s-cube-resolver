# Fichier : animate_solution.py
# Rôle : Génère une animation 2D de la résolution d’un Rubik’s Cube à partir d’une configuration initiale et d’une solution.
# Auteur : Gad Katamba
# Date : 2025-05-17
import matplotlib
matplotlib.use("TkAgg")
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import matplotlib.animation as animation
from pathlib import Path
import sys
import copy

# Chargement dynamique du dossier utils
sys.path.append(str(Path(__file__).resolve().parents[1]))
from utils.config_loader import load_config
from utils.affichage_cube import face_positions

# Chargement de la configuration
cfg = load_config()

# Récupération des chemins depuis le fichier YAML
etat_initial_path = Path(cfg["paths"]["kociemba_test"])
solution_path = Path(cfg["paths"]["solver_output"])

# Couleurs mappées pour l'affichage (tu peux adapter selon ton usage réel)
FACE_COLORS = {
    'U': 'yellow',
    'R': 'green',
    'F': 'red',
    'D': 'white',
    'L': 'blue',
    'B': 'orange'
}

FACE_ORDER = ['U', 'R', 'F', 'D', 'L', 'B']

def draw_cube(state, ax):
    ax.clear()
    ax.set_xlim(0, 12)
    ax.set_ylim(0, 12)
    ax.set_aspect('equal')
    ax.axis('off')

    for face, grid in state.items():
        x_offset, y_offset = face_positions[face]
        for i in range(3):
            for j in range(3):
                color = FACE_COLORS.get(grid[i][j], 'gray')
                square = patches.Rectangle(
                    (x_offset + j, y_offset - i), 1, 1,
                    edgecolor='black', facecolor=color
                )
                ax.add_patch(square)

    if hasattr(draw_cube, "moves"):
        step = draw_cube.step
        if step < len(draw_cube.moves):
            ax.set_title(f"Étape {step+1} : {draw_cube.moves[step]}", fontsize=14)
        draw_cube.step += 1

def load_state(filepath):
    with open(filepath, "r") as f:
        lines = f.readlines()
    state = {}
    for line in lines:
        if not line.strip():
            continue
        face, stickers = line.strip().replace('"', '').split(":")
        grid = [list(stickers[i:i+3]) for i in range(0, 9, 3)]
        state[face] = grid
    return state

def rotate_face(face, times=1):
    for _ in range(times):
        face = [
            [face[2][0], face[1][0], face[0][0]],
            [face[2][1], face[1][1], face[0][1]],
            [face[2][2], face[1][2], face[0][2]]
        ]
    return face

def rotate_adjacent(cube, face, turns=1):
    for _ in range(turns):
        if face == 'U':
            F, R, B, L = cube['F'], cube['R'], cube['B'], cube['L']
            F0, R0, B0, L0 = F[0][:], R[0][:], B[0][:], L[0][:]
            F[0], R[0], B[0], L[0] = R0, B0, L0, F0
        elif face == 'D':
            F, L, B, R = cube['F'], cube['L'], cube['B'], cube['R']
            F2, L2, B2, R2 = F[2][:], L[2][:], B[2][:], R[2][:]
            F[2], L[2], B[2], R[2] = L2, B2, R2, F2
        elif face == 'F':
            U, R, D, L = cube['U'], cube['R'], cube['D'], cube['L']
            tmp = [U[2][i] for i in range(3)]
            for i in range(3):
                U[2][i] = L[2 - i][2]
                L[2 - i][2] = D[0][2 - i]
                D[0][2 - i] = R[i][0]
                R[i][0] = tmp[i]
        elif face == 'B':
            U, R, D, L = cube['U'], cube['R'], cube['D'], cube['L']
            tmp = [U[0][i] for i in range(3)]
            for i in range(3):
                U[0][i] = R[i][2]
                R[i][2] = D[2][2 - i]
                D[2][2 - i] = L[2 - i][0]
                L[2 - i][0] = tmp[i]
        elif face == 'L':
            U, F, D, B = cube['U'], cube['F'], cube['D'], cube['B']
            tmp = [U[i][0] for i in range(3)]
            for i in range(3):
                U[i][0] = B[2 - i][2]
                B[2 - i][2] = D[i][0]
                D[i][0] = F[i][0]
                F[i][0] = tmp[i]
        elif face == 'R':
            U, F, D, B = cube['U'], cube['F'], cube['D'], cube['B']
            tmp = [U[i][2] for i in range(3)]
            for i in range(3):
                U[i][2] = F[i][2]
                F[i][2] = D[i][2]
                D[i][2] = B[2 - i][0]
                B[2 - i][0] = tmp[i]

def apply_move(state, move):
    cube = copy.deepcopy(state)
    move = move.strip()
    face = move[0]
    suffix = move[1:] if len(move) > 1 else ''
    turns = {"": 1, "'": 3, "2": 2}.get(suffix, 1)

    cube[face] = rotate_face(cube[face], turns)
    rotate_adjacent(cube, face, turns)
    return cube

def apply_moves(state, moves):
    states = []
    current = copy.deepcopy(state)
    for move in moves:
        current = apply_move(current, move)
        states.append(copy.deepcopy(current))
    return states

def animate_solution():
    initial_state = load_state(etat_initial_path)
    with open(solution_path, "r") as f:
        raw = f.read().strip()

    # Nettoyage des caractères indésirables
    raw = raw.replace('(', '').replace(')', '')
    moves = [m for m in raw.split() if m not in ['.', ''] and not m.isdigit()]

    states = apply_moves(initial_state, moves)

    draw_cube.step = 0
    draw_cube.moves = moves

    fig, ax = plt.subplots()
    ani = animation.FuncAnimation(fig, draw_cube, frames=states, fargs=(ax,), interval=1000)
    plt.show()

if __name__ == "__main__":
    animate_solution()
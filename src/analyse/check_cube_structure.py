import sys
import re
from collections import Counter
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parents[2]))
from utils.config_loader import load_config

# Définition des coins et arêtes
corner_positions = ['URF', 'UFL', 'ULB', 'UBR', 'DFR', 'DLF', 'DBL', 'DRB']
edge_positions = ['UR', 'UF', 'UL', 'UB', 'DR', 'DF', 'DL', 'DB', 'FR', 'FL', 'BL', 'BR']

# Normalise une pièce : trie les lettres
def normalize(piece):
    return ''.join(sorted(piece))

# Rotation pour trouver orientation de coin (0, 1, 2)
def get_corner_orientation(sticker, target):
    for i in range(3):
        if sticker == target:
            return i
        sticker = sticker[1:] + sticker[0]
    return -1  # Erreur

# Rotation pour orientation arête (0, 1)
def get_edge_orientation(sticker, target):
    return 0 if sticker == target else 1 if sticker[::-1] == target else -1

def extract_faces(cube_str):
    return {f: cube_str[i * 9: (i + 1) * 9] for i, f in enumerate("URFDLB")}

def extract_corners(f):
    return [
        f['U'][8] + f['R'][0] + f['F'][2],  # URF
        f['U'][6] + f['F'][0] + f['L'][2],  # UFL
        f['U'][0] + f['L'][0] + f['B'][2],  # ULB
        f['U'][2] + f['B'][0] + f['R'][2],  # UBR
        f['D'][2] + f['F'][8] + f['R'][6],  # DFR
        f['D'][0] + f['L'][8] + f['F'][6],  # DLF
        f['D'][6] + f['B'][8] + f['L'][6],  # DBL
        f['D'][8] + f['R'][8] + f['B'][6],  # DRB
    ]

def extract_edges(f):
    return [
        f['U'][5] + f['R'][1],  # UR
        f['U'][7] + f['F'][1],  # UF
        f['U'][3] + f['L'][1],  # UL
        f['U'][1] + f['B'][1],  # UB
        f['D'][5] + f['R'][7],  # DR
        f['D'][1] + f['F'][7],  # DF
        f['D'][3] + f['L'][7],  # DL
        f['D'][7] + f['B'][7],  # DB
        f['F'][5] + f['R'][3],  # FR
        f['F'][3] + f['L'][5],  # FL
        f['B'][3] + f['L'][3],  # BL
        f['B'][5] + f['R'][5],  # BR
    ]

def check_cube_structure(cube_str):
    errors = []

    faces = extract_faces(cube_str)
    corners = extract_corners(faces)
    edges = extract_edges(faces)

    corner_set = set(map(normalize, corner_positions))
    edge_set = set(map(normalize, edge_positions))

    # Vérification des coins
    corner_orient_sum = 0
    for sticker in corners:
        found = False
        for ref in corner_positions:
            if normalize(sticker) == normalize(ref):
                orient = get_corner_orientation(sticker, ref)
                if orient == -1:
                    errors.append(f"❌ Coin invalide (orientation inconnue) : {sticker}")
                    corner_orient_sum += orient
                found = True
                break
        if not found:
            errors.append(f"❌ Coin non reconnu : {sticker}")
    if corner_orient_sum % 3 != 0:
        errors.append(f"🔃 Orientation des coins invalide (somme = {corner_orient_sum})")
    
    # Vérification des arêtes
    edge_orient_sum = 0
    for sticker in edges:
        found = False
        for ref in edge_positions:
            if normalize(sticker) == normalize(ref):
                orient = get_edge_orientation(sticker, ref)
                if orient == -1:
                    errors.append(f"❌ Arête invalide (orientation inconnue) : {sticker}")
                    edge_orient_sum += orient
                found = True
                break
        if not found:
            errors.append(f"❌ Arête non reconnue : {sticker}")
    if edge_orient_sum % 2 != 0:
        errors.append(f"↔ Orientation des arêtes invalide (somme = {edge_orient_sum})")

    # Vérification de permutation (parité)
    if Counter(map(normalize, corners)) != Counter(map(normalize, corner_positions)):
        errors.append("🔁 Permutation invalide des coins.")
    if Counter(map(normalize, edges)) != Counter(map(normalize, edge_positions)):
        errors.append("🔀 Permutation invalide des arêtes.")

    if (corner_orient_sum % 3 == 0 and edge_orient_sum % 2 == 0
        and Counter(map(normalize, corners)) == Counter(map(normalize, corner_positions))
        and Counter(map(normalize, edges)) == Counter(map(normalize, edge_positions))):
        print("✅ Le cube est structurellement valide.")




    if errors:
        raise ValueError("\n".join(errors))
    else:
        print("✅ Le cube est structurellement valide.")
if __name__ == "__main__":
    config = load_config()
    path = config["paths"]["kociemba_ref"]
    print(f"[📄] Lecture de : {path}")

    with open(path, "r") as f:
        raw = f.read()

    raw = re.sub(r"[\"\s]", "", raw)
    cube_map = {}
    for face in "URFDLB":
        match = re.search(rf"{face}:([URFDLB]{{9}})", raw)
        if not match:
            print(f"[❌] Face {face} manquante ou invalide")
            sys.exit(1)
        cube_map[face] = match.group(1)

    full_str = ''.join(cube_map[face] for face in "URFDLB")
    print(f"[🔢] Chaîne : {full_str}")
    try:
        check_cube_structure(full_str)
    except ValueError as e:
        print(e)

#PYTHONIOENCODING=utf-8 py src/analyse/check_cube_structure.py
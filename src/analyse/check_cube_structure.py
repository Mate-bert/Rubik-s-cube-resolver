import sys
import re
from collections import Counter
from pathlib import Path

# Ajout du chemin du dossier parent pour importer des modules personnalisés
sys.path.append(str(Path(__file__).resolve().parents[2]))
from utils.config_loader import load_config

# Définition des positions des coins et des arêtes du cube
corner_positions = ['URF', 'UFL', 'ULB', 'UBR', 'DFR', 'DLF', 'DBL', 'DRB']
edge_positions = ['UR', 'UF', 'UL', 'UB', 'DR', 'DF', 'DL', 'DB', 'FR', 'FL', 'BL', 'BR']

# Fonction pour normaliser une pièce (trier les lettres dans l'ordre alphabétique)
def normalize(piece):
    return ''.join(sorted(piece))

# Fonction pour déterminer l'orientation d'un coin (0, 1 ou 2)
def get_corner_orientation(sticker, target):
    for i in range(3):
        if sticker == target:
            return i
        sticker = sticker[1:] + sticker[0]  # Rotation circulaire
    return -1  # Erreur si aucune orientation valide n'est trouvée

# Fonction pour déterminer l'orientation d'une arête (0 ou 1)
def get_edge_orientation(sticker, target):
    return 0 if sticker == target else 1 if sticker[::-1] == target else -1

# Extraction des faces du cube à partir d'une chaîne de caractères
def extract_faces(cube_str):
    return {f: cube_str[i * 9: (i + 1) * 9] for i, f in enumerate("URFDLB")}

# Extraction des coins à partir des faces
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

# Extraction des arêtes à partir des faces
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

# Fonction principale pour vérifier la structure du cube
def check_cube_structure(cube_str):
    errors = []

    # Extraction des faces, coins et arêtes
    faces = extract_faces(cube_str)
    corners = extract_corners(faces)
    edges = extract_edges(faces)

    # Création des ensembles normalisés pour comparaison
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

    # Vérification de la permutation (parité)
    if Counter(map(normalize, corners)) != Counter(map(normalize, corner_positions)):
        errors.append("🔁 Permutation invalide des coins.")
    if Counter(map(normalize, edges)) != Counter(map(normalize, edge_positions)):
        errors.append("🔀 Permutation invalide des arêtes.")

    # Si aucune erreur, le cube est valide
    if (corner_orient_sum % 3 == 0 and edge_orient_sum % 2 == 0
        and Counter(map(normalize, corners)) == Counter(map(normalize, corner_positions))
        and Counter(map(normalize, edges)) == Counter(map(normalize, edge_positions))):
        print("✅ Le cube est structurellement valide.")

    # Si des erreurs sont détectées, les afficher
    if errors:
        raise ValueError("\n".join(errors))
    else:
        print("✅ Le cube est structurellement valide.")

if __name__ == "__main__":
    # Chargement de la configuration
    config = load_config()
    path = config["paths"]["kociemba_ref"]
    print(f"[📄] Lecture de : {path}")

    # Lecture du fichier contenant la description du cube
    with open(path, "r") as f:
        raw = f.read()

    # Nettoyage de la chaîne de caractères
    raw = re.sub(r"[\"\s]", "", raw)
    cube_map = {}
    for face in "URFDLB":
        match = re.search(rf"{face}:([URFDLB]{{9}})", raw)
        if not match:
            print(f"[❌] Face {face} manquante ou invalide")
            sys.exit(1)
        cube_map[face] = match.group(1)

    # Construction de la chaîne complète représentant le cube
    full_str = ''.join(cube_map[face] for face in "URFDLB")
    print(f"[🔢] Chaîne : {full_str}")

    # Vérification de la structure du cube
    try:
        check_cube_structure(full_str)
    except ValueError as e:
        print(e)

# Commande pour exécuter le script : PYTHONIOENCODING=utf-8 py src/analyse/check_cube_structure.py
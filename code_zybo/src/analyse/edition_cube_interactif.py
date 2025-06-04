import tkinter as tk
from tkinter import messagebox
import matplotlib
matplotlib.use("TkAgg")
import matplotlib.pyplot as plt
import os
import sys
import re
from pathlib import Path
sys.path.append(str(Path(__file__).resolve().parents[2]))
from utils.config_loader import load_config
from src.analyse.check_cube_structure import check_cube_structure
from utils.affichage_cube import draw_basic_face, face_positions

# Chargement de la configuration
cfg = load_config()

# Ordre des faces du cube et couleurs autorisées
FACE_ORDER = ['U', 'R', 'F', 'D', 'L', 'B']
COLORS = ['U', 'R', 'F', 'D', 'L', 'B']

# Chemins de sauvegarde des fichiers
output_path = cfg['paths'].get('cube_manual', 'data/groundtruth/etat_cube.txt')
kociemba_verif_path = cfg['paths'].get('kociemba_ref', 'data/groundtruth/kociemba_verif.txt')

# Classe principale pour l'éditeur interactif du cube
class CubeEditor(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("🧩 Éditeur Cube Interactif")
        self.cells = {}  # Dictionnaire pour stocker les entrées des cellules du cube
        self.init_ui()  # Initialisation de l'interface utilisateur

    def init_ui(self):
        # Création des cadres pour chaque face du cube
        for idx, face in enumerate(FACE_ORDER):
            frame = tk.LabelFrame(self, text=f"Face {face}", padx=5, pady=5)
            frame.grid(row=idx // 3, column=idx % 3, padx=10, pady=10)
            self.cells[face] = []
            for r in range(3):
                for c in range(3):
                    # Création des champs de saisie pour chaque cellule
                    entry = tk.Entry(frame, width=2, justify='center', font=('Courier', 16))
                    entry.grid(row=r, column=c)
                    entry.insert(0, face if r == 1 and c == 1 else '')  # La cellule centrale contient la face par défaut
                    entry.bind('<KeyRelease>', self.limiter_input)  # Limitation des entrées utilisateur
                    self.cells[face].append(entry)

        # Boutons pour les différentes actions
        btn_check = tk.Button(self, text="✅ Vérifier structure", command=self.verifier_structure)
        btn_save = tk.Button(self, text="💾 Sauvegarder état", command=self.sauvegarder_etat)
        btn_kociemba = tk.Button(self, text="📤 Exporter vers kociemba.txt", command=self.exporter_kociemba)
        btn_import = tk.Button(self, text="📥 Charger depuis kociemba.txt", command=self.importer_kociemba)
        btn_visu = tk.Button(self, text="🎨 Visualiser l'état", command=self.visualiser_etat)
        btn_solved = tk.Button(self, text="🎯 Cube résolu", command=self.charger_cube_solved)
        btn_blanc = tk.Button(self, text="⬜ Tout U", command=self.charger_cube_uniforme)

        # Placement des boutons dans la fenêtre
        btn_check.grid(row=2, column=0, pady=10)
        btn_save.grid(row=2, column=1, pady=10)
        btn_kociemba.grid(row=2, column=2, pady=10)
        btn_import.grid(row=3, column=0, pady=10)
        btn_visu.grid(row=3, column=1, pady=10)
        btn_solved.grid(row=4, column=0, pady=10)
        btn_blanc.grid(row=4, column=2, pady=10)

    def limiter_input(self, event):
        # Limite l'entrée utilisateur à une seule lettre parmi les couleurs autorisées
        widget = event.widget
        text = widget.get().upper()
        if len(text) > 1:
            widget.delete(1, tk.END)
        elif text and text not in COLORS:
            widget.delete(0, tk.END)

    def lire_cube(self):
        # Lit l'état actuel du cube depuis les champs de saisie
        cube_map = {}
        for face in FACE_ORDER:
            valeurs = [cell.get().upper() for cell in self.cells[face]]
            if len(valeurs) != 9 or any(v not in COLORS for v in valeurs):
                raise ValueError(f"Valeurs invalides sur la face {face} : {valeurs}")
            cube_map[face] = ''.join(valeurs)
        return cube_map

    def verifier_structure(self):
        # Vérifie si la structure du cube est valide
        try:
            cube_map = self.lire_cube()
            cube_str = ''.join(cube_map[f] for f in FACE_ORDER)
            check_cube_structure(cube_str)
            messagebox.showinfo("Vérification", "✅ Le cube est structurellement valide (voir terminal pour détails).")
        except Exception as e:
            messagebox.showerror("Erreur", str(e))

    def sauvegarder_etat(self):
        # Sauvegarde l'état actuel du cube dans un fichier
        try:
            cube_map = self.lire_cube()
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            with open(output_path, 'w') as f:
                for face in FACE_ORDER:
                    f.write(f'"{face}:{cube_map[face]}",\n')
            messagebox.showinfo("Succès", f"État sauvegardé dans : {output_path}")
        except Exception as e:
            messagebox.showerror("Erreur", str(e))

    def exporter_kociemba(self):
        # Exporte l'état du cube dans un fichier compatible avec Kociemba
        try:
            cube_map = self.lire_cube()
            os.makedirs(os.path.dirname(kociemba_verif_path), exist_ok=True)
            with open(kociemba_verif_path, 'w') as f:
                for face in FACE_ORDER:
                    f.write(f'"{face}:{cube_map[face]}",\n')
            messagebox.showinfo("Exporté", f"État exporté dans : {kociemba_verif_path}")
        except Exception as e:
            messagebox.showerror("Erreur", str(e))

    def importer_kociemba(self):
        # Importe un état de cube depuis un fichier compatible avec Kociemba
        try:
            with open(kociemba_verif_path, 'r') as f:
                raw = f.read()
            raw = re.sub(r'["\s]', '', raw)
            for face in FACE_ORDER:
                match = re.search(rf'{face}:([URFDLB]{{9}})', raw)
                if match:
                    for i, char in enumerate(match.group(1)):
                        self.cells[face][i].delete(0, tk.END)
                        self.cells[face][i].insert(0, char)
            messagebox.showinfo("Importé", f"Cube chargé depuis : {kociemba_verif_path}")
        except Exception as e:
            messagebox.showerror("Erreur", str(e))

    def visualiser_etat(self):
        # Affiche une visualisation graphique de l'état actuel du cube
        try:
            cube_map = self.lire_cube()
            fig, ax = plt.subplots(figsize=(6, 6))
            for face in FACE_ORDER:
                draw_basic_face(ax, face_positions[face], cube_map[face])
            ax.set_xlim(0, 12)
            ax.set_ylim(0, 12)
            ax.set_aspect('equal')
            ax.axis('off')
            plt.title("🎨 Visualisation de l'état saisi")
            plt.tight_layout()
            plt.show()
        except Exception as e:
            messagebox.showerror("Erreur affichage", str(e))

    def charger_cube_solved(self):
        # Charge un cube résolu (chaque face a une seule couleur)
        for face in FACE_ORDER:
            for i in range(9):
                self.cells[face][i].delete(0, tk.END)
                self.cells[face][i].insert(0, face)

    def charger_cube_uniforme(self):
        # Charge un cube où toutes les cellules sont de couleur 'U'
        for face in FACE_ORDER:
            for i in range(9):
                self.cells[face][i].delete(0, tk.END)
                self.cells[face][i].insert(0, 'U')

# Point d'entrée principal de l'application
if __name__ == "__main__":
    app = CubeEditor()
    app.mainloop()
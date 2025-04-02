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

cfg = load_config()

FACE_ORDER = ['U', 'R', 'F', 'D', 'L', 'B']
COLORS = ['U', 'R', 'F', 'D', 'L', 'B']

# Chemins de sauvegarde
output_path = cfg['paths'].get('cube_manual', 'data/groundtruth/etat_cube.txt')
kociemba_verif_path = cfg['paths'].get('kociemba_ref', 'data/groundtruth/kociemba_verif.txt')

class CubeEditor(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("🧩 Éditeur Cube Interactif")
        self.cells = {}
        self.init_ui()

    def init_ui(self):
        for idx, face in enumerate(FACE_ORDER):
            frame = tk.LabelFrame(self, text=f"Face {face}", padx=5, pady=5)
            frame.grid(row=idx // 3, column=idx % 3, padx=10, pady=10)
            self.cells[face] = []
            for r in range(3):
                for c in range(3):
                    entry = tk.Entry(frame, width=2, justify='center', font=('Courier', 16))
                    entry.grid(row=r, column=c)
                    entry.insert(0, face if r == 1 and c == 1 else '')
                    entry.bind('<KeyRelease>', self.limiter_input)
                    self.cells[face].append(entry)

        btn_check = tk.Button(self, text="✅ Vérifier structure", command=self.verifier_structure)
        btn_save = tk.Button(self, text="💾 Sauvegarder état", command=self.sauvegarder_etat)
        btn_kociemba = tk.Button(self, text="📤 Exporter vers kociemba.txt", command=self.exporter_kociemba)
        btn_import = tk.Button(self, text="📥 Charger depuis kociemba.txt", command=self.importer_kociemba)
        btn_visu = tk.Button(self, text="🎨 Visualiser l'état", command=self.visualiser_etat)
        btn_solved = tk.Button(self, text="🎯 Cube résolu", command=self.charger_cube_solved)
        btn_blanc = tk.Button(self, text="⬜ Tout U", command=self.charger_cube_uniforme)

        btn_check.grid(row=2, column=0, pady=10)
        btn_save.grid(row=2, column=1, pady=10)
        btn_kociemba.grid(row=2, column=2, pady=10)
        btn_import.grid(row=3, column=0, pady=10)
        btn_visu.grid(row=3, column=1, pady=10)
        btn_solved.grid(row=4, column=0, pady=10)
        btn_blanc.grid(row=4, column=2, pady=10)

    def limiter_input(self, event):
        widget = event.widget
        text = widget.get().upper()
        if len(text) > 1:
            widget.delete(1, tk.END)
        elif text and text not in COLORS:
            widget.delete(0, tk.END)

    def lire_cube(self):
        cube_map = {}
        for face in FACE_ORDER:
            valeurs = [cell.get().upper() for cell in self.cells[face]]
            if len(valeurs) != 9 or any(v not in COLORS for v in valeurs):
                raise ValueError(f"Valeurs invalides sur la face {face} : {valeurs}")
            cube_map[face] = ''.join(valeurs)
        return cube_map

    def verifier_structure(self):
        try:
            cube_map = self.lire_cube()
            cube_str = ''.join(cube_map[f] for f in FACE_ORDER)
            check_cube_structure(cube_str)
            messagebox.showinfo("Vérification", "✅ Le cube est structurellement valide (voir terminal pour détails).")
        except Exception as e:
            messagebox.showerror("Erreur", str(e))

    def sauvegarder_etat(self):
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
        for face in FACE_ORDER:
            for i in range(9):
                self.cells[face][i].delete(0, tk.END)
                self.cells[face][i].insert(0, face)

    def charger_cube_uniforme(self):
        for face in FACE_ORDER:
            for i in range(9):
                self.cells[face][i].delete(0, tk.END)
                self.cells[face][i].insert(0, 'U')

if __name__ == "__main__":
    app = CubeEditor()
    app.mainloop()
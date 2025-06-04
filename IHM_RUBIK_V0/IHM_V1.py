import customtkinter as ctk
from PIL import Image, ImageDraw, ImageTk
from collections import Counter
import random

class RubikCubeGUI:
    def __init__(self):
        self.cube_state = [[['W' for _ in range(3)] for _ in range(3)] for _ in range(6)]

        self.root = ctk.CTk()
        self.root.title("Solveur Rubik's Cube")
        ctk.set_appearance_mode("dark")
        ctk.set_default_color_theme("dark-blue")

        # Configuration de la police
        self.title_font = ctk.CTkFont(family="Helvetica", size=18, weight="bold")
        self.button_font = ctk.CTkFont(family="Helvetica", size=14)
        
        # Cadre principal
        self.main_frame = ctk.CTkFrame(self.root, corner_radius=15, fg_color="#2E2E2E")
        self.main_frame.pack(pady=20, padx=20, fill="both", expand=True)

        # Titre
        self.title_label = ctk.CTkLabel(
            self.main_frame,
            text="RUBIK'S CUBE SOLVER",
            font=self.title_font,
            text_color="#FFFFFF"
        )
        self.title_label.pack(pady=(15, 10))

        # Canvas pour l'affichage du cube
        self.canvas = ctk.CTkCanvas(
            self.main_frame, 
            width=600, 
            height=400, 
            bg="#363636",
            highlightthickness=0
        )
        self.canvas.pack(pady=10, padx=20)
        self.canvas_image = None

        # Cadre des boutons
        self.button_frame = ctk.CTkFrame(
            self.main_frame, 
            fg_color="transparent",
            corner_radius=12
        )
        self.button_frame.pack(pady=15)

        # Bouton Scanner
        self.btn_scan = ctk.CTkButton(
            self.button_frame,
            text="Scanner le Cube",
            command=self.scan_cube,
            width=140,
            height=45,
            font=self.button_font,
            border_width=2,
            border_color="#4CAF50",
            fg_color="#2E7D32",
            hover_color="#1B5E20",
            corner_radius=8
        )
        self.btn_scan.pack(side="left", padx=15)

        # Bouton Résoudre
        self.btn_solve = ctk.CTkButton(
            self.button_frame,
            text="Résoudre",
            command=self.solve_cube,
            width=140,
            height=45,
            font=self.button_font,
            state="disabled",
            fg_color="#1976D2",
            hover_color="#1565C0",
            corner_radius=8
        )
        self.btn_solve.pack(side="left", padx=15)

        # Indicateur d'état
        self.status_label = ctk.CTkLabel(
            self.main_frame,
            text="Prêt",
            font=ctk.CTkFont(family="Helvetica", size=12, slant="italic"),
            text_color="#B0BEC5"
        )
        self.status_label.pack(pady=(5, 10))

        self.update_cube_display()

    def scan_cube(self):
        """Simule un scan avec un cube mélangé aléatoirement et valide"""
        self.status_label.configure(text="Scan en cours...")
        self.root.after(1000, self.finish_scan)

    def finish_scan(self):
        self.generate_random_state()
        self.btn_solve.configure(state="normal")
        self.check_color_counts()
        self.status_label.configure(text="Cube scanné - Prêt pour la résolution")

    def solve_cube(self):
        """Affiche un cube résolu"""
        self.status_label.configure(text="Résolution en cours...")
        self.root.after(1500, self.finish_solve)

    def finish_solve(self):
        solved_colors = ['R', 'G', 'B', 'Y', 'W', 'O']
        for face in range(6):
            color = solved_colors[face]
            self.cube_state[face] = [[color for _ in range(3)] for _ in range(3)]
        self.update_cube_display()
        self.status_label.configure(text="Cube résolu !", text_color="#4CAF50")

    def generate_random_state(self):
        """Génère un état aléatoire valide (9 couleurs de chaque type)"""
        colors = ['W', 'Y', 'R', 'G', 'B', 'O']
        all_stickers = [c for c in colors for _ in range(9)]  # 9 de chaque
        random.shuffle(all_stickers)

        new_state = []
        idx = 0
        for _ in range(6):
            face = []
            for _ in range(3):
                row = []
                for _ in range(3):
                    row.append(all_stickers[idx])
                    idx += 1
                face.append(row)
            new_state.append(face)

        self.cube_state = new_state
        self.update_cube_display()

    def check_color_counts(self):
        """Affiche dans la console le nombre de stickers de chaque couleur"""
        flat_colors = [color for face in self.cube_state for row in face for color in row]
        counts = Counter(flat_colors)

        print("=== Vérification des couleurs ===")
        for color in ['W', 'Y', 'R', 'G', 'B', 'O']:
            print(f"{color}: {counts[color]} stickers")
        if all(counts[c] == 9 for c in ['W', 'Y', 'R', 'G', 'B', 'O']):
            print("✅ Le cube est valide (9 de chaque couleur)")
        else:
            print("❌ Problème détecté : nombre de couleurs incorrect")

    def update_cube_display(self):
        """Affiche le cube avec un alignement parfait"""
        img = Image.new('RGB', (600, 400), color='#363636')
        draw = ImageDraw.Draw(img)

        # Calcul des positions avec espacement précis
        base_x = 198  # Position horizontale centrale
        base_y = 148  # Position verticale centrale
        face_size = 102  # 3 carrés × 34 pixels

        # Dessin dans l'ordre de profondeur correct
        self.draw_face(draw, self.cube_state[5], (base_x + face_size*2, base_y))  # BACK
        self.draw_face(draw, self.cube_state[2], (base_x - face_size, base_y))    # LEFT
        self.draw_face(draw, self.cube_state[0], (base_x, base_y))                # FRONT (centre)
        self.draw_face(draw, self.cube_state[1], (base_x + face_size, base_y))    # RIGHT
        self.draw_face(draw, self.cube_state[3], (base_x, base_y - face_size))   # UP
        self.draw_face(draw, self.cube_state[4], (base_x, base_y + face_size))   # DOWN
    
        self.tk_img = ImageTk.PhotoImage(img)
        
        if self.canvas_image:
            self.canvas.delete(self.canvas_image)
        
        self.canvas_image = self.canvas.create_image(
            300, 200,
            anchor="center",
            image=self.tk_img
        )
        self.canvas.tag_raise(self.canvas_image)

    def draw_face(self, draw, face, offset):
        """Dessine une face du cube avec un alignement pixel-perfect"""
        color_map = {
            'W': '#F5F5F5',  # Blanc
            'Y': '#FFEB3B',  # Jaune
            'R': '#D32F2F',  # Rouge
            'G': '#388E3C',  # Vert
            'B': '#1976D2',  # Bleu
            'O': '#FB8C00',  # Orange
        }

        x, y = offset
        sticker_size = 33  # Taille d'un petit carré
        spacing = 1       # Espace entre les carrés
        border_radius = 3  # Arrondi des coins

        for i in range(3):
            for j in range(3):
                # Calcul des coordonnées précises
                x1 = x + j * (sticker_size + spacing)
                y1 = y + i * (sticker_size + spacing)
                x2 = x1 + sticker_size
                y2 = y1 + sticker_size

                # Ombre portée (décalée de 2 pixels)
                draw.rounded_rectangle(
                    [x1 + 2, y1 + 2, x2 + 2, y2 + 2],
                    radius=border_radius,
                    fill="#212121",  # Couleur d'ombre
                    outline=None
                )

                # Carré principal
                draw.rounded_rectangle(
                    [x1, y1, x2, y2],
                    radius=border_radius,
                    fill=color_map.get(face[i][j]),  # Couleur du sticker
                    outline="#616161",  # Couleur de bordure
                    width=1  # Épaisseur de bordure
                )
                
    def run(self):
        self.root.mainloop()

if __name__ == "__main__":
    app = RubikCubeGUI()
    app.run()
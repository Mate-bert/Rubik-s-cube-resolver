import pygame
from pygame.locals import *
from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *
from pathlib import Path
import sys

# Chargement dynamique des modules
sys.path.append(str(Path(__file__).resolve().parents[1]))
from utils.config_loader import load_config

cfg = load_config()
etat_initial_path = Path(cfg["paths"]["kociemba_test"])

# Ordre du fichier : U, R, F, D, L, B
FILE_FACE_ORDER = ['U', 'R', 'F', 'D', 'L', 'B']

# Mapping couleur/face
LETTER_TO_COLOR = {
    'U': (1, 1, 0),      # Jaune
    'D': (1, 1, 1),      # Blanc
    'F': (1, 0, 0),      # Rouge
    'B': (1, 0.5, 0),    # Orange
    'R': (0, 1, 0),      # Vert
    'L': (0, 0, 1),      # Bleu
}

# Géométrie des faces (normale, centre, axes locaux u/v)
FACE_GEOMETRY = {
    'U': {'normal': (0, 1, 0), 'center': (0, 3, 0), 'u': (1, 0, 0), 'v': (0, 0, -1)},
    'D': {'normal': (0, -1, 0), 'center': (0, -3, 0), 'u': (1, 0, 0), 'v': (0, 0, 1)},
    'F': {'normal': (0, 0, 1), 'center': (0, 0, 3), 'u': (1, 0, 0), 'v': (0, 1, 0)},
    'B': {'normal': (0, 0, -1), 'center': (0, 0, -3), 'u': (-1, 0, 0), 'v': (0, 1, 0)},
    'R': {'normal': (1, 0, 0), 'center': (3, 0, 0), 'u': (0, 0, -1), 'v': (0, 1, 0)},
    'L': {'normal': (-1, 0, 0), 'center': (-3, 0, 0), 'u': (0, 0, 1), 'v': (0, 1, 0)},
}

# Pour chaque face, nombre de rotations 90° anti-horaire à appliquer à la grille pour l'affichage correct
FACE_ROTATION = {
    'U': 1,
    'D': 1,
    'F': 1,
    'B': 1,
    'R': 1,
    'L': 1,
}

# Coordonnées des 27 cubies (x, y, z) dans l'espace 3D
CUBIE_POSITIONS = []
for x in [-1, 0, 1]:
    for y in [-1, 0, 1]:
        for z in [-1, 0, 1]:
            CUBIE_POSITIONS.append((x, y, z))

# --- MAPPING FACE/CUBIE ---
CUBIE_FACE_MAP = [
    ('U', (0, 1, 0), (0, 1)),
    ('D', (0, -1, 0), (0, -1)),
    ('F', (0, 0, 1), (2, 1)),
    ('B', (0, 0, -1), (2, -1)),
    ('R', (1, 0, 0), (0, 1)),
    ('L', (-1, 0, 0), (0, -1)),
]

# Ordre des positions pour chaque face (ligne, colonne)
U_POSITIONS = [
    (2,0),(1,0),(0,0),
    (2,1),(1,1),(0,1),
    (2,2),(1,2),(0,2)
]
R_POSITIONS = [
    (0,2),(1,2),(2,2),
    (0,1),(1,1),(2,1),
    (0,0),(1,0),(2,0)
]
F_POSITIONS = [
    (2,2),(1,2),(0,2),
    (2,1),(1,1),(0,1),
    (2,0),(1,0),(0,0)
]
D_POSITIONS = [
    (2,2),(1,2),(0,2),
    (2,1),(1,1),(0,1),
    (2,0),(1,0),(0,0)
]
L_POSITIONS = [
    (0,2),(1,2),(2,2),
    (0,1),(1,1),(2,1),
    (0,0),(1,0),(2,0)
]
B_POSITIONS = [
    (2,2),(1,2),(0,2),
    (2,1),(1,1),(0,1),
    (2,0),(1,0),(0,0)
]
FACE_POSITIONS = {
    'U': U_POSITIONS,
    'R': R_POSITIONS,
    'F': F_POSITIONS,
    'D': D_POSITIONS,
    'L': L_POSITIONS,
    'B': B_POSITIONS,
}

def rotate_grid(grid, k):
    # k = nombre de rotations 90° anti-horaire
    for _ in range(k):
        grid = [list(row) for row in zip(*grid[::-1])]
    return grid

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

def draw_sticker(center, u_vec, v_vec, color, size=1.7):
    half = size / 2
    glColor3fv(color)
    glBegin(GL_QUADS)
    for du, dv in [(-half, -half), (half, -half), (half, half), (-half, half)]:
        x = center[0] + du * u_vec[0] + dv * v_vec[0]
        y = center[1] + du * u_vec[1] + dv * v_vec[1]
        z = center[2] + du * u_vec[2] + dv * v_vec[2]
        glVertex3f(x, y, z)
    glEnd()

def draw_cube_primitive():
    vertices = [
        # Front face
        (-0.5, -0.5,  0.5), (0.5, -0.5,  0.5), (0.5,  0.5,  0.5), (-0.5,  0.5,  0.5),
        # Back face
        (-0.5, -0.5, -0.5), (-0.5,  0.5, -0.5), (0.5,  0.5, -0.5), (0.5, -0.5, -0.5),
        # Top face
        (-0.5,  0.5, -0.5), (-0.5,  0.5,  0.5), (0.5,  0.5,  0.5), (0.5,  0.5, -0.5),
        # Bottom face
        (-0.5, -0.5, -0.5), (0.5, -0.5, -0.5), (0.5, -0.5,  0.5), (-0.5, -0.5,  0.5),
        # Right face
        (0.5, -0.5, -0.5), (0.5,  0.5, -0.5), (0.5,  0.5,  0.5), (0.5, -0.5,  0.5),
        # Left face
        (-0.5, -0.5, -0.5), (-0.5, -0.5,  0.5), (-0.5,  0.5,  0.5), (-0.5,  0.5, -0.5)
    ]

    glBegin(GL_QUADS)
    for vertex in vertices:
        glVertex3fv(vertex)
    glEnd()

def draw_all_stickers(state):
    sticker_size = 0.9
    gap = 0.15
    for face, geom in FACE_GEOMETRY.items():
        u_vec = geom['u']
        v_vec = geom['v']
        center = geom['center']
        for i in range(3):
            for j in range(3):
                offset_u = (i - 1) * (sticker_size + gap)
                offset_v = (j - 1) * (sticker_size + gap)
                cx = center[0] + offset_u * u_vec[0] + offset_v * v_vec[0]
                cy = center[1] + offset_u * u_vec[1] + offset_v * v_vec[1]
                cz = center[2] + offset_u * u_vec[2] + offset_v * v_vec[2]
                color = LETTER_TO_COLOR[state[face][i][j]]
                draw_sticker((cx, cy, cz), u_vec, v_vec, color, size=sticker_size)

def draw_cubie(pos):
    glColor3f(0.2, 0.2, 0.2)  # Couleur grise pour le cubie
    glPushMatrix()
    glTranslatef(pos[0] * 2, pos[1] * 2, pos[2] * 2)
    glScalef(0.95, 0.95, 0.95)
    draw_cube_primitive()
    glPopMatrix()

# --- CLASSES DE BASE POUR LE RUBIK'S CUBE 3D ---

class Cubie:
    def __init__(self, pos, face_colors, size=1.8):
        self.pos = pos  # (x, y, z) dans [-1, 0, 1]
        self.size = size
        self.face_colors = face_colors  # dict: face_name -> color (ou None)

    def draw(self):
        glPushMatrix()
        glTranslatef(self.pos[0]*1.8, self.pos[1]*1.8, self.pos[2]*1.8)
        glScalef(0.95, 0.95, 0.95)
        self.draw_cube()
        glPopMatrix()

    def draw_cube(self):
        s = self.size / 2
        vertices = [
            (-s, -s, -s), (s, -s, -s), (s, s, -s), (-s, s, -s),
            (-s, -s, s), (s, -s, s), (s, s, s), (-s, s, s)
        ]
        faces = [
            (0, 1, 2, 3), # Back
            (4, 5, 6, 7), # Front
            (0, 1, 5, 4), # Bottom
            (2, 3, 7, 6), # Top
            (1, 2, 6, 5), # Right
            (0, 3, 7, 4)  # Left
        ]
        face_names = ['B', 'F', 'D', 'U', 'R', 'L']
        glBegin(GL_QUADS)
        for i, face in enumerate(faces):
            color = self.face_colors.get(face_names[i], (0.05, 0.05, 0.05))
            glColor3fv(color)
            for v in face:
                glVertex3fv(vertices[v])
        glEnd()
        # Arêtes noires
        glColor3f(0, 0, 0)
        glLineWidth(2)
        glBegin(GL_LINES)
        edges = [
            (0,1),(1,2),(2,3),(3,0), (4,5),(5,6),(6,7),(7,4),
            (0,4),(1,5),(2,6),(3,7)
        ]
        for e in edges:
            glVertex3fv(vertices[e[0]])
            glVertex3fv(vertices[e[1]])
        glEnd()

class RubiksCube:
    def __init__(self, state):
        self.cubies = []
        for x in [-1,0,1]:
            for y in [-1,0,1]:
                for z in [-1,0,1]:
                    face_colors = self.get_cubie_colors((x, y, z), state)
                    self.cubies.append(Cubie((x, y, z), face_colors))

    def get_cubie_colors(self, pos, state):
        colors = {}
        x, y, z = pos
        # Face Up (U, y=1)
        if y == 1:
            row = 1 + x
            col = 1 + z
            colors['U'] = LETTER_TO_COLOR[state['U'][2 - row][col]]
        # Face Down (D, y=-1)
        if y == -1:
            row = 1 + x
            col = 1 + z
            colors['D'] = LETTER_TO_COLOR[state['D'][2 - row][col]]
        # Face Front (F, z=1)
        if z == 1:
            row = 1 + x
            col = 1 + y
            colors['F'] = LETTER_TO_COLOR[state['F'][2 - row][col]]
        # Face Back (B, z=-1)
        if z == -1:
            row = 1 - x
            col = 1 + y
            colors['B'] = LETTER_TO_COLOR[state['B'][2 - row][col]]
        # Face Right (R, x=1)
        if x == 1:
            row = 1 + z
            col = 1 + y
            colors['R'] = LETTER_TO_COLOR[state['R'][2 - row][col]]
        # Face Left (L, x=-1)
        if x == -1:
            row = 1 - z
            col = 1 + y
            colors['L'] = LETTER_TO_COLOR[state['L'][2 - row][col]]
        return colors

    def draw(self):
        for cubie in self.cubies:
            cubie.draw()

# --- FIN CLASSES DE BASE ---

def main():
    pygame.init()
    glutInit(sys.argv)  # Initialisation de GLUT avec les arguments du programme
    screen = pygame.display.set_mode((800, 600), DOUBLEBUF | OPENGL)
    pygame.display.set_caption("Test Cube Rubik's 3D - Couleurs et état initial")

    glEnable(GL_DEPTH_TEST)
    glMatrixMode(GL_PROJECTION)
    gluPerspective(45, (800 / 600), 0.1, 100.0)
    glMatrixMode(GL_MODELVIEW)
    glTranslatef(0.0, 0.0, -20.0)

    # Chargement de l'état initial
    state = load_state(etat_initial_path)

    cube = RubiksCube(state)
    inc_x = inc_y = ang_x = ang_y = 0
    zoom = 1

    clock = pygame.time.Clock()
    running = True
    while running:
        for event in pygame.event.get():
            if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
                running = False
            elif event.type == KEYDOWN:
                if event.key == K_LEFT: inc_y = 2
                elif event.key == K_RIGHT: inc_y = -2
                elif event.key == K_UP: inc_x = 2
                elif event.key == K_DOWN: inc_x = -2
            elif event.type == KEYUP:
                if event.key in [K_LEFT, K_RIGHT]: inc_y = 0
                elif event.key in [K_UP, K_DOWN]: inc_x = 0
            elif event.type == MOUSEBUTTONDOWN:
                if event.button == 4 and zoom < 1.6: zoom += 0.05
                elif event.button == 5 and zoom > 0.3: zoom -= 0.05

        ang_x += inc_x
        ang_y += inc_y

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glLoadIdentity()
        glTranslatef(0, 0, -20)
        glRotatef(ang_y, 0, 1, 0)
        glRotatef(ang_x, 1, 0, 0)
        glScalef(zoom, zoom, zoom)

        cube.draw()
        pygame.display.flip()
        clock.tick(60)
    pygame.quit()

if __name__ == "__main__":
    main() 
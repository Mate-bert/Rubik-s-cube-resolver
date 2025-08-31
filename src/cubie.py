import numpy as np
from OpenGL.GL import *

# Géométrie et couleurs comme dans l'exemple .txt
# Convention axes/faces :
# x=0:L, x=2:R, y=0:D, y=2:U, z=0:B, z=2:F
vertices = (
    ( 1, -1, -1), ( 1,  1, -1), (-1,  1, -1), (-1, -1, -1),  # z = -1 (Back)
    ( 1, -1,  1), ( 1,  1,  1), (-1, -1,  1), (-1,  1,  1)   # z = +1 (Front)
)
surfaces = (
    (0, 1, 2, 3),  # Back  (z = -1)  -> B
    (4, 5, 7, 6),  # Front (z = +1)  -> F
    (3, 2, 7, 6),  # Up    (y = +1)  -> U
    (0, 1, 5, 4),  # Down  (y = -1)  -> D
    (1, 2, 7, 5),  # Right (x = +1)  -> R
    (0, 3, 6, 4),  # Left  (x = -1)  -> L
)
face_names = ['B', 'F', 'U', 'D', 'R', 'L']

# Les couleurs sont données par face_names, donc le mapping doit être respecté
colors = (
    (1, 0.5, 0),    # Orange (B)
    (1, 0, 0),       # Rouge  (F)
    (1, 1, 0),       # Jaune  (U)
    (1, 1, 1),       # Blanc  (D)
    (0, 1, 0),       # Vert   (R)
    (0, 0, 1)        # Bleu   (L)
)

class Cubie:
    def __init__(self, position, N=3, scale=1.0):
        self.N = N
        self.scale = scale
        self.init_i = list(position)
        self.current_i = list(position)
        self.rot = np.identity(3)
        self.face_colors = {}  # à remplir après création

    def is_affected(self, axis, slice_idx):
        return self.current_i[axis] == slice_idx

    def update(self, axis, slice_idx, dir):
        if not self.is_affected(axis, slice_idx):
            return
        i, j = (axis+1)%3, (axis+2)%3
        for k in range(3):
            self.rot[k][i], self.rot[k][j] = -self.rot[k][j]*dir, self.rot[k][i]*dir
        self.current_i[i], self.current_i[j] = (
            self.current_i[j] if dir < 0 else self.N-1-self.current_i[j],
            self.current_i[i] if dir > 0 else self.N-1-self.current_i[i]
        )
        self._rotate_face_colors(axis, dir)

    def _rotate_face_colors(self, axis, dir):
        for _ in range((dir%4+4)%4):
            if axis == 0:  # x
                mapping = {'U':'B', 'B':'D', 'D':'F', 'F':'U', 'R':'R', 'L':'L'}
            elif axis == 1:  # y
                mapping = {'F':'R', 'R':'B', 'B':'L', 'L':'F', 'U':'U', 'D':'D'}
            elif axis == 2:  # z
                mapping = {'U':'R', 'R':'D', 'D':'L', 'L':'U', 'F':'F', 'B':'B'}
            else:
                return
            new_colors = self.face_colors.copy()
            for k in mapping:
                if k in self.face_colors:
                    new_colors[mapping[k]] = self.face_colors[k]
                    del new_colors[k]
            self.face_colors.update(new_colors)

    def transformMat(self):
        scaleA = [[s*self.scale for s in a] for a in self.rot]
        scaleT = [(p-(self.N-1)/2)*2.1*self.scale for p in self.current_i]
        return [*scaleA[0], 0, *scaleA[1], 0, *scaleA[2], 0, *scaleT, 1]

    def draw(self, animate=False, angle=0, axis=0, slice_idx=0, dir=1):
        glPushMatrix()
        if animate and self.is_affected(axis, slice_idx):
            glRotatef(angle*dir, *[1 if i==axis else 0 for i in range(3)])
        glMultMatrixf(self.transformMat())
        glBegin(GL_QUADS)
        for idx, face in enumerate(surfaces):
            name = face_names[idx]
            color = self.face_colors.get(name, colors[idx])
            glColor3fv(color)
            for v in face:
                glVertex3fv(vertices[v])
        glEnd()
        glPopMatrix()

def draw_cubie(cubie, size=0.98):
    """Dessine un cubie à sa position et orientation, avec ses couleurs de faces."""
    # Position du centre
    x, y, z = cubie.position
    # Appliquer la matrice d'orientation
    orientation = cubie.orientation
    # Sommets d'un cube centré en (0,0,0)
    hs = size/2
    vertices = np.array([
        [-hs,-hs,-hs], [hs,-hs,-hs], [hs,hs,-hs], [-hs,hs,-hs],
        [-hs,-hs, hs], [hs,-hs, hs], [hs,hs, hs], [-hs,hs, hs]
    ])
    # Appliquer la rotation
    vertices = np.dot(vertices, orientation.T)
    # Décaler à la bonne position
    vertices += np.array([x-1, y-1, z-1])  # centre du cube 3x3x3
    # Faces (indices des sommets)
    faces = [
        (0,1,2,3),  # back
        (4,5,6,7),  # front
        (0,1,5,4),  # bottom
        (2,3,7,6),  # top
        (0,3,7,4),  # left
        (1,2,6,5),  # right
    ]
    face_names = ['B','F','D','U','L','R']
    glBegin(GL_QUADS)
    for idx, face in enumerate(faces):
        name = face_names[idx]
        color = cubie.face_colors.get(name, (0.1,0.1,0.1))
        glColor3fv(color)
        for v in face:
            glVertex3fv(vertices[v])
    glEnd() 
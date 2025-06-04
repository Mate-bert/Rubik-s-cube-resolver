# Fichier : render_manual_cube_with_faces.py
# Rôle : Affiche un cube 3D solide sans glutSolidCube, avec les faces divisées en 9 cases
# Auteur : Gad Katamba
# Date : 2025-05-17

import pygame
from pygame.locals import *
from OpenGL.GL import *
from OpenGL.GLU import *

def draw_cube_solid():
    vertices = [
        (-1, -1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1),
        (-1, -1, 1),  (1, -1, 1),  (1, 1, 1),  (-1, 1, 1)
    ]
    faces = [
        (0, 1, 2, 3),  # back
        (4, 5, 6, 7),  # front
        (0, 1, 5, 4),  # bottom
        (2, 3, 7, 6),  # top
        (0, 3, 7, 4),  # left
        (1, 2, 6, 5),  # right
    ]
    glColor3f(0.1, 0.1, 0.1)
    glBegin(GL_QUADS)
    for face in faces:
        for vertex in face:
            glVertex3fv(vertices[vertex])
    glEnd()

def draw_sticker_face(face_normal, center, size=0.6, gap=0.05):
    face_axes = {
        (0, 1, 0): ((1, 0, 0), (0, 0, -1)),   # top
        (0, -1, 0): ((1, 0, 0), (0, 0, 1)),   # bottom
        (0, 0, 1): ((1, 0, 0), (0, 1, 0)),    # front
        (0, 0, -1): ((-1, 0, 0), (0, 1, 0)),  # back
        (1, 0, 0): ((0, 0, -1), (0, 1, 0)),   # right
        (-1, 0, 0): ((0, 0, 1), (0, 1, 0))    # left
    }
    u, v = face_axes[face_normal]
    for i in range(3):
        for j in range(3):
            offset_u = [(i - 1) * (size + gap) * c for c in u]
            offset_v = [(j - 1) * (size + gap) * c for c in v]
            offset = [center[k] + offset_u[k] + offset_v[k] for k in range(3)]
            draw_square(offset, face_normal, size)

def draw_square(center, normal, size):
    half = size / 2
    glPushMatrix()
    glTranslatef(*center)
    glColor3f(1, 1, 1)
    glBegin(GL_QUADS)
    if normal == (0, 1, 0):
        glVertex3f(-half, 0, -half)
        glVertex3f(half, 0, -half)
        glVertex3f(half, 0, half)
        glVertex3f(-half, 0, half)
    elif normal == (0, -1, 0):
        glVertex3f(-half, 0, -half)
        glVertex3f(-half, 0, half)
        glVertex3f(half, 0, half)
        glVertex3f(half, 0, -half)
    elif normal == (0, 0, 1):
        glVertex3f(-half, -half, 0)
        glVertex3f(half, -half, 0)
        glVertex3f(half, half, 0)
        glVertex3f(-half, half, 0)
    elif normal == (0, 0, -1):
        glVertex3f(-half, -half, 0)
        glVertex3f(-half, half, 0)
        glVertex3f(half, half, 0)
        glVertex3f(half, -half, 0)
    elif normal == (1, 0, 0):
        glVertex3f(0, -half, -half)
        glVertex3f(0, -half, half)
        glVertex3f(0, half, half)
        glVertex3f(0, half, -half)
    elif normal == (-1, 0, 0):
        glVertex3f(0, -half, -half)
        glVertex3f(0, half, -half)
        glVertex3f(0, half, half)
        glVertex3f(0, -half, half)
    glEnd()
    glPopMatrix()

def draw_cube():
    draw_cube_solid()
    faces = [
        (0, 1, 0), (0, -1, 0), (0, 0, 1),
        (0, 0, -1), (1, 0, 0), (-1, 0, 0)
    ]
    for normal in faces:
        draw_sticker_face(normal, center=normal)

def main():
    pygame.init()
    screen = pygame.display.set_mode((800, 600), DOUBLEBUF | OPENGL)
    pygame.display.set_caption("Cube 3D sans glutSolidCube")

    glEnable(GL_DEPTH_TEST)
    glMatrixMode(GL_PROJECTION)
    gluPerspective(45, (800 / 600), 0.1, 100.0)
    glTranslatef(0.0, 0.0, -6.0)
    glRotatef(25, 1, 0, 0)
    glRotatef(-30, 0, 1, 0)

    clock = pygame.time.Clock()
    running = True
    while running:
        clock.tick(60)
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        draw_cube()
        pygame.display.flip()

        for event in pygame.event.get():
            if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
                running = False

    pygame.quit()

if __name__ == "__main__":
    main()

"""
Module pour gérer les animations de rotation du cube Rubik's.
"""

import numpy as np
from math import pi
from src.quaternion import (
    normalize, quaternion_multiply, axis_angle_to_quaternion,
    quaternion_to_matrix, rotate_x, rotate_y, rotate_z
)

class CubeAnimation:
    def __init__(self):
        self.current_rotation = None
        self.target_rotation = None
        self.animation_speed = pi / 30  # Vitesse de rotation en radians par frame
        self.is_animating = False
        self.animation_progress = 0

    def start_rotation(self, face, direction):
        """Démarre une animation de rotation pour une face donnée."""
        self.current_rotation = 0
        self.target_rotation = pi/2 if direction == 1 else -pi/2
        self.animation_progress = 0
        self.is_animating = True
        self.face = face
        self.direction = direction

    def update(self):
        """Met à jour l'état de l'animation."""
        if not self.is_animating:
            return False

        self.animation_progress += self.animation_speed
        if abs(self.animation_progress) >= abs(self.target_rotation):
            self.is_animating = False
            self.animation_progress = self.target_rotation
            return True

        return False

    def get_rotation_matrix(self):
        """Retourne la matrice de rotation actuelle pour l'animation."""
        if not self.is_animating:
            return np.identity(4)

        # Déterminer l'axe de rotation en fonction de la face
        if self.face == 'U':
            axis = (0, 1, 0)
        elif self.face == 'D':
            axis = (0, -1, 0)
        elif self.face == 'F':
            axis = (0, 0, 1)
        elif self.face == 'B':
            axis = (0, 0, -1)
        elif self.face == 'L':
            axis = (-1, 0, 0)
        elif self.face == 'R':
            axis = (1, 0, 0)

        # Créer le quaternion de rotation
        q = axis_angle_to_quaternion(axis, self.animation_progress)
        return quaternion_to_matrix(q)

    def apply_rotation_to_pieces(self, pieces):
        """Applique la rotation actuelle aux pièces du cube."""
        if not self.is_animating:
            return pieces

        rotation_matrix = self.get_rotation_matrix()
        rotated_pieces = []

        for piece in pieces:
            rotated_vertices = []
            for vertex in piece:
                # Convertir le vertex en vecteur 4D pour la multiplication matricielle
                v = np.array([vertex[0], vertex[1], vertex[2], 1])
                # Appliquer la rotation
                rotated_v = np.dot(rotation_matrix, v)
                # Reconvertir en 3D
                rotated_vertices.append(rotated_v[:3].tolist())
            rotated_pieces.append(rotated_vertices)

        return rotated_pieces 
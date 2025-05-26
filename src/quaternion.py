"""
Module de gestion des quaternions pour les rotations 3D.
Ce module fournit des fonctions pour manipuler les quaternions et effectuer des rotations 3D.
"""

import numpy as np
from math import cos, sin, sqrt

def normalize(vector, tolerance=0.00001):
    """
    Normalise un vecteur 3D.
    
    Args:
        vector (tuple): Le vecteur à normaliser
        tolerance (float): Tolérance pour la normalisation
        
    Returns:
        tuple: Le vecteur normalisé
    """
    mag2 = sum(n * n for n in vector)
    if abs(mag2 - 1.0) > tolerance:
        mag = sqrt(mag2)
        vector = tuple(n / mag for n in vector)
    return vector

def quaternion_multiply(q1, q2):
    """
    Multiplie deux quaternions.
    
    Args:
        q1 (tuple): Premier quaternion (w, x, y, z)
        q2 (tuple): Deuxième quaternion (w, x, y, z)
        
    Returns:
        tuple: Le quaternion résultant (w, x, y, z)
    """
    w1, x1, y1, z1 = q1
    w2, x2, y2, z2 = q2
    w = w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2
    x = w1 * x2 + x1 * w2 + y1 * z2 - z1 * y2
    y = w1 * y2 + y1 * w2 + z1 * x2 - x1 * z2
    z = w1 * z2 + z1 * w2 + x1 * y2 - y1 * x2
    return w, x, y, z

def axis_angle_to_quaternion(axis, angle):
    """
    Convertit un axe et un angle en quaternion.
    
    Args:
        axis (tuple): L'axe de rotation (x, y, z)
        angle (float): L'angle de rotation en radians
        
    Returns:
        tuple: Le quaternion (w, x, y, z)
    """
    axis = normalize(axis)
    x, y, z = axis
    angle /= 2
    w = cos(angle)
    x *= sin(angle)
    y *= sin(angle)
    z *= sin(angle)
    return w, x, y, z

def quaternion_to_matrix(quaternion):
    """
    Convertit un quaternion en matrice de rotation 4x4.
    
    Args:
        quaternion (tuple): Le quaternion (w, x, y, z)
        
    Returns:
        numpy.ndarray: La matrice de rotation 4x4
    """
    w, x, y, z = quaternion
    return np.array([
        [1 - 2 * y * y - 2 * z * z, 2 * x * y - 2 * z * w, 2 * x * z + 2 * y * w, 0],
        [2 * x * y + 2 * z * w, 1 - 2 * x * x - 2 * z * z, 2 * y * z - 2 * x * w, 0],
        [2 * x * z - 2 * y * w, 2 * y * z + 2 * x * w, 1 - 2 * x * x - 2 * y * y, 0],
        [0, 0, 0, 1]
    ], dtype='f')

def rotate_x(vector, angle):
    """
    Effectue une rotation autour de l'axe X.
    
    Args:
        vector (list): Le vecteur à rotationner [x, y, z]
        angle (float): L'angle de rotation en radians
        
    Returns:
        list: Le vecteur rotationné
    """
    rotation_matrix = np.array([
        [1, 0, 0],
        [0, cos(angle), -sin(angle)],
        [0, sin(angle), cos(angle)]
    ])
    return np.dot(rotation_matrix, vector).tolist()

def rotate_y(vector, angle):
    """
    Effectue une rotation autour de l'axe Y.
    
    Args:
        vector (list): Le vecteur à rotationner [x, y, z]
        angle (float): L'angle de rotation en radians
        
    Returns:
        list: Le vecteur rotationné
    """
    rotation_matrix = np.array([
        [cos(angle), 0, sin(angle)],
        [0, 1, 0],
        [-sin(angle), 0, cos(angle)]
    ])
    return np.dot(rotation_matrix, vector).tolist()

def rotate_z(vector, angle):
    """
    Effectue une rotation autour de l'axe Z.
    
    Args:
        vector (list): Le vecteur à rotationner [x, y, z]
        angle (float): L'angle de rotation en radians
        
    Returns:
        list: Le vecteur rotationné
    """
    rotation_matrix = np.array([
        [cos(angle), -sin(angle), 0],
        [sin(angle), cos(angle), 0],
        [0, 0, 1]
    ])
    return np.dot(rotation_matrix, vector).tolist() 
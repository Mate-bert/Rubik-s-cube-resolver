# Documentation du Projet : Détection de Points sur un Rubik's Cube avec YOLO et Mask R-CNN

## Introduction

Ce projet a pour objectif de détecter des points spécifiques sur un Rubik's Cube en utilisant un modèle de détection d'objets. Après plusieurs expérimentations et essais avec différentes approches, voici un résumé détaillé de mon raisonnement, des différentes solutions explorées et de celle qui a finalement permis d'obtenir les meilleurs résultats.

---

## Objectif du Projet

L'objectif initial était de développer un modèle capable de détecter des points spécifiques sur chaque face d'un Rubik's Cube. Pour ce faire, j'ai utilisé plusieurs approches d'intelligence artificielle, principalement basées sur des modèles de détection d'objets.

### Modèle choisi : YOLO

J'ai opté pour **YOLO** (You Only Look Once), un modèle de détection d'objets en temps réel, car il offre un bon compromis entre précision et performance. Le but était de créer un modèle qui détecte précisément les points d'intérêt sur les faces du Rubik's Cube.

---

## 1. Problématiques Initiales

### 1.1. Problème avec les Classes et Points

- Initialement, j'avais configuré le modèle avec **une seule classe** (la classe "face") pour l'ensemble des 7 points par face du cube. Cependant, cette approche ne donnait pas de bons résultats car les points étaient souvent mal classifiés et les prédictions n'étaient pas suffisamment précises.
  
- Le manque de distinction entre chaque point a compliqué la détection, car le modèle ne savait pas faire la différence entre les différentes positions sur le cube.

### 1.2. Résolution par Multi-Classe

- Après cette première étape infructueuse, j'ai revu la stratégie et décidé de séparer chaque point d'intérêt en **7 classes distinctes** (une classe pour chaque point), ce qui a permis au modèle de mieux comprendre la disposition des points sur chaque face du cube. Chaque point sur les faces du cube est ainsi identifié comme une classe différente.
  
- Cette réorganisation a conduit à de bien meilleurs résultats avec YOLO, où chaque point était correctement détecté sur ses différentes faces.

---

## 2. Approches Testées

### 2.1. Utilisation de Mask R-CNN

- Avant d'opter pour YOLO, j'ai envisagé d'utiliser **Mask R-CNN**, un modèle de segmentation d'images, car il est particulièrement adapté à la détection de segments dans des images complexes. L'idée était de segmenter les visages du Rubik's Cube et de détecter les points de manière plus précise.
  
- Cependant, l'implémentation de Mask R-CNN s'est révélée plus complexe, et après plusieurs ajustements, la solution ne s'est pas avérée plus efficace que YOLO pour la détection des points sur le Rubik's Cube.

### 2.2. Utilisation de YOLO avec un Dataset Personnalisé

- Après avoir échoué avec Mask R-CNN, j'ai décidé de revenir à **YOLO**. J'ai alors annoté mon dataset en **utilisant Roboflow** pour créer un dataset de détection d'objets, en attribuant des **bounding boxes** à chaque point d'intérêt sur les faces du Rubik's Cube.
  
- J'ai configuré le dataset avec 7 classes (une pour chaque point), et j'ai testé différentes tailles d'images et configurations d'entraînement. Cela a permis de formuler le modèle YOLO avec plus de précision et de rendre l'entraînement plus efficace.

---

## 3. Options et Solutions

### 3.1. Exportation et Entraînement avec YOLO

- Après avoir créé et annoté le dataset, j'ai procédé à l'**exportation du modèle au format ONNX**, ce qui m'a permis de l'utiliser avec **OpenCV** sur plusieurs plateformes, y compris sur le dispositif **Zybo 7010**, qui fonctionne sous Linux.
  
- L'entraînement du modèle a été réalisé avec les paramètres suivants :

  - **100 Époques** d'entraînement.
  - **Batch size** ajusté en fonction des ressources de ma machine (16).
  - Taille des images définie à **640x640**.
  - Évaluation des résultats sur un **dataset de validation** de 20 % des données.
  
- Les images ont été prétraitées pour une entrée optimale dans le réseau, avec un redimensionnement et une normalisation des valeurs de pixels.

---

## 4. Les Objets et Problèmes Rencontrés

### 4.1. **Erreur de Performance et Utilisation du CPU**

- **Problème** : Lors de l'entraînement initial, j'ai constaté que **le processeur** de ma machine était à 100 % d'utilisation, ce qui a entraîné des ralentissements et des temps d'entraînement excessifs. Ce problème a été causé par la charge élevée de l'entraînement sur **CPU**. J'ai donc opté pour une approche de calcul par **GPU** afin d'accélérer l'entraînement, mais il m'a fallu vérifier si ma machine supportait cette option.

### 4.2. **Utilisation des Classes et Points avec YOLO**

- **Problème** : La première tentative avec **une seule classe** pour tous les points a échoué. Cela a conduit à une confusion du modèle et à des détections incorrectes des points.

- **Solution** : En séparant chaque point en classes distinctes, j'ai pu obtenir une meilleure performance, ce qui a permis au modèle de mieux comprendre la structure du Rubik's Cube et d'identifier chaque point de manière précise.

---

## 5. Solution Finale

Après avoir testé plusieurs approches, la solution qui a fonctionné a été la suivante :

1. **Annotation du Dataset avec 7 Classes** : Utilisation de Roboflow pour annoter chaque point sur chaque face du Rubik's Cube avec des **bounding boxes** distincts.
2. **Entraînement avec YOLO** : Utilisation du modèle YOLO, avec une configuration adaptée (nombre d'époques, taille d'image, etc.), pour entraîner le modèle sur ce dataset.
3. **Exportation et Utilisation avec OpenCV** : Une fois le modèle entraîné, j'ai exporté le modèle en **ONNX** et l'ai utilisé avec OpenCV pour tester la détection en temps réel.

Cette approche a permis d'obtenir des résultats de détection précis et rapides, tout en utilisant efficacement les ressources matérielles disponibles.

---

## Conclusion

Le processus a impliqué plusieurs essais et erreurs, mais grâce à l'utilisation de YOLO, la séparation des classes et un bon choix de dataset, j'ai réussi à obtenir une détection efficace des points sur le Rubik's Cube. Les résultats montrent que cette solution est bien adaptée aux besoins du projet, offrant une détection rapide et précise tout en étant adaptable à des dispositifs embarqués comme la **Zybo 7010**.
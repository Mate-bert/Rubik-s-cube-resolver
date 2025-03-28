# 🧩 TODO – Détection des couleurs (Branche: feature/gad_detection_couleur)

Ce fichier est personnel à la branche `feature/gad_detection_couleur` et permet de suivre les étapes détaillées liées à l’implémentation de la détection des couleurs sur les faces du Rubik's Cube.

---

## 🔧 Objectifs spécifiques

- [ ] Lire une image contenant 3 faces du cube
- [ ] Découper chaque face en 9 cases
- [ ] Moyenniser les couleurs de chaque case (en HSV)
- [ ] Associer chaque moyenne à une couleur standard du cube (`R`, `G`, `B`, etc.)
- [ ] Générer une chaîne de 9 lettres par face
- [ ] Fusionner les 6 chaînes pour obtenir l’état complet du cube

---

## 🧪 Tests prévus

- [ ] Comparaison des chaînes générées avec des exemples réels
- [ ] Vérification de la stabilité des seuils HSV
- [ ] Affichage console ou fichier de debug des moyennes HSV et des lettres associées

---

## 🧠 Idées / améliorations

- [ ] Créer une fonction `detect_face(image)` générique
- [ ] Détecter dynamiquement les seuils HSV par calibration
- [ ] Générer un aperçu graphique des 6 faces reconstituées

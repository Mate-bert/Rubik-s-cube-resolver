# Rubik's Cube Resolver 🧩

Projet collaboratif visant à développer un système capable de résoudre un Rubik's Cube à partir d'une image capturée.

---

## 🛠️ Stack technique

- **Langages** : C / C++ / Python
- **Plateforme** : Zybo / PC
- **Bibliothèques** : OpenCV, etc.
- **Versioning** : Git + GitHub

---

## 🧩 Organisation du projet

Le projet est divisé en plusieurs sous-parties gérées par différentes équipes :

- 🎨 Détection des couleurs
- 📷 Gestion des caméras
- 🤖 Pilote des moteurs
- 🧠 Algorithme de résolution
- 🧰 Intégration FPGA (Zybo 7010)
- 🖨️ Impression 3D du support

## 📁 Arborescence du projet

```
.
├── interfacage_FPGA_SOC/     # Interface FPGA-SoC (Zybo)
│   # Contient les fichiers du projet Vivado, les IP cores, le bitstream et le code C pour la communication.
│   ├── project_rubik/       # Projet Vivado
│   ├── ip_catalog/         # IP cores personnalisés utilisé dans le projet vivado
│   ├── bitstream/          # Fichier de bistream envoyé sur la zybo
│   └── C/                  # Code C pour envoyer des données entre le SOC et le FPGA
│
├── ihm/                    # Interface Homme-Machine
│   # Contient le code source, les fichiers d'en-tête, les ressources et les exécutables de l'interface utilisateur.
│   ├── src/               # Code source
│   ├── include/           # Fichiers d'en-tête
│   ├── data/              # Ressources (images, etc.)
│   └── bin/               # Exécutables compilés
│
├── detection_resolution/   # Détection et résolution du cube
│   # Contient le code pour la détection des couleurs, l'algorithme de résolution, les utilitaires et scripts, et les modèles d'IA.
│   ├── src/               # Code source
│   ├── include/           # Fichiers d'en-tête
│   ├── utils/             # Utilitaires
│   ├── scripts/           # Scripts de test et d'automatisation
│   ├── IA/                # Modèles d'IA pour la détection
│   └── code_zybo/         # Code spécifique à la Zybo
│
├── PCB_Kicad/             # Conception du circuit imprimé
│   # Contient les fichiers de conception du PCB, les fichiers de fabrication, les pilotes moteurs, la BOM et les schémas d'alimentation.
│   ├── Fichier de fab/    # Fichiers pour la fabrication
│   ├── Driver_CMS/        # Pilotes des moteurs
│   ├── BOM/               # Liste des composants
│   └── Alimentation/      # Circuit d'alimentation
│
└── 3D/                    # Modèles 3D et rendus
    # Contient les modèles 3D des différentes pièces et structures, ainsi que des rendus PNG.
    ├── IHM_RUBIK_V0/      # Modèles de l'interface
    └── [Fichiers PNG]     # Rendu des différentes pièces
```

---

## 🧪 Contribution rapide

Chaque membre travaille sur une branche personnelle à partir de `dev`, en suivant la convention :

```
feature/<prenom>_<fonction>
```

**Exemples :**
- `feature/gad_detection_couleur`
- `feature/rayane_resolveur_cube`

📌 Les détails complets du workflow Git, des conventions de branche et de la gestion de la documentation sont disponibles ici :

👉 [Guide de contribution – CONTRIBUTING.md](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/docs/contributing/CONTRIBUTING.md)

---

## 📋 Documentation et suivi

- ✅ [Suivi des tâches – TODO.md](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/docs/todo/TODO.md) : tâches techniques à réaliser
- 📄 [Structure des branches – structure.md](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/docs/contributing/structure.md) : rôle des branches documentaires
- 📘 [Guide de contribution – CONTRIBUTING.md](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/docs/contributing/CONTRIBUTING.md)

---

Merci à tous pour vos contributions ! 🚀

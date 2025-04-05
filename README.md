# 🚀 Guide d'installation et de configuration PetaLinux

## 🧰 Prérequis

- Ubuntu 20.04 recommandé
- 50 à 60 Go d’espace libre (plus si vous utilisez des librairies comme OpenCV, FFmpeg, V4L-utils)

## 📦 Installation de PetaLinux

1. Télécharger l’installateur PetaLinux depuis le site AMD/Xilinx (inscription requise).
2. Donnez les permissions d’exécution :

```bash
chmod +x petalinux-v2024.2-*.run
```

3. Lancez l’installation :

```bash
./petalinux-v2024.2-*.run
```

4. Suivez les instructions et installez-le dans un dossier comme `~/petalinux`

## 🧹 Dépendances système requises

Installez les outils et bibliothèques :

```bash
sudo apt update && sudo apt install -y \
  gcc g++ make net-tools libncurses5-dev zlib1g-dev libssl-dev \
  libtool lib32z1 libglib2.0-dev libncurses5 libncursesw5 \
  xterm autoconf texinfo gcc-multilib build-essential
```

## 🧠 Configuration de l’environnement

```bash
source ~/petalinux/settings.sh
```

> ⚠️ Si vous avez l’erreur `/bin/sh is not bash`, utilisez `chsh` pour définir bash comme shell par défaut.

---

## 🏗️ Création du projet

```bash
petalinux-create -t project -n mon_projet --template zynq
cd mon_projet
```

## ⚙️ Ajout du hardware Vivado

Assurez-vous d’avoir généré un fichier `.xsa` avec **Vivado 2024.2** :

```bash
petalinux-config --get-hw-description=../votre_fichier.xsa
```

> 🔍 Le format `.xsa` est utilisable à partir de **Vivado 2019.2**. Si vous utilisez PetaLinux 2024.2, **Vivado 2024.2 est requis**.

---

## 📚 Ajout de bibliothèques (OpenCV, FFmpeg, v4l-utils)

### 1. Ajouter les recettes manquantes :

Téléchargez les fichiers `.bb` nécessaires depuis :

🔗 https://github.com/Xilinx/meta-petalinux/tree/master/recipes-core/packagegroups

Copiez-les dans :
```
project-spec/meta-user/recipes-core/packagegroups/
```

### 2. Ajouter les groupes dans `user-rootfsconfig`

Fichier : `project-spec/meta-user/conf/user-rootfsconfig`

```text
CONFIG_packagegroup-petalinux-v4lutils
CONFIG_packagegroup-petalinux-multimedia
```

### 3. Ajouter les layers si nécessaire dans `bblayers.conf`

Fichier : `build/conf/bblayers.conf`
Ajoutez par exemple :
```bash
${SDKBASEMETAPATH}/layers/meta-petalinux \
${SDKBASEMETAPATH}/layers/meta-qt5 \
```

---

## 🧩 Sélection des paquets avec menuconfig

```bash
petalinux-config -c rootfs
```

Dans l’interface :
- Allez dans **Filesystem Packages** puis **libs** pour cocher `ffmpeg`, `opencv`, etc.
- Puis dans **PetaLinux Package Groups** pour activer `packagegroup-petalinux-v4lutils`, `packagegroup-petalinux-multimedia`, etc.

---

## 🛠️ Build du projet

```bash
petalinux-build
```

> 💡 Si vous manquez d’espace disque pendant le build, faites :
>
```bash
du -h --max-depth=1 ~/Documents/mon_projet/ | sort -hr | head -n 20
```

Et supprimez le dossier `build/downloads` si nécessaire.

---

## 📦 Générer le SDK pour cross-compilation

```bash
petalinux-build --sdk
```

---

## 💾 Préparer la carte SD

1. **Créer deux partitions avec GParted** :
   - `boot` : FAT32 (environ 100 Mo)
   - `rootfs` : ext4 (le reste)

2. **Formater les partitions et monter-les** :
```bash
sudo mount /dev/mmcblk0p1 /mnt/sd_boot
sudo mount /dev/mmcblk0p2 /mnt/sd_root
```

3. **Copier les fichiers** :
```bash
# Pour le boot
cp BOOT.BIN image.ub /mnt/sd_boot

# Pour rootfs
sudo dd if=images/linux/rootfs.ext4 of=/dev/mmcblk0p2 bs=4M status=progress
sync
```

---

## 🚀 Boot sur la Zybo

Insérez la carte SD et redémarrez la Zybo en mode SD Boot (switch sur SD). 🎉

---

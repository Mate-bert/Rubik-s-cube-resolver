
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

### ⚙️ Configuration du système rootfs

Pour configurer les bibliothèques à inclure dans le système Linux généré, on utilise deux fichiers :

1. `project-spec/configs/rootfs_config`  
   Ce fichier est **généré automatiquement** lors de la configuration avec `petalinux-config -c rootfs`.

2. `project-spec/meta-user/conf/user-rootfsconfig`  
   Ce fichier est **à éditer manuellement** pour gagner du temps.

Par exemple, voici le contenu final de notre `user-rootfsconfig` :

```text
CONFIG_opencv
CONFIG_ffmpeg
CONFIG_v4l-utils
CONFIG_libv4l
CONFIG_zlib
CONFIG_libjpeg-turbo
CONFIG_libpng
CONFIG_libstdc++
```

Ensuite, exécutez simplement :

```bash
petalinux-config -c rootfs
```

> ✅ Les entrées du `user-rootfsconfig` apparaîtront déjà dans le menu **user packages**, il est inutile de les cocher à nouveau manuellement.

> ❗ Cela évite aussi d’oublier une bibliothèque et **accélère considérablement la configuration**.

---

## 🧩 Sélection manuelle des paquets (optionnelle)

```bash
petalinux-config -c rootfs
```

Dans l’interface :

- Allez dans **Filesystem Packages → libs** pour cocher des bibliothèques non listées.
- Dans **misc** pour `v4l-utils`, `libv4l`, etc.
- Dans **user packages** si vous avez utilisé `user-rootfsconfig` (ils y seront déjà listés).

> ❌ Inutile d’ajouter `media-ctl` pour des webcams USB UVC (standard). Gardez uniquement `v4l-utils` et `libv4l`.

---

## 🛠️ Build du projet

```bash
petalinux-build
```

> 💡 Si vous manquez d’espace disque pendant le build, faites :

```bash
du -h --max-depth=1 ~/Documents/mon_projet/ | sort -hr | head -n 20
```

Et supprimez le dossier `build/downloads` si nécessaire (pas indispensable pour `--sdk`).

---

## 📦 Générer le SDK pour cross-compilation

```bash
petalinux-build --sdk
```

> ✅ Les librairies nécessaires pour cross compiler vos applications C++/OpenCV :
>
> - `gcc-runtime`
> - `libc`
> - `libstdc++`
> - `opencv`
> - `ffmpeg`, `libavcodec`, `libavformat`
> - `zlib`, `libjpeg-turbo`, `libpng`
> - `v4l-utils`, `libv4l`

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

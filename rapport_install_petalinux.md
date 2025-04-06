# 📝 Rapport d'installation PetaLinux 2024.2

Ce document retrace toutes les étapes de l'installation de PetaLinux 2024.2, les problèmes rencontrés, ainsi que les solutions apportées.

---

## 📁 Système de départ

- Ubuntu : 20.04
- Espace libre initial : ~10 Go (pas suffisant)
- RAM : 4 Go
- Objectif : Utiliser OpenCV, V4L-utils, FFmpeg et cross-compiler avec SDK

---

## 📦 Installation de PetaLinux

1. Téléchargement du fichier `.run` sur le site Xilinx.
2. Installation dans `~/petalinux` :

```bash
chmod +x petalinux-v2024.2-*.run
./petalinux-v2024.2-*.run
```

3. Ajout à l’environnement :
```bash
source ~/petalinux/settings.sh
```

---

## 🔧 Problèmes rencontrés & Résolutions

### 🧱 Problème : Espace disque insuffisant

- **Cause** : Partition Linux de 80 Go partagée avec swap de 16 Go.
- **Solution** : Réinstallation propre de Linux avec :
  - `/swap` : 4 Go
  - `/` : 100+ Go

---

### 🧩 Problème : `libjpeg` introuvable

- **Message** : `Nothing RPROVIDES 'libjpeg'`
- **Solution** : Vrai nom `libjpeg-turbo` .

---

### 🔌 Problème : bitbake bloqué (socket timeout)

- **Message** : `NOTE: Retrying server connection...`
- **Cause** : bitbake bloqué à cause de surcharge système ou erreur précédente.
- **Solution** :
  ```bash
  petalinux-build -x distclean
  ```

---

### 🧠 Optimisation : stockage des sources sur SSD externe

- **But** : Soulager l’espace du NVMe pour garder la rapidité.
- **Commande** :
  ```bash
  mv build/downloads /media/gad/Maxtor/plnx_downloads
  ln -s /media/gad/Maxtor/plnx_downloads build/downloads
  ```

---

### ⚠️ Warning fréquents

- **`32bit API` warnings** pour `v4l-utils`
  - Inoffensif pour usage basique
  - Suppressible via `INSANE_SKIP = "32bit-time"`

---

## 📦 Génération du SDK

```bash
petalinux-build --sdk
```

- Taille du `.sh` généré : ~758 Mo
- Espace requis : au moins 15 Go libres recommandés

---

## 📁 Installation SDK dans un dossier personnalisé

```bash
mkdir -p ~/tools/sdk-petalinux
./petalinux-glibc-x86_64-*-toolchain-2024.2.sh -d ~/tools/sdk-petalinux
```

Puis :

```bash
source ~/tools/sdk-petalinux/environment-setup-cortexa9t2hf-neon-xilinx-linux-gnueabi
```

---

## 🧱 Bibliothèques utilisées (rootfs)

Ajoutées via `project-spec/meta-user/conf/user-rootfsconfig` :

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

---

## 📌 Conclusion

L'installation de PetaLinux et la configuration pour une application utilisant webcam, OpenCV et IA sur une Zybo Z7010 demande :

- Une machine bien configurée (espace disque > 60 Go)
- De la patience pour les builds longs
- Une bonne organisation des layers et paquets dans le rootfs

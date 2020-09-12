# Packages I install for Arch Linux

## System

* base
* base-devel
* linux
* linux-firmware
* zsh
  + zsh-completion
  + zsh-syntax-highlighting
* grub
  + efibootmgr
* intel-ucode
* man-db
* flatpak
* libappimage
* pulseaudio-bluetooth *(For bluetooth audio devices)*

### Drivers

* mesa
* libva-mesa-driver
* mesa-vdpau
* amd-vlk
* xf86-video-amdgpu
* libdvdcss
* ntfs-3g
* vkd3d

### multilib

Enable *multilib* repo to install these packages.

* steam
* wine
  + winetricks
  + wine-mono
  + wine-gecko

#### Drivers and support

* lib32-libva-mesa-driver
* lib32-vdpau
* lib32-amdvlk

## Misc

* vim
* git
* firefox
  + firefox-i18n-pl
* thunderbird
  + thunderbird-i18n-pl
* qbittorrent
* hunspell
  + hunspell-en_US
  + hunspell-pl
* htop
* neofetch
  + pacman-contrib
* obs-studio
* simple-scan

## KDE Plasma

* plasma-meta
* konsole
* dolphin
  + dolphin-plugins
  + qt5-imageformats
  + ffmpegthumbs
  + thumb
  + audiocd-kio
* ark
  + p7zip
  + unarchiver
* gwenview
  + kimageformats
* discover
  + fwupd
  + packagekit-qt5
* kdeconnect
* filelight
* kdenetwork-filesharing
  + kio-gdrive
* spectacle
* kate

## Fonts

* adobe-source-code-pro-fonts
* adobe-source-sans-pro-fonts
* adobe-source-serif-pro-fonts
* noto-fonts
* noto-fonts-cjk
* noto-fonts-emoji
* noto-fonts-extra
* ttf-ubuntu-font-family
* ttf-inconsolata
* ttf-liberation
* ttf-fira-sans
* ttf-fira-mono
* ttf-fira-code

## AUR

Enable [*chaotic-aur*](https://lonewolf.pedrohlc.com/chaotic-aur/) repo to install AUR binary packages.

### Misc

* ungoogled-chromium
* pamac-aur
* discord
* librewolf

### Themes

* qogir-gtk-theme-git
* qogir-icon-theme-git
* qogir-kde-theme-git

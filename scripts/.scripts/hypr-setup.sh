#! /bin/bash

# if archinstall is not run, make sure to install the following:
#   pipewire for audio
#   dolphin for file manager
#   grim for taking screenshots
#   qt5wayland and qt6wayland
#   slurp to allow cursor to select with drag and drop
#   uwsm as helper layer to let you setup wayland using different scripts
#   wofi as app launcher
#   xdg-desktop-portal-hyprland for screen utilities, sharing, etc.
#   sddm as login manager (including the first boot login screen)
#   mako as notification deamon
#   pamixer, pavucontrol for audio controls from the system bar
#   bluez, bluez-utils, blueman, blueman-applet, bluetui for bluetooth controls
#   opensnitch for firewall
#   brightnessctl to handle monitor brightness
#   install xdg-user-dirs to handle commmonly used dirs
#   install hyprpolkitagent for a GUI that apps use to request elevated privileges
#   install networkmanager and network-manager-applet to handle wifi
#   install cliphist as clipboard manager

# install yay
# install hyprpaper, hyperlock and ashell / waybar
# install ghostty
# install xclip for clipboard
# install wlogout for status bar menu
# install brave and obsidian as main apps
# install fzf via yay
#
#
# fonts
sudo pacman -S ttf-jetbrains-mono-nerd
sudo pacman -S noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk

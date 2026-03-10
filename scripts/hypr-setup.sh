#! /bin/bash

# if archinstall is not run, make sure to install the following:
#   pipewire for audio
#   dolphin for file manager
#   polkit-kde-agent for authentication processes
#   grim for taking screenshots
#   qt5wayland and qt6wayland
#   slurp to allow cursor to select with drag and drop
#   uwsm as helper layer to let you setup wayland using different scripts
#   wofi as app launcher
#   xdg-desktop-portal-hyprland for screen utilities, sharing, etc.
#   sddm as login manager (including the first boot login screen)
#   mako as notification deamon
#   pamixer, pavucontrol for audio controls from the system bar
#   bluez, bluetui for bluetooth controls
#   opensnitch for firewall

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

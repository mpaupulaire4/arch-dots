#!/bin/bash

set -e
source $HOME/.scripts/utils.sh

echo "Settting Up DNS Resolution"
sudo ln -sf /run/systemd/resolve/stub-resolve.conf /etc/resolve.conf

if yorn 'Connect to Internet?'; then
  nmtui
fi

echo 'Updating'
sudo pacman -Syu

if yorn 'Install PARU?'; then
  sudo pacman -S rustup
  rustup toolchain install stable
  rustup default stable
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ..
  rm -rf paru

  paru --gendb
fi

if yorn 'Configure Reflector?'; then
  sudo mkdir -p /etc/xdg/reflector
  sudo cp -i $HOME/.config/reflector/reflector.conf /etc/xdg/reflector/reflector.conf
  paru -S reflector --needed
  sudo systemctl enable --now reflector.service
fi

if yorn 'Configure Bluetooth?'; then
  paru -S bluez --needed
  sudo systemctl enable bluetooth.service
fi

if yorn 'Install NVM and Node?'; then
  paru -S nvm --needed
  source /usr/share/nvm/init-nvm.sh
  nvm install 'lts/*'
  nvm install-latest-npm
  corepack enable
fi

if yorn 'Install Sway?'; then
  paru -S sway grim slurp swayidle swaylock swaybg xorg-xwayland --needed
fi

if yorn 'Install I3?'; then
  paru -S xorg-server xorg-xrandr xf86-video-intel autorandr i3-gaps --needed
fi

if yorn 'Install Display Manager?'; then
  paru -S ly --needed
  sudo systemctl enable ly.service
fi

if yorn 'Install and enable power management?'; then
  paru -S tlp
  sudo systemctl enable tlp
fi

if yorn 'Enable ssh agaent systemd unit?';  then
  systemctl --user enable ssh-agent
fi

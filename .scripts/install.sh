#!/bin/bash

set -e
source $HOME/.scripts/utils.sh

echo "Settting Up DNS Resolution"
sudo ln -sf /run/systemd/resolve/stub-resolve.conf /etc/resolve.conf
touch .pkgignore

echo 'Updating'
sudo pacman -Syu

if yorn 'Install PARU?'; then
  sudo pacman -S --needed git base-devel --asdeps
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ..
  rm -rf paru

  paru --gendb
fi

if yorn 'Configure Reflector?'; then
  sudo mkdir -p /etc/xdg/reflector
  create_link $HOME/.config/reflector/reflector.conf /etc/xdg/reflector/reflector.conf
  paru -S reflector --needed
  sudo systemctl enable reflector.service
  sudo systemctl start reflector.service
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
  npm install -g yarn
fi

if yorn 'Install xorg?'; then
  paru -S xorg-server xf86-video-intel xorg-xrandr --needed
fi

if yorn 'Install Display Manager and Window Manager?'; then
  paru -S ly i3-gaps i3lock --needed
  sudo systemctl enable ly.service
fi

if yorn 'Install and enable power management?'; then
  paru -S tlp
  sudo systemctl enable tlp
fi

if yorn 'Enable ssh agaent systemd unit?';  then
  systemctl --user enable ssh-agent
fi

if yorn 'Install pkgs from pkglist?'; then
  source $HOME/.zshrc
  dots-up
fi

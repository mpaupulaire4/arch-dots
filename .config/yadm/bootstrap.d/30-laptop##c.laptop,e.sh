#!/bin/bash -e
#
# TODO: Add changes to
# - /etc/pam.d/system-local-login
# - /etc/pam.d/swaylock
# to allow frprint
# auth	  sufficient  	pam_unix.so try_first_pass likeauth nullok
#

if ! systemctl is-enabled keyd.service >/dev/null 2>&1; then
  paru -S keyd --needed
  sudo systemctl enable keyd.service
  sudo ln -sf "$HOME/.config/keyd/default.conf" /etc/keyd/default.conf
fi

if ! systemctl is-enabled ufw.service >/dev/null 2>&1; then
  paru -S ufw --needed
  sudo systemctl enable ufw.service
  sudo ufw default deny
  sudo ufw allow from 192.168.0.0/24
  sudo ufw limit ssh
  sudo ufw enable
fi

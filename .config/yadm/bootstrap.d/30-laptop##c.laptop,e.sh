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
  # TODO: nove to a separate if condition.
  # if the files aren't the same then
  # override what is there with what is in the config dir
  sudo cp $HOME/.config/keyd/default.conf /etc/keyd/default.conf
fi

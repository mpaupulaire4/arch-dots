efibootmgr \
  --disk /dev/nvme0n1 \
  --part 1 \
  --create --label "Arch Linux" \
  --loader /vmlinuz-linux \
  --verbose \
  --unicode \
  'cryptdevice=UUID=f128eccb-7943-413c-aa74-17729008289e:cryptlvm root=/dev/datafortress/root resume=/dev/datafortress/root resume_offset=34816 rw initrd=\intel-ucode.img initrd=\initramfs-linux.img'

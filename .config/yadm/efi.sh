efibootmgr \
  --disk /dev/nvme0n1 \
  --part 1 \
  --create --label "Arch Linux" \
  --loader /vmlinuz-linux-zen \
  --verbose \
  --unicode \
  'cryptdevice=UUID=bde9a0ff-cdf9-424c-89c9-4c9ee9b454aa:cryptlvm root=/dev/datafortress/root resume=/dev/datafortress/root resume_offset=34816 rw initrd=\intel-ucode.img initrd=\initramfs-linux-zen.img'

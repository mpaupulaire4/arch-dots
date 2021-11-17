# Arch Linux Configs

## Installation
[Disk Encryption](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS) |
[Install Guide](https://wiki.archlinux.org/title/Installation_guide) |
[EFI Boot](https://wiki.archlinux.org/title/EFISTUB) |
[General](https://wiki.archlinux.org/title/General_recommendations)

- foloow Encryption for partition set up then with install guid. Swtich back for initramfs and boot.
- Decide if you are going to use `linux` or `linux-lts` kernels.
- see `efi.sh` for EFI boot script
- boot config located at `/etc/mkinitcpio.conf`, `mkinitcpio -P` to generate
- `lsblk -f` To get UUIDs where needed
- **clone this scripts repo then run `basic.sh`**

### Pacstrap Packages
- `intel-ucode` or `amd-ucode` for processor updates.
  - Add `initrd=\cpu_manufacturer-ucode.img` before normal `initrd`
- `git`

## Once installed you can run `install.sh` to get things setup

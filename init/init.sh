#!/bin/sh

# Set Packages
PACKAGELIST='base base-devel linux-zen linux-zen-headers linux-firmware nano iputils iw bash-completion zsh zsh-completions intel-ucode amd-ucode'

if [ $# -lt 6 ]
then
    echo 'Usage:'
    echo 'install.sh <DISK> <Wi-Fi Interface> <DE:Yes|No> <Graphics:NVIDIA|ATI|Radeon|Intel|None> <HostName> <UserName>'
    exit
fi

if [ "$2" != "-" ]
then
    PACKAGELIST="$PACKAGELIST wpa_supplicant networkmanager dhcpcd"
fi

if [ "$3" = "Yes" ]
then
    PACKAGELIST="$PACKAGELIST plasma-meta kde-applications-meta noto-fonts-cjk noto-fonts-emoji"
fi

case "$4" in
    "NVIDIA") PACKAGELIST="$PACKAGELIST nvidia"
    ;;
    "ATI") PACKAGELIST="$PACKAGELIST xf86-video-ati"
    ;;
    "Radeon") PACKAGELIST="$PACKAGELIST xf86-video-amdgpu"
    ;;
    "Intel") PACKAGELIST="$PACKAGELIST xf86-video-intel"
    ;;
esac

# Partitioning
# parted -s -a optimal $1 mklabel gpt
# parted -s -a optimal $1 mkpart boot fat32 1 501
# parted -s -a optimal $1 set 1 boot on
# parted -s -a optimal $1 mkpart root ext4 501 100%

# Format
# mkfs.vfat -F32 ${1}1
# mkfs.ext4 ${1}2

# Mount
mount ${1}2 /mnt
mkdir /mnt/boot
mount ${1}1 /mnt/boot

# Wi-Fi
if [ "$2" != "-" ]
then
    # Config
    clear
    read -p 'Input SSID:' SSID
    read -p 'Input PASS:' PASS

    # Setup
    ip link set $2 up
    echo 'ctrl_interface=DIR=/run/wpa_supplicant' > /etc/wpa_supplicant.conf
    wpa_passphrase "$SSID" "$PASS" >> /etc/wpa_supplicant.conf

    # Connect
    wpa_supplicant -B -i $2 -c /etc/wpa_supplicant.conf
    dhcpcd $2
fi
timedatectl set-ntp true

# Installing
reflector --country Japan --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt $PACKAGELIST

# Configure System
genfstab -U /mnt >> /mnt/etc/fstab
sed -i -e "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /mnt/etc/locale.gen
sed -i -e "s/#ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/" /mnt/etc/locale.gen
sed -i -e "s/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/" /mnt/etc/sudoers
echo LANG=en_US.UTF-8 > /mnt/etc/locale.conf
# echo KEYMAP=jp106 > /mnt/etc/vconsole.conf
echo "$5" > /etc/hostname
echo '127.0.0.1     localhost' >> /mnt/etc/hosts
echo '::1           localhost' >> /mnt/etc/hosts
echo "127.0.1.1     $5.localdomain  $5" >> /mnt/etc/hosts
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
arch-chroot /mnt hwclock --systohc --utc
arch-chroot /mnt locale-gen

if [ $2 != "-" ]
then
    arch-chroot /mnt systemctl enable NetworkManager.service
    arch-chroot /mnt systemctl enable dhcpcd.service
fi

if [ $3 = "Yes" ]
then
    arch-chroot /mnt systemctl enable sddm.service
fi

arch-chroot /mnt useradd -m -G wheel -s /bin/bash "$6"
clear
echo 'Input root password.'
arch-chroot /mnt passwd
clear
echo 'Input user password.'
arch-chroot /mnt passwd "$6"

arch-chroot /mnt bootctl --path=/boot install
echo 'default arch' > /mnt/boot/loader/loader.conf

echo 'title Arch Linux' > /mnt/boot/loader/entries/arch.conf
echo 'linux /vmlinuz-linux-zen' >> /mnt/boot/loader/entries/arch.conf
echo 'initrd /intel-ucode.img' >> /mnt/boot/loader/entries/arch.conf
echo 'initrd /amd-ucode.img' >> /mnt/boot/loader/entries/arch.conf
echo 'initrd /initramfs-linux-zen.img' >> /mnt/boot/loader/entries/arch.conf
arch-chroot /mnt blkid ${1}2 | sed -r 's/.*"(\S*)".*/options root=PARTUUID=\1 rw/' >> /mnt/boot/loader/entries/arch.conf
clear
echo 'Install finished.'

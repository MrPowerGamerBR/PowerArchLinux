loadkeys br-abnt2
mkfs.ext4 /dev/nvme0n1p6
mount /dev/nvme0n1p6 /mnt
mount --mkdir /dev/nvme0n1p4 /mnt/boot

echo "Atualizando mirrors..."
reflector --country Brazil --protocol http,https --sort rate --fastest 2 --save /etc/pacman.d/mirrorlist

echo "Excluindo kernel antigo..."
rm /mnt/boot/amd-ucode.img
rm /mnt/boot/initramfs-linux.img
rm /mnt/boot/vmlinuz-linux

# Apenas o essencial é instalado aqui, é um "bootstrap" para primeiro instalar as coisas realmente essenciais para depois instalar as coisas menos essenciais
# Assim é até melhor, pois evita você ficar muito tempo esperando instalar todas as packages enquanto você olha para um terminal
echo "Instalando pacotes (bootstrap)..."

# PACKAGE DESCRIPTIONS:
# dolphin-plugins: Adds useful features to Dolphin (like right click on a ISO file -> Mount)
# ark: Compressor/Decompressor
pacstrap -K /mnt base base-devel linux linux-firmware pacman-contrib amd-ucode nano networkmanager git efibootmgr vi vim sudo curl wget zip unzip less rsync firefox plasma-meta kde-system dolphin-plugins sddm konsole kwalletmanager fish reflector pkgstats screen tailscale fastfetch discord flatpak flatpak-kcm htop ntfs-3g qbittorrent dosfstools openssh ksshaskpass noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono ark
genfstab -U /mnt >> /mnt/etc/fstab

curl -L -o /mnt/bootstrap-stage2.sh https://raw.githubusercontent.com/MrPowerGamerBR/PowerArchLinux/refs/heads/main/scripts/bootstrap-stage2.sh
echo "Rode o script /bootstrap-stage2.sh dentro do \"arch-chroot -S /mnt\" para continuar :3"
arch-chroot /mnt

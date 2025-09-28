loadkeys br-abnt2
mkfs.ext4 /dev/nvme0n1p4
mount /dev/nvme0n1p4 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/efi
reflector --country Brazil --protocol http,https --sort rate --fastest 2 --save /etc/pacman.d/mirrorlist
# Apenas o essencial é instalado aqui, é um "bootstrap" para primeiro instalar as coisas realmente essenciais para depois instalar as coisas menos essenciais
# Assim é até melhor, pois evita você ficar muito tempo esperando instalar todas as packages enquanto você olha para um terminal
pacstrap -K /mnt base base-devel linux linux-firmware pacman-contrib amd-ucode nano networkmanager git nvidia-open grub efibootmgr vi vim sudo curl wget zip unzip less rsync firefox plasma-meta kde-system sddm konsole kwalletmanager noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

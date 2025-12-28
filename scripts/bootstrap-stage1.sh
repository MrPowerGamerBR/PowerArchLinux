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

# Recommended KDE packages (not EVERYTHING is actually useful, but it is a good pointer): https://community.kde.org/Distributions/Packaging_Recommendations
pkgs=(
    base
    base-devel
    linux
    linux-firmware
    pacman-contrib
    amd-ucode
    nano
    networkmanager
    git
    efibootmgr
    vi
    vim
    sudo
    curl
    wget
    zip
    unzip
    less
    rsync
    firefox
    plasma-meta
    kde-system
    sddm
    konsole
    kwalletmanager
    fish
    reflector
    pkgstats
    screen
    tailscale
    fastfetch
    discord
    flatpak
    flatpak-kcm
    htop
    ntfs-3g
    qbittorrent
    dosfstools
    openssh
    ksshaskpass
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk
    noto-fonts-emoji
    ttf-jetbrains-mono
    # Has "hostname" command
    inetutils
    # Useful for network debugging
    traceroute
    # Useful for network debugging
    mtr
    # Adds useful features to Dolphin (like right click on a ISO file -> Mount)
    dolphin-plugins
    # Video thumbnails in Dolphin
    ffmpegthumbs
    # KDE Connect
    kdeconnect
    # PDF thumbnails & others in Dolphin
    kdegraphics-thumbnailers
    # VLC + codec plugins
    vlc
    vlc-plugins-all
    # Use VLC as a backend for Phonon
    phonon-qt6-vlc
    # KDE recommends this for tray icons
    libappindicator
    # Adds supports for webp & others, allows Dolphin to display thumbnails for these formats
    qt6-imageformats
    # Printer things
    cups
    system-config-printer
    # Compressor/Decompressor that integrates nicely in Dolphin (+ plugins)
    # (by default ark seems to be able to compress via 7zip, but it just fails silently if you don't have 7zip installed)
    # unarchiver provides rar decompression, but we also use unrar because unrar provides a CLI tool for rar extraction
    ark
    7zip
    arj
    lrzip
    lzop
    unarchiver
    unrar
    # Vulkan Driver for AMD Radeon GPUs
    vulkan-radeon
)

pacstrap -K /mnt "${pkgs[@]}"

genfstab -U /mnt >> /mnt/etc/fstab

curl -L -o /mnt/bootstrap-stage2.sh https://raw.githubusercontent.com/MrPowerGamerBR/PowerArchLinux/refs/heads/main/scripts/bootstrap-stage2.sh
echo "Rode o script /bootstrap-stage2.sh dentro do \"arch-chroot /mnt\" para continuar :3"
arch-chroot /mnt

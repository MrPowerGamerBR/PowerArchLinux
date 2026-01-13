set -euxo pipefail

source .powerarch_install_vars

ROOT_UUID=$(blkid -s UUID -o value $ARCH_PARTITION)

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
sudo sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/^# *pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
echo "deeparch-whistler" > /etc/hostname # hostname da maquina
echo "Senha Root:"
passwd # troca a senha do usuario root
useradd -m -G wheel -s /bin/bash mrpowergamerbr
# coloca para poder usar sudo sem precisar de senha
mkdir -p /etc/sudoers.d/
echo "%wheel ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/wheel_nopasswd
echo "Senha MrPowerGamerBR:"
passwd mrpowergamerbr # troca a senha do usuario MrPowerGamerBR

echo "Ativando multilib e color no pacman..."
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i "/\[multilib\]/,/Include/s/^#//" /etc/pacman.conf

echo "Configurando reflector..."
curl -L -o /etc/xdg/reflector/reflector.conf https://raw.githubusercontent.com/MrPowerGamerBR/PowerArchLinux/refs/heads/main/reflector.conf

echo "Atualizando pacotes..."
pacman -Syu

echo "Configurando fish..."
sudo -u mrpowergamerbr mkdir -p /home/mrpowergamerbr/.config/fish/
sudo -u mrpowergamerbr curl -L -o /home/mrpowergamerbr/.config/fish/config.fish https://raw.githubusercontent.com/MrPowerGamerBR/PowerArchLinux/refs/heads/main/fish.config
usermod -s /bin/fish mrpowergamerbr

echo "Configurando serviços..."
systemctl enable NetworkManager.service
systemctl enable sddm.service
systemctl enable systemd-resolved.service
systemctl enable tailscaled.service
systemctl enable fstrim.timer
systemctl enable pkgstats.timer
systemctl enable paccache.timer # Limpa o cache do pacman periodicamente
systemctl enable pacman-filesdb-refresh.timer # https://wiki.archlinux.org/title/Pacman#Querying_package_databases
systemctl enable reflector.timer
systemctl enable cups.service

echo "Configurando swap..."
fallocate -l 16G /swapfile # adicionar swap file (é bom ter para evitar programas morrendo ao usar mais memória do que você tem)
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab
swapon --show # verificar se o swap está funcionando

echo "Configurando systemd-boot..."
rm -rf /boot/EFI/systemd
rm -rf /boot/loader
bootctl install
mkdir -p /boot/loader/entries

cat > /boot/loader/loader.conf <<EOF
default arch.conf
timeout 3
editor no
EOF

# We use zswap because it is technically "good" when the system is using a lot of RAM, even if you have a lot of RAM like I do (32GBs)
cat > /boot/loader/entries/arch.conf <<EOF
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root=UUID=$ROOT_UUID rw zswap.enabled=1 zswap.compressor=zstd zswap.zpool=zsmalloc
EOF

echo "Ativando syntax highlighting no nano..."
sudo -u mrpowergamerbr bash -c 'echo "include /usr/share/nano/*.nanorc" >> ~/.nanorc'

echo "Configurando git..."
sudo -u mrpowergamerbr git config --global user.email "git@mrpowergamerbr.com"
sudo -u mrpowergamerbr git config --global user.name "MrPowerGamerBR"
# Usar o ksshaskpass faz o git salvar a senha no wallet do KDE
sudo -u mrpowergamerbr git config --global core.askPass /usr/bin/ksshaskpass

# A gente não pode usar arch-chroot -S justamente porque o yay falha dentro do -S
echo "Instalando yay..."
sudo -u mrpowergamerbr bash -c 'mkdir -p /home/mrpowergamerbr/; cd /home/mrpowergamerbr/; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; cd /'

echo "Instalando shim-signed para Secure Boot..."
sudo -u mrpowergamerbr yay -S shim-signed --noconfirm
rm -rf /boot/EFI/systemd-shim
mkdir -p /boot/EFI/systemd-shim
cp /usr/share/shim-signed/mmx64.efi /usr/share/shim-signed/shimx64.efi /boot/EFI/systemd-shim/
# Sim, o nome precisa ser grubx64
cp /boot/EFI/systemd/systemd-bootx64.efi /boot/EFI/systemd-shim/grubx64.efi

echo "Criando entradas UEFI..."
# part = qual partição está (neste caso é /dev/nvme0n1p4)
efibootmgr --create --disk $EFI_DISK --part $EFI_PARTITION_ID --label "Linux Boot Manager" --loader '\EFI\SYSTEMD\SYSTEMD-BOOTX64.efi'
efibootmgr --create --disk $EFI_DISK --part $EFI_PARTITION_ID --label "Linux Boot Manager (Secure Boot)" --loader '\EFI\SYSTEMD-SHIM\SHIMX64.efi'

echo "Diminuindo timeout do systemd..." # para diminuir o timeout padrão (120s) do systemd, é bom para quando tem um app "locked up" na hora de desligar
mkdir -p /usr/lib/systemd/user.conf.d/
cat > /usr/lib/systemd/user.conf.d/00-process-timeouts.conf <<EOF
[Manager]
DefaultTimeoutStopSec=5s
EOF

# https://community.kde.org/Distributions/Packaging_Recommendations#Polkit_configuration
echo "Configurando regras do polkit para timezones..."
mkdir -p /usr/share/polkit-1/rules.d/
cat > /usr/share/polkit-1/rules.d/00-ntp-and-time-zones.rules <<EOF
// Allow current user or their system services to change the system time zone and time synchronization
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.timedate1.set-timezone" || action.id == "org.freedesktop.timedate1.set-ntp") && subject.active) {
        return polkit.Result.YES;
    }
});
EOF

echo "Instalando e configurando fontes..."
mkdir -p /usr/local/share/fonts/l/
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-Regular.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Regular.otf
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-Bold.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Bold.otf 
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-BoldItalic.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-BoldItalic.otf 
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-Italic.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Italic.otf
fc-cache -f -v

# These settings are in ~/.config/kdeglobals
MAIN_FONT="Lexica Ultralegible,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
FIXED_FONT="JetBrains Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
SMALL_FONT="Lexica Ultralegible,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

sudo -u mrpowergamerbr kwriteconfig6 --file kdeglobals --group General --key font "$MAIN_FONT"
sudo -u mrpowergamerbr kwriteconfig6 --file kdeglobals --group General --key menuFont "$MAIN_FONT"
sudo -u mrpowergamerbr kwriteconfig6 --file kdeglobals --group General --key toolBarFont "$MAIN_FONT"
sudo -u mrpowergamerbr kwriteconfig6 --file kdeglobals --group General --key fixed "$FIXED_FONT"
sudo -u mrpowergamerbr kwriteconfig6 --file kdeglobals --group General --key smallestReadableFont "$SMALL_FONT"
sudo -u mrpowergamerbr kwriteconfig6 --file kdeglobals --group WM --key activeFont "$MAIN_FONT"

echo "Instalando tema do catppuccin para o Konsole..."
sudo -u mrpowergamerbr mkdir -p /home/mrpowergamerbr/.local/share/konsole/
sudo -u mrpowergamerbr curl -L -o /home/mrpowergamerbr/.local/share/konsole/catppuccin-mocha.colorscheme https://raw.githubusercontent.com/catppuccin/konsole/refs/heads/main/themes/catppuccin-mocha.colorscheme

echo "Prontinho :3 Divirta-se!"

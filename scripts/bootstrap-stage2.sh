set -euxo pipefail

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "deeparch-whistler" >> /etc/hostname # hostname da maquina
echo "Senha Root:"
passwd # troca a senha do usuario root
useradd -m -G wheel -s /bin/bash mrpowergamerbr
visudo # descomentar %wheel ... perto do final (coloca para poder usar sudo sem precisar de senha)
echo "Senha MrPowerGamerBR:"
passwd mrpowergamerbr # troca a senha do usuario MrPowerGamerBR

echo "Ativando multilib e color no pacman..."
nano /etc/pacman.conf

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
systemctl enable fstrim.timer
systemctl enable pkgstats.timer
systemctl enable paccache.timer # Limpa o cache do pacman periodicamente
systemctl enable pacman-filesdb-refresh.timer # https://wiki.archlinux.org/title/Pacman#Querying_package_databases
systemctl enable reflector.timer

echo "Configurando swap..."
fallocate -l 32G /swapfile # adicionar swap file (é bom ter para evitar programas morrendo ao usar mais memória do que você tem)
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab
swapon --show # verificar se o swap está funcionando

echo "Configurando GRUB..."
rm -rf /efi/EFI/ArchLinuxGRUB
rm -rf /efi/EFI/ArchLinuxGRUBInsecure
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinuxGRUBInsecure
nano /etc/default/grub # 1280x720 no DISPLAY e tirar quiet
grub-mkconfig -o /boot/grub/grub.cfg
sudo cat /boot/grub/grub.cfg | grep ucode # ver se está com o ucode ativado

echo "Ativando syntax highlighting no nano..."
sudo -u mrpowergamerbr echo "include /usr/share/nano/*.nanorc" >> /home/mrpowergamerbr/.nanorc

echo "Configurando git..."
sudo -u mrpowergamerbr git config --global user.email "git@mrpowergamerbr.com"
sudo -u mrpowergamerbr git config --global user.name "MrPowerGamerBR"

echo "Instalando yay..."

sudo -u mrpowergamerbr bash -c 'mkdir -p /home/mrpowergamerbr/; cd /home/mrpowergamerbr/; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; cd /'

echo "Instalando fontes..."
mkdir -p /usr/local/share/fonts/l/
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-Regular.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Regular.otf
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-Bold.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Bold.otf 
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-BoldItalic.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-BoldItalic.otf 
curl -L -o /usr/local/share/fonts/l/LexicaUltralegible-Italic.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Italic.otf
fc-cache -f -v

echo "Instalando tema do catppuccin para o Konsole..."
sudo -u mrpowergamerbr mkdir -p /home/mrpowergamerbr/.local/share/konsole/
sudo -u mrpowergamerbr curl -L -o /home/mrpowergamerbr/.local/share/konsole/catppuccin-mocha.colorscheme https://raw.githubusercontent.com/catppuccin/konsole/refs/heads/main/themes/catppuccin-mocha.colorscheme

echo "Prontinho :3 Divirta-se!"

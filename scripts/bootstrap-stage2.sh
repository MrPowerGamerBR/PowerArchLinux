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
systemctl enable NetworkManager.service
systemctl enable sddm.service
systemctl enable systemd-resolved.service
systemctl enable fstrim.timer
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinuxGRUBInsecure
nano /etc/default/grub # 1280x720 no DISPLAY e tirar quiet
grub-mkconfig -o /boot/grub/grub.cfg
sudo cat /boot/grub/grub.cfg | grep ucode # ver se está com o ucode ativado
exit

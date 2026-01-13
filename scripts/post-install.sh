echo "Configurando resolv.conf para usar o systemd-resolved..."
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo "Instalando Firefox Nightly..."
sudo curl -L -o /tmp/firefox.tar.xz "https://download.mozilla.org/?product=firefox-nightly-latest-l10n-ssl&os=linux64&lang=pt-BR"
sudo tar -xvf /tmp/firefox.tar.xz -C /opt
sudo mv /opt/firefox /opt/firefox-nightly
sudo rm -rf /tmp/firefox.tar.xz

mkdir -p $HOME/.local/share/applications/
cat > $HOME/.local/share/applications/firefox-nightly.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=Firefox Nightly
GenericName=Web Browser
Comment=Browse the World Wide Web with the latest features
Exec=/opt/firefox-nightly/firefox %u
Icon=/opt/firefox-nightly/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
Categories=Network;WebBrowser;
StartupWMClass=firefox-nightly
EOF

echo "Instalando o IntelliJ IDEA Ultimate..."
sudo curl -L -o /tmp/idea.tar.gz "https://download.jetbrains.com/product?code=IIU&latest&distribution=linux"
sudo tar -xvf /tmp/idea.tar.gz -C /opt
sudo rm -rf /tmp/idea.tar.gz

echo "Instalando packages adicionais..."

# libunity: Sistema de badge de notificações que o Discord usa
# kdotool-git: Ferramenta para interagir com o KDE Plasma pelo terminal (é usado o -git pois o kdotool normal não está funcionando devido a mudanças no Rust)
# epson-inkjet-printer-202101w: Driver de impressora EPSON L3210
# bin2iso: Converte BIN para ISO
# minecraft-launcher: Launcher do Minecraft
yay -Syu libunity kdotool-git epson-inkjet-printer-202101w minecraft-launcher

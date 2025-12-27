echo "Configurando resolv.conf para usar o systemd-resolved..."
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo "Instalando Firefox Nightly..."
sudo curl -L -o /tmp/firefox.tar.xz https://download.mozilla.org/?product=firefox-nightly-latest-l10n-ssl&os=linux64&lang=pt-BR
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
sudo curl -L -o /tmp/idea.tar.gz https://download.jetbrains.com/idea/idea-2025.3.1.tar.gz
sudo tar -xvf /tmp/idea.tar.gz -C /opt
sudo rm -rf /tmp/idea.tar.gz

echo "Instalando packages adicionais..."
# DESCRIÇÕES DAS PACKAGES
# Steam: steam xd
# wl-clipboard: Ferramenta para interagir com o clipboard pelo terminal
sudo pacman -Syu steam

# libunity: Sistema de badge de notificações que o Discord usa
# kdotool-git: Ferramenta para interagir com o KDE Plasma pelo terminal (é usado o -git pois o kdotool normal não está funcionando devido a mudanças no Rust)
# visual-studio-code-bin: Visual Studio Code
yay -Syu libunity kdotool-git visual-studio-code-bin

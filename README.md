<h1 align="center">🐧 PowerArchLinux 🐧</h1>

Um guia de como instalar o Arch Linux da maneira que eu (MrPowerGamerBR) gosto, feito exclusivamente para o MrPowerGamerBR usar quando instalar o Arch Linux.

Eu não considero uma instalação do Arch Linux a "definitiva". Toda hora eu penso "eu vou tentar fazer coisas novas no meu sistema e não me importo se ele quebrar" para assim eu acabar aprendendo novas coisas com o que você fez, para depois reinstalar (agora com as novas coisas que você aprendeu) e pensar "desta vez é para valer!" para, no final, reinstalar tudo de novo depois. A realidade é que a instalação "definitiva" irá chegar com o tempo.

Eu deixo o meu guia público para outras pessoas verem e aprenderem coisas novas. Eu sempre gosto de procurar "what are your must have packages Arch Linux" no Google para ver o que as outras pessoas recomendam, e nada mais justo que postar o que *eu recomendo* para outras pessoas verem.

Você NÃO deve seguir este guia a risca se o seu nome não for "MrPowerGamerBR", já que ele foi moldado para o meu sistema e ele tem várias coisas que você não vai querer e nem vão funcionar no seu sistema. Se você quer instalar Arch Linux, você deve [instalar ele seguindo o guia](https://wiki.archlinux.org/title/Installation_guide). Entretanto, talvez o guia tenha algumas coisas novas que você não sabia. :3

## Por que usar Linux ao invés do Windows?

Eu uso Linux em servidores a 10+ anos, mas em desktops eu sempre gostei do Windows. Eu já usei Linux no desktop no passado (Xubuntu), mas apenas quando o meu sistema era *tão ruim* ao ponto de ser inviável de usar Windows... Para mim, Windows sempre foi "just works™". 

Mas o primeiro "rude awakening" foi quando a Microsoft começou a achar que era uma boa ideia começar a enfiar propagandas no Windows. Não, eu não quero OneDrive. Não, eu não quero usar o Copilot. Não, eu não quero conectar uma conta da Microsoft. Não, eu não quero comprar o pacote Office. Não, eu não quero instalar o TikTok. Eu só quero mexer no meu computador!

É possível filtrar essas propagandas do Windows se você mexer no registro do Windows e instalar o Windows na região "US (World)", mas na minha opinião essas coisas *não* deveriam existir no sistema operacional para começo de conversa.

Claro, tem o argumento que se você não paga pelo Windows você não deveria reclamar que ele tem essas propagandas forçadas. Mas o motivo de eu não pagar pelo Windows é *justamente* porque eu sei que, mesmo se eu pagar, o Windows irá continuar do mesmo jeito! E eu sei disso pois eu tenho um laptop que veio com o Windows 11 (ou seja, é uma licença oficial) e ele tem essas mesmas propagandas.

As propagandas são apenas os ossos do ofício, você engole elas pois não tem alternativas... Mas quando o Windows começou a ter problemas que [afetam funções simples do sistema, como trocar pastas](https://x.com/MrPowerGamerBR/status/1947693425060417972), foi o momento que eu fiquei frustrado o suficiente para querer migrar para Linux.

Mas infelizmente a realidade é que **largar o Windows 100% ainda é inviável**, mas você não precisa largar o Windows 100%, você pode fazer dual boot para os jogos que só rodam no Windows (VALORANT) ou usar outro computador/laptop e acessar ele remotamente para usar os apps que só rodam no Windows.

* [How I Broke up with Adobe](https://youtu.be/lm51xZHZI6g) (este foi o vídeo que colocou a semente na minha cabeça de "e se eu realmente usar Linux no desktop")
* [I installed Linux (so should you)](https://youtu.be/pVI_smLgTY0)
* [the windows taskbar is a UX nightmare...](https://youtu.be/wA_jroxKpao)

E eu não sei se é apenas placebo, mas para mim Linux roda MUITO mais "snappy" do que o Windows.

## Por que usar Arch Linux ao invés de *insira distro aqui*?

Uma vantagem para mim é que o Arch Linux é bleeding edge, ou seja, ele é uma das distros mais atualizadas que você pode ter. Isso é vantajoso para hardwares que também são bleeding edge, como, por exemplo, placas de vídeo da Nvidia.

Claro, um dos problemas do Arch é que as vezes é *chato* você ter que descobrir como fazer a coisa xyzabc funcionar, e ter que ficar lendo qual package usar e ter paralisia de escolha tentando entender quais são as vantagens e desvantagens de cada uma. Mas ao mesmo tempo isso é uma vantagem, pois você sabe as vantagens e desvantagens de tudo que você está instalando!

Arch é meio chato de instalar, já que você tem que usar o terminal para instalar o sistema operacional, mas depois de instalado ele funciona igual a qualquer outra distro. Como eu já uso Linux em servidores e pelo WSL há anos, eu não tenho uma aversão ao terminal. Na realidade, eu amo o terminal e amo ele *noms the terminal*. (mas ao mesmo tempo eu gosto de uma GUI, pois uma GUI ajuda a descobrir coisas que você *não* conhece)

Outra *grande* vantagem do Arch Linux é o AUR (Arch User Repository), onde lá tem várias packages feitas por usuário que você pode instalar. Se algo não existe nos repositórios oficiais, ela provavelmente vai existir no AUR.

Sinceramente, no final Linux é tudo igual, o que muda é apenas o sistema de packaging. Você não é menos "usuário de Linux" só porque você usa Linux Mint ou Ubuntu, e você não é mais "usuário de Linux" só porque você fez a sua própria distro pelo Linux from Scratch. Essa é a beleza do Linux, você pode usar as coisas do jeito que *você* quiser.

E vamos ser sinceros, se o PewDiePie usa Arch Linux, você também consegue.

## Por que usar KDE Plasma ao invés de *insira DE aqui*?

Eu gosto do KDE Plasma pois ele é o Desktop Environment mais parecido com o jeito que o Windows funciona. Eu uso o Windows desde o [Windows 98 SE](https://youtu.be/QQFjrS_Oxq4) e eu sempre gostei do jeito que o Windows funciona. O problema do Windows não é o desktop environment, o problema é o jeito que o Windows 11 está decaíndo sem ter uma luz no fim do túnel.

Enquanto muitas pessoas (ThePrimeagen, DHH, etc) espalham a palavra dos tiling managers (Hyprland) e como eles são muito úteis para otimizar o seu trabalho, mas na minha experiência eu acabo preferindo muito mais um stacking window manager do que o tiling window manager. Mas isso varia de pessoa para pessoa! Novamente, essa é uma das belezas do Linux, você pode usar o seu desktop da maneira que *você* quiser.

Para mim, a parte legal de tiling managers é a parte de "fast switch" de aplicativos, de você ter vários "desktops" e poder ficar alternando entre eles rapidamente. Se você é como eu e é isso que te intriga em tiling managers, você pode fazer a mesma coisa no KDE Plasma usando o [kdotool](https://github.com/jinliu/kdotool) ou até mesmo um [script do KWin](https://www.reddit.com/r/kde/comments/1jr0dn4/maximizing_a_window_via_kwin_script/mpw5src/) para automaticamente maximizar e colocar em foco o app que você deseja ao usar um atalho.

Outra vantagem do KDE Plasma é que ele é *muito* customizável. Ele tem muitas opções de personalização para deixar o seu desktop da maneira que você quiser.

## Por que você escreveu as suas motivações e as suas escolhas, se o guia é para você mesmo?

Não sei.

![https://c.tenor.com/yDZryWCEP-cAAAAd/tenor.gif](https://c.tenor.com/yDZryWCEP-cAAAAd/tenor.gif)

## Instalação do Arch Linux

### Script Simples Fácil e Indolor APENAS PARA O MRPOWERGAMERBR!!

```bash
curl -s https://deeparch.mrpowergamerbr.com/ | bash -s
```

### Após Reiniciar

* Colocar para dar migalhas de estatísticas/tracking para o KDE Plasma para ajudarem eles com o desenvolvimento <3
* Monitor -> Escala 150%
* Teclado -> Layout # nome do layout: Português (Brasil)
* Desativar suspender na seção de energia das configurações (pois crasha o KWin - talvez isso arrumaria? https://www.reddit.com/r/kde/comments/1i4w7q9/kde_plasma_crashes_after_wake_from_sleep_state/)
* Bloqueio de Tela -> Nunca
* Trocar cursor do KDE para o Breeze Light, tamanho do cursor do KDE para 30 ao invés de 24
* Dolphin -> Mostrar arquivos ocultos
* Dolphin -> Configurar Dolphin -> Interface -> Manter uma janela única do Dolphin
* Dolphin -> Configurar Dolphin -> Mostrar ao Iniciar -> `/home/mrpowergamerbr`
* Dolphin -> Configurar Dolphin -> Interface -> Mostrar o caminho completo na barra de título
* Dolphin -> Configurar Dolphin -> Interface -> Barras de Localização e Status -> Mostrar o caminho completo na barra de localização
* Dolphin -> Configurar Dolphin -> Exibir -> Abrir Arquivos Compactados como Pasta 
* Animações -> Velocidade praticamente insantânea, desativar animações
* Bordas da Tela -> Desativar peek (top esquerdo) e desativar barreira de borda
* KRunner -> Colocar para centralizar, colocar para que pesquisa de janelas tenha prioridade
* Painel -> Desativar que possa silenciar aplicações clicando no ícone
* Painel -> Rolar em uma tarefa -> Não faz nada
* Painel -> Clicar em tarefas agrupadas -> Exibir lista textual
* Painel -> Desativar "Exibir visualizações em janelas pequenas quando passar o mouse sobre as tarefas"
* Mouse -> velocidade -0.96, velocidade de rolagem um pouco acima do normal
* Sessão da Área de Trabalho -> Iniciar com uma sessão vazia
* Tela de Autenticação -> Comportamento -> Configurar login automático
* Atalhos -> Spectacle -> Iniciar -> CTRL + Print Screen
* Atalhos -> Spectacle -> Capturar o Monitor Atual -> Print Screen 
* Spectacle -> Desativar "Incluir sombras da janela"
* Spectacle -> Configurar Spectacle... -> "Salvar arquivo para a pasta padrão"
* Ativar o KWin de minimizar tudo no "Scripts do KWin", configurar para Win + D no app de "Atalhos"
    * Para mim isso é mais natural que a tecla padrão de "espiar desktop", pois o "espiar desktop" não faz as janelas maximizarem novamente ao clicar em qualquer uma delas
* Cores -> Cor de destaque personalizada -> #29a6fe
* Notificações do Sistema -> Ativar som do "Início de Sessão" pois hmm eu amo sound effects quando inicia uma sessão
* 
No KWalletManager, criar uma wallet (ou trocar a senha da wallet que já existe) com uma senha vazia, para não ficar pedindo o login do user quando abrir o Discord

Instalar Firefox Nightly em `/opt/firefox-nightly`

`nano /home/mrpowergamerbr/.local/share/applications/firefox-nightly.desktop`

```
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
```

Configurar Firefox Nightly para ser o browser padrão nas configs do KDE (a opção de browser padrão que o Nightly oferece não funciona)

No Firefox `about:config`, ative (ativar = colocar `1` ao invés de `2`) para usar o XDG Desktop Portals (para usar o file picker do QT que é bem melhor que o do GTK):

* widget.use-xdg-desktop-portal.file-picker – Whether to use XDG portal for the file picker
* widget.use-xdg-desktop-portal.mime-handler – Whether to use XDG portal for the mime handler
* widget.use-xdg-desktop-portal.settings – Whether to try to use XDG portal for settings/look-and-feel information
* widget.use-xdg-desktop-portal.location – Whether to use XDG portal for geolocation
* widget.use-xdg-desktop-portal.open-uri – Whether to use XDG portal for opening to a file

Outras configurações do Firefox:
* middlemouse.paste -> false - Desativa middle click to paste no Firefox
* browser.tabs.hoverPreview.enabled -> false - Retira o preview de tabs do Firefox (toda hora eu sem querer clico na preview ao invés de clicar na página)
* browser.tabs.groups.hoverPreview.enabled -> false - Mesma coisa de cima, mas para group tabs
* media.hardwaremediakeys.enabled -> false - Com a extensão do Plasma Integration instalado no Firefox, é melhor deixar desativado para não dar conflito com as media keys (https://community.kde.org/Distributions/Packaging_Recommendations)
* widget.gtk.rounded-bottom-corners.enabled -> true - Deixa as bordas de baixo arredondadas, para ficarem semelhantes ao tema padrão do KDE Plasma (https://community.kde.org/Distributions/Packaging_Recommendations)
  
Trocar tudo para `1` ao invés de `2` (mais informações: https://wiki.archlinux.org/title/Firefox#XDG_Desktop_Portal_integration)

Nas configurações do Firefox, ativar a "Rolagem Automática" (ativa o sistema de rolar com o botão do meio do mouse, igual como é no Windows)

### Terminal

Eu uso o `fish` para deixar o terminal bonitinho, usando o meu arquivo `fish.config`

Para isso, basta copiar o arquivo para `~/.config/fish/config.fish`

Ativar syntax highlighting no nano

`echo "include /usr/share/nano/*.nanorc" >> ~/.nanorc`

```bash
pacman -Syu steam

cd $HOME && sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si # instalar yay
yay -Syu epson-inkjet-printer-202101w kdotool

sudo tailscale up # para conectar na rede do tailscale
```

**Explicação das Packages:**
* `epson-inkjet-printer-202101w`: Driver da Impressora EPSON L3210
* `kdotool`: Ferramenta para poder interagir com janelas do KWin pelo terminal, similar ao `xdotool`.

Instalar a fonte <https://github.com/jacobxperez/lexica-ultralegible> e ativar ela no sistema, pois [Fontes OTF renderizam de forma mais "crispy"/melhor em apps Qt](https://www.reddit.com/r/linux/comments/1b1jasr/exploring_font_rendering_a_comparative_journey/ksfoq86/).

```
sudo mkdir -p /usr/local/share/fonts/l/
sudo wget -O /usr/local/share/fonts/l/LexicaUltralegible-Regular.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Regular.otf
sudo wget -O /usr/local/share/fonts/l/LexicaUltralegible-Bold.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Bold.otf 
sudo wget -O /usr/local/share/fonts/l/LexicaUltralegible-BoldItalic.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-BoldItalic.otf 
sudo wget -O /usr/local/share/fonts/l/LexicaUltralegible-Italic.otf https://raw.githubusercontent.com/jacobxperez/lexica-ultralegible/refs/heads/main/fonts/otf/LexicaUltralegible-Italic.otf
sudo fc-cache -f -v
```

Alterar fontes do sistema para Lexica Ultralegible e JetBrains Mono

Konsole:
* Desativar "Memorizar tamanho da janela"
* Ativar "Usar a mesma instância do Konsole para todos"

catpputin mocha tema para o konsole (pasta de temas: `~/.local/share/konsole`)
```
wget -O ~/.local/share/konsole/catppuccin-mocha.colorscheme https://raw.githubusercontent.com/catppuccin/konsole/refs/heads/main/themes/catppuccin-mocha.colorscheme
```

* Auto inicializar -> Steam, Discord Canary
* painel = flutuante (somente miniaplicativos, observação: talvez tenha que usar o Force Floating no panel colorizer)

reiniciar

* definir wallpaper (bliss)
* definir nome da conta (MrPowerGamerBR)
* definir ícone de conta (katy_snap)

Se uma partição NTFS não montar falando que o "arquivo não existe", é bom usar `sudo ntfsfix /dev/sdb2` (sendo `dev/sdb2` a partição)
Para o git guardar as credencials, use `git config --global core.askPass /usr/bin/ksshaskpass`, assim as credenciais serão guardadas na wallet do KDE

Para a senha, crie um Personal access token no GitHub

Para configurar a impressora, é melhor usar a ferramenta de configuração do KDE Plasma (Impressoras)

Atalhos que o Wine cria ficam no `/home/mrpowergamerbr/.local/share/applications/`

Instalar o [PowerBreeze](https://github.com/MrPowerGamerBR/PowerBreeze/):

```
cd $HOME/.local/share/plasma/desktoptheme/ && git clone https://github.com/MrPowerGamerBR/PowerBreeze/
```

E depois altere para o PowerBreeze no tema do Plasma.

```bash
git config --global user.email "git@mrpowergamerbr.com"
git config --global user.name "MrPowerGamerBR"
```

## Regras das Janelas

Eu gosto do jeito que o Picture-in-Picture do Firefox funciona no Windows, onde o Picture-in-Picture sempre fica no topo de qualquer janela e sempre fica presente na tela mesmo ao usar `Windows + D`.

Infelizmente o Firefox não tem esse mesmo behavior no KDE Plasma, mas felizmente é possível corrigir isso usando as "Regras das Janelas" do KDE! E o melhor de tudo é que, diferente do Windows, você pode configurar esse behavior para qualquer janela que você quiser.

![media/window_rules_firefox.png](media/window_rules_firefox.png)

Outra regra de janela que eu gosto de configurar é fazer que remova a title bar do Discord, assim ficando mais natural já que o Discord meio que tem a própria title bar.

![media/window_rules_discord.png](media/window_rules_discord.png)

Claro, se você remover a title bar você não conseguirá mover o Discord já que a title bar do Discord não é "movível". Eu não preciso ficar movendo a janela do Discord, mas se por ventura você precisar, você pode temporariamente reativar ela clicando com botão direito no Discord na Taskbar -> Mais -> Desativar "Sem barra de título e moldura"

## Badge de Notificações Unread no Discord Canary

O problema é que o Discord hardcodeou o `discord.desktop` no código-fonte dele, então ele espera que o nome do app seja `discord.desktop` para as notificações funcionarem.

```bash
pacman -Syu libunity
cp /usr/share/applications/discord-canary.desktop ~/.local/share/applications/discord.desktop && update-desktop-database ~/.local/share/applications/
```

E depois é necessário iniciar o Discord Canary pela sua versão. Um problema deste workaround é que toda hora que você atualizar o Discord Canary você tem que usar `update-desktop-database ~/.local/share/applications/`.

## Electron Wayland

`~/.config/electron-flags.conf`

```
--enable-features=WaylandWindowDecorations
--ozone-platform-hint=auto
```

Nem todos os apps usam estas flags, entretanto elas são úteis para os apps Electron que respeitam essas flags.

Isso também arruma uma coisa chata no Visual Studio Code onde ele fica rolando o conteúdo do arquivo aberto se o cursor está perto do topo/fundo da tela.

## IntelliJ IDEA Wayland

Para o IntelliJ IDEA, adicione o `-Dawt.toolkit.name=WLToolkit` nas configurações da VM do IDEA

## Compilação de Coisas

Se você quiser compilar coisas que não sejam Java/Kotlin/etc, instale o `cmake extra-cmake-modules`

## Secure Boot

Eu não sei vocês, mas eu não ligo para as vantagens do secure boot. Nenhum software precisa dessa bomba no Linux e, sinceramente, se um vírus conseguiu instalar um rootkit na partição EFI, significa que eu tenho problemas maiores para resolver.

Para mim, eu só quero suporte ao Secure Boot para eu poder fazer dual boot com o Windows, para poder rodar o [Vanguard](https://img.ifunny.co/images/35de2f8761bcb06de982e5669af60c35cb63e241f775c400f4b03a5ffac6c10d_1.jpg) nele sem precisar ficar fazendo um malabarismo de

* Vai na BIOS
* Altera o Secure Boot para "Windows UEFI Mode"
* Reinicia
* Vai na BIOS de novo
* Escolhe o Windows

O jeito certo de fazer o secure boot no Linux seria assinando o bootloader e o kernel, assim você tem a segurança que o Secure Boot te proporciona. Mas se você quer o Secure Boot apenas para deixar o ~~Windows~~ Vanguard feliz, tem uma solução mais fácil!

![https://img.ifunny.co/images/35de2f8761bcb06de982e5669af60c35cb63e241f775c400f4b03a5ffac6c10d_1.jpg](https://img.ifunny.co/images/35de2f8761bcb06de982e5669af60c35cb63e241f775c400f4b03a5ffac6c10d_1.jpg)

É possível você configurar o `shim-signed` para pular a validação de assinatura.

```bash
sudo pacman -Syu mokutil
yay -Syu shim-signed
```

**PARECE QUE O GRUB TEM ALGUM BUG QUE FAZ ISTO NÃO FUNCIONAR, É MELHOR USAR O SYSTEMD-BOOT:** https://www.reddit.com/r/archlinux/comments/1pvw6td/grub_shimsigned_mokutil_disablevalidation_not/nw1tgk5/

Primeiro instale o grub normalmente, é necessário instalar com os modules desta forma para ter suporte ao SBAT (Secure Boot Advanced Targeting), que o shim precisa para bootar.

```bash
sudo grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinuxGRUB --modules="tpm" --sbat /usr/share/grub/sbat.csv --no-nvram
```

(O `--no-nvram` instala o GRUB sem criar uma entrada no EFI)

Copie o shim signed para o grub do Arch Linux
```bash
sudo cp /usr/share/shim-signed/shimx64.efi /efi/EFI/ArchLinuxGRUB/bootx64.efi
sudo cp /usr/share/shim-signed/mmx64.efi /efi/EFI/ArchLinuxGRUB/
```

Desative a validação do SecureBoot
```bash
sudo mokutil --disable-validation
```

A senha pode ser qualquer coisa, mas é melhor colocar só vários `a` pois o MOK Manager vai pedir a senha, e ele pede caracteres aleatórios da senha ao invés de pedir a senha por completo.

E, finalmente, crie um uma entrada no EFI
```bash
sudo efibootmgr --create --disk /dev/nvme0n1 --part 1 --label "ArchLinuxGRUB" --loader '\EFI\ARCHLINUXGRUB\BOOTX64.efi'
```

Isso irá criar uma entrada que irá bootar o `bootx64.efi`, que é o shim da Microsoft.

No primeiro boot, ele irá iniciar o MOK Manager, lá é necessário ir na opção para desativar o secure boot.

Se a opção não aparecer no menu EFI, significa que o arquivo não existe!

Ao iniciar, ele irá aparecer "Booting in insecure mode".

```
:) mrpowergamerbr@deeparch-whistler:~$ mokutil --sb-state
SecureBoot enabled
SecureBoot validation is disabled in shim
```

Para reverter a verificação do `shim-signed`, você pode usar 

```bash
sudo mokutil --enable-validation
```

## Partiação ESP muito pequena

Por padrão, o Windows cria uma partição ESP de apenas 100MB, o que é MUITO pequeno.

A solução que eu fiz foi criar outra partição ESP (de 1GB) no mesmo disco apenas para o Linux. Tem gente que fala que tem BIOS que não gostam disso, mas eu consegui fazer sem nenhum problema. E a BIOS reconhece o bootloader do Windows (que está na primeira partição ESP) tanto o bootloader do Linux (que está nas segunda partição ESP)

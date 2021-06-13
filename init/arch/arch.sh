# ibus-setup

# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon --daemonize --xim
# sudo ln -s /home/anosillus/dotfiles/dots/skk/ /usr/share/skk

# yay -S dmenu

sudo pacman -Syu
sudo pacman-mirrors --geoip
sudo pacman -S yay
yay -Syu

sudo pamcan -S npm nodejs rust

yay -S fakeroot code autoconf
yay -S anyenv crfpp direnv genymotion gitkraken google-chrome gyazo ibus-qt mecab mecab-ipadic mecab-ipadic-neologd-git openrazer-daemon openrazer-driver-dkms openrazer-meta peco pepper-flash python-openrazer qt4 razercommander ripgrep-all vivaldi-update-ffmpeg-hook waffle xmind-2020 ytop-bin fish tmux tokei-bin fd procs exa bat ufw gufw clamav clamtk mpd wget
yay -S cabocha

sudo ufw default deny
sudo ufw enable

yay -S slack-electron easywine winetricks libreoffice ctags fzf haskell simplescreenrecorder maya fzy percol ghq dmenu2 rofi nm-applet
sudo pacman -S i3 i3-gaps feh morc_menu wmctrl

# browser
sudo pacman -S firefox vivaldi alacritty
yay -S google-chrome
# JP and fonts
yay -S noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts otf-ipafont otf-ipaexfont ttf-dejavu ipa-fonts ipa-gothic-fonts
yay -S ttf-fantasque-sans-mono nerd-fonts-iosevka
yay -S ttf-cica ttf-monapo

yay -S ibus ibus-qt ibus-skk
sudo sed -i 's/ja/en/g' /usr/share/ibus/component/skk.xml

git clone https://github.com/wachikun/yaskkserv2.git
cd yaskkserv2
cargo build --release
sudo cp -av target/release/yaskkserv2 /usr/local/sbin/
sudo cp -av target/release/yaskkserv2_make_dictionary /usr/local/sbin/
cd ..
rm yaskkserv2

# polybar settings
bash -c "bash <(curl -sL https://git.io/Jv0e4)"

sudo echo '[Desktop Entry]
Type=XSession
Exec=env KDEWM=/usr/bin/i3 /usr/bin/startplasma-x11
DesktopNames=KDE
Name=Plasma with i3
Comment=Plasma with i3
' >/usr/share/xsessions/plasma-i3.desktop

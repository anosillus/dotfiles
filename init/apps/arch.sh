sudo pacman -Syu
sudo pacman-mirrors --geoip
sudo pacman -S yay
yay -Syu
sudo pacman -S base base-devel linux linux-firmware gvim git wget fish tmux
# browser
sudo pacman -S firefox vivaldi alacritty
yay -S google-chrome
# JP and fonts
yay -S ibus ibus-qt ibus-skk
sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts otf-ipafont otf-ipaexfont ttf-dejavu
yay -S ttf-cica
# security
sudo pacman -S ufw gufw
sudo pacman -S clamav clamtk mpd rofi direnv anyenv

sudo ufw default deny
sudo ufw enable

ibus-setup

sudo pamcan -S npm nodejs rust
git clone https://github.com/wachikun/yaskkserv2.git
cd yaskkserv2
cargo build --release
cd ..
rm yaskkserv2

# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon --daemonize --xim
# sudo ln -s /home/anosillus/dotfiles/dots/skk/ /usr/share/skk

sudo pacman -S i3 i3-gaps feh morc_menu wmctrl
yay -S dmenu

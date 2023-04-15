sudo pacman -Syuu --noconfirm
sudo pacman -S  --noconfirm  archlinux-keyring fakeroot autoconf pkg-config base-devel rssh openssh

# geoip
sudo pacman -S --noconfirm  reflector
sudo reflector --country 'Japan' --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# setup rust
sudo pacman -S --noconfirm rustup lldb gdb
rustup default stable

# paru
# sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# language tools
paru -S --noconfirm npm nodejs wget

# browser

# browser
paru -S --noconfirm firefox vivaldi google-chrome vivaldi-ffmpeg-codecs vivaldi-update-ffmpeg-hook

# dev-tools
paru -S --noconfirm alacritty code direnv

# cui-tools
paru -S --noconfirm trash-cli ripgrep-all ytop-bin ghq tmux tokei-bin fd procs exa bat ufw gufw clamav clamtk mpd wget peco gvim ctags fzf

# extra-dev-tools
paru -S --noconfirm gitkraken gyazo xmind simplescreenrecorder slack winetricks libreoffice

# JP-tools
paru -S --noconfirm qt4-bin ibus ibus-qt ibus-skk
# sudo sed -i 's/<layout>ja</layout>/<layout>us</layout>/g' /usr/share/ibus/component/skk.xml

git clone https://github.com/wachikun/yaskkserv2.git ~/
cd ~/yaskkserv2
cargo build --release
sudo cp -av target/release/yaskkserv2 /usr/local/sbin/
sudo cp -av target/release/yaskkserv2_make_dictionary /usr/local/sbin/
cd ..
rm -fr yaskkserv2
# sudo cp yaskkserv2.service /etc/systemd/system/
sudo systemctl enable yaskkserv2
sudo systemctl start  yaskkserv2

# docker
paru -S --noconfirm docker docker-compose
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

# hardware
paru -S --noconfirm openrazer-daemon openrazer-driver-dkms openrazer-meta

# compress-tools
paru -S --noconfirm tar gzip bzip2 unzip unrar p7zip

# environment-manger
yay -S anyenv crfpp direnv genymotion gitkraken gyazo ibus-qt mecab mecab-ipadic mecab-ipadic-neologd-git openrazer-daemon openrazer-driver-dkms openrazer-meta peco pepper-flash python-openrazer qt4 razercommander ripgrep-all waffle xmind-2020 ytop-bin fish tmux tokei-bin fd procs exa bat ufw gufw clamav clamtk mpd wget
yay -S cabocha

# Github settings
ssh-keygen -t ed25519 -C "anosillus@gmail.com"
pbcopy < ~/.ssh/id_rsa.pub

# Kindle
paru -S --noconfirm wine wine_gecko winetricks

# fonts
paru -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts otf-ipafont otf-ipaexfont ttf-dejavu ipa-fonts ttf-fantasque-sans-mono nerd-fonts-iosevka
paru -S --noconfirm ttf-cica-git

# i3
# polybar
# bash -c "bash <(curl -sL https://git.io/Jv0e4)"

anyenv install --init
anyenv install pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest

pyenv virtualenv-init -
pyenv install-latest

# npm
sudo npm install -g bash-language-server eslint eslint-plugin-import eslint-plugin-react htmlhint proselint prettier textlint write-good @textlint-ja/textlint-rule-no-insert-dropping-sa @textlint-rule/textlint-rule-preset-google dictionary-en textlint-filter-rule-comments textlint-rule-apostrophe textlint-rule-common-misspellings textlint-rule-date-weekday-mismatch textlint-rule-diacritics textlint-rule-en-capitalization textlint-rule-en-max-word-count textlint-rule-footnote-order textlint-rule-general-novel-style-ja textlint-rule-ginger
sudo npm install -g textlint-rule-ja-hiragana-fukushi

sudo npm install -g textlint-rule-ja-hiragana-hojodoushi textlint-rule-max-number-of-lines
sudo npm install -g textlint-rule-period-in-list-item textlint-rule-prefer-tari-tari textlint-rule-preset-ja-technical-writing textlint-rule-preset-jtf-style textlint-rule-spellcheck-tech-word
sudo npm install -g textlint-rule-spelling textlint-rule-stop-words textlint-rule-terminology textlint-rule-web-plus-db @textlint-ja/textlint-rule-no-synonyms sudachi-synonyms-dictionary textlint-rule-abbr-within-parentheses textlint-rule-ja-hiragana-keishikimeishi textlint-filter-rule-allowlist graphql-language-service-cli dockerfile-language-server-nodejs textlint-rule-preset-ja-spacing
sudo npm install -g jsonlint textlint-rule-no-zero-width-spaces

# pip
pyenv virtualenv 3.10.6 nvim-python
cd installs
pyenv local nvim-python
pip install -r requirements.yaml


# sysstat acpi lm_sensors playerctl slack-electron
# zoxide ghq ctags volumeicon
# clyrics cmus tldr unrar
# qbittorrent-enhanced-qt5

# kindle
# lib32-libpng lib32-libjpeg-turbo lib32-mpg123 lib32-libxml2
# lib32-giflib lib32-libpng lib32-libjpeg-turbo
# lib32-gnutls winetricks wine-mono wine-gecko

# gotop pingu bashtop ttf-font-awesome polybar-spotify-module

curl https://nim-lang.org/choosenim/init.sh -sSf | sh
# mpv xprop xdotool
# alsa-utils brightnessctl imagemagick scrot w3m wireless_tools xclip xsettingsd xss-lock
# dunst nitrogen openbox rofi rxvt-unicode-truecolor-wide-glyphs tint2 picom obmenu-generator perl-gtk3

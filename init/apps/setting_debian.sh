# For Dual-Boot time zone bug fix
sudo timedatectl set-local-rtc true
sudo apt upgrade
 # jaist server
sudo sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo apt update
sudo apt-get install aptitude snap -y
sudo apt install -y adwaita-icon-theme # ruby required
sudo apt install -y libxslt1-dev libcurl4-openssl-dev libksba8 libksba-dev libreadline-dev apt-transport-https ca-certificates gnupg-agent build-essential libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libc6-dev libbz2-dev ufw software-properties-common libffi-dev libncurses-dev gettext libtool libtool-bin autoconf automake cmake g++
sudo snap install -y ccls --classic
sudo apt install -y xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev suckless-tools gmrun xmobar

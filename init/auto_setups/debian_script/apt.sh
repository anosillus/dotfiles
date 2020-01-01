sudo apt-get update -y
echo "apt settings"
# jaist server
sudo sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo timedatectl set-local-rtc true
sudo apt -y update -y
sudo apt -y upgrade
sudo apt-get -y install aptitude
echo "essential installing"
sudo apt-get -y install build-essential git libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev ufw gettext curl libappindicator1
sudo apt-get -y install software-properties-common gperf libffi-dev ncurses-dev gettext autoconf libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt-get -y install fonts-ipafont

# node setup
sudo apt-get install -y nodejs npm
sudo npm cache clean
sudo npm install n -g
sudo n stable
sudo apt-get purge -y nodejs npm

# editor setting
sudo apt-get -y install python3 python3-dev python3-pip
sudo apt-get -y install vim vim-gnome 
sudo apt-get update

sudo gem install google-ime-skk

# rust 
curl https://sh.rustup.rs -sSf | sh

sudo apt-get update
sudo apt-get install -y language-pack-ja
sudo apt-get install -y ibus-mozc ibus-skk skkdic ntp
sudo service ntp stop
sudo ntpdata npt.nict.jp
sudo apt-get install -y fonts-ipafont
sudo apt-get install -y vlc guake
# sudo update-locale LANG=ja_JP.UTF-8

echo "sudo vim /usr/share/ibus/component/mozc.xml"
# sudo vim /usr/share/ibus/component/mozc.xml

# For Dual-Boot time zone bug fix
sudo timedatectl set-local-rtc true



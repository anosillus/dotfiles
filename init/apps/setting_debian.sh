# For Dual-Boot time zone bug fix
sudo timedatectl set-local-rtc true
sudo apt -y upgrade
 # jaist server
sudo sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo apt -y update -y

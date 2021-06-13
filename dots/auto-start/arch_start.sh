export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
yaskkserv2 --config-filename ~/.skk/linux_yaskkserv2.conf
# sudo systemctl start docker

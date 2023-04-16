killall xcape # to prevent xcape daemon duplication
xmodmap -e 'keycode 255=space'
xmodmap -e 'keycode 65=Shift_L'
/usr/sbin/xcape -e '#65=space'
/usr/sbin/xcape -e 'Control_L=Escape'

xmodmap .Xmodmap

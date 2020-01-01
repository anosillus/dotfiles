sudo -i cat /etc/passwd | sed 's#username:x:1000:1000:"",,,:/home/username:/bin/bash#username:x:1000:1000:"",,,:/mnt/c/Users/isai/u_Home/:/bin/bash' > /etc/passed
mv ~/.* /mnt/c/Users/isai/u_Home/ 

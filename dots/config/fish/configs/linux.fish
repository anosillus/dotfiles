# echo Hi Free-OS!

set -Ux EDITOR gvim
set -Ux Browser chromium

set -x -U GOPATH $HOME/go
# set -U fish_user_paths  $fish_user_paths
set PATH $PATH /usr/local/bin /usr/sbin $GOPATH/bin $HOME/.local/bin $HOME/.cargo/env $HOME/.cargo/bin


# set -g -x CPPFLAGS "$CPPFLAGS -I /usr/local/opt/binutils/include"
# set -g -x LDFLAGS "$LDFLAGS -L /usr/local/opt/binutils/lib"

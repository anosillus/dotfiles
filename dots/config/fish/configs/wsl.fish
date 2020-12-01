set -Ux EDITOR gvim
set -Ux Browser chromium

# add coreutils gnubin if installed
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

set -x -U GOPATH $HOME/go
set -U fish_user_paths /usr/local/bin /usr/sbin $GOPATH/bin $HOME/.local/bin  $fish_user_paths
set -U fith_user_paths $HOME/.cargo/env $fish_user_paths

# set -g -x CPPFLAGS "$CPPFLAGS -I /usr/local/opt/binutils/include"
# set -g -x LDFLAGS "$LDFLAGS -L /usr/local/opt/binutils/lib"

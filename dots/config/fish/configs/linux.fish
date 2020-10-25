echo Hi Free-OS!

# set -x PATH $HOME/.rbenv/bin $PATH
# status --is-interactive; and source (rbenv init -|psub)

# add coreutils gnubin if installed
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

set -x -U GOPATH $HOME/go

set PATH /usr/local/bin /usr/sbin $GOPATH/bin $HOME/.local/bin  $PATH

set -U fith_user_path $HOME/.cargo/env $fish_user_paths
set -U fith_user_path $HOME/.rbenv/bin $fish_user_paths

# set -g -x CPPFLAGS "$CPPFLAGS -I /usr/local/opt/binutils/include"
# set -g -x LDFLAGS "$LDFLAGS -L /usr/local/opt/binutils/lib"
alias v='gvim'
alias vv='gvim --remote-tab-silent'

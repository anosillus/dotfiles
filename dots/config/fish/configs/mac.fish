
echo Hi Hexley!

set -g -x EDITOR  gvim
set -g -x VIM     vim
set -g -x NVIM    nvim

if [ -d /Applications/Postgres.app/Contents/Versions/latest/bin ]
        set -x PATH $PATH "/Applications/Postgres.app/Contents/Versions/latest/bin"
end

if [ -e '/Applications/Launchbar.app' ]
        alias launchbar "open -a launchbar"
end

set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# add coreutils gnubin if installed
set -l gnubin "/usr/local/opt/coreutils/libexec/gnubin"
set -l gnuman "/usr/local/opt/coreutils/libexec/gnuman"
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/Library/Python/3.7/bin $fish_user_paths
set -gx RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
set -U QT5PATH /usr/local/Cellar/qt/5.11.2_1

set -U fish_user_paths /usr/local/opt/gnu-getopt/bin $fish_user_paths
set -U fish_user_paths /usr/local/opt/binutils/bin $fish_user_paths
set -g -x CPPFLAGS "$CPPFLAGS -I /usr/local/opt/binutils/include"
set -g -x LDFLAGS "$LDFLAGS -L /usr/local/opt/binutils/lib"

if test -d $gnubin
        set -x PATH $gnubin $PATH
        set -x MANPATH $gnuman $MANPATH
end

# User bin folder
set -xg PATH $PATH /usr/bin
set -xg PATH /usr/local/bin $PATH
set -xg PATH /usr/local/sbin $PATH
set -xg PATH $HOME/.local/bin $PATH
set -xg PATH $HOME/go/bin $PATH
set -x -U GOPATH $HOME/go

alias reboot='systemctl reboot -i now'
alias deb='sudo dpkg -i'

alias vf='eval $EDITOR ~/.config/fish/config.fish'
alias vv='eval $EDITOR ~/dotfiles/rc/vim/.'
alias vs='eval $EDITOR ~/dotfiles/scripts/'

alias vi='eval $VIM'
alias v='gvim'
alias vv=nvr
alias n='eval $NVIM'

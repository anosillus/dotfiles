# set fish_greeting "Hello, world"

# set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"
# set -x -g TERM "xterm-256color"

# OS Detect {{{
switch (uname)
    case Linux
        # WSL {{{
        if uname -r | grep 'microsoft' > /dev/null
            set -g -x EDITOR  vim
            set -g -x MYVIM   vim
            set -g -x MYNVIM  nvim

            set -Ux BROWSER chromium
            # add coreutils gnubin if installed
            set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
            set -U fish_user_paths $HOME/.local/bin $fish_user_paths

            set -x -U GOPATH $HOME/go
            set -U fish_user_paths /usr/local/bin /usr/sbin $GOPATH/bin $HOME/.local/bin  $fish_user_paths
            set -U fith_user_paths $HOME/.cargo/env $fish_user_paths
        # }}}
        else
        # Linux Common {{{
            set -g -x EDITOR  gvim
            set -g -x MYVIM   vim
            set -g -x MYNVIM  goneovim
            set PATH $PATH $HOME/.config/rofi/bin
            # set PATH $PATH $HOME/.serverless/bin/serverless
            set -g -x BROWSER chromium
            set -x -U GOPATH $HOME/go
            # set -U fish_user_paths  $fish_user_paths
            switch (lsb_release -is)
        # }}}
                # Arch {{{
                case ManjaroLinux
                    # set PATH $PATH /usr/local/bin /usr/sbin $GOPATH/bin $HOME/.local/bin $HOME/.cargo/env $HOME/.cargo/bin
                    abbr -a ai sudo pacman -S
                    abbr -a aud sudo pacman -Syy
                    abbr -a aug sudo pacman -Syyu
                    set PATH $PATH $HOME/.config/rofi/bin
                    set -xg JAVA_HOME "/usr/lib/jvm/java-11-adoptopenjdk"
                    abbr va $EDITOR $HOME/.config/rofi/bin
                    # export GTK_IM_MODULE=ibus
                    # export XMODFIERS=@im=ibus
                    # export AT_IM_MODULE=ibus
                    # }}}
                # Ubuntu {{{
                case Ubuntu
                    set PATH $PATH /usr/local/bin /usr/sbin $GOPATH/bin $HOME/.local/bin $HOME/.cargo/env $HOME/.cargo/bin
                    abbr -a ai sudo apt-get install -y
                    abbr -a aud sudo apt-get update -y
                    abbr -a aug sudo apt-get upgrade -y
            end
        end
    # }}}
    # Mac {{{
    case Darwin
        set -g -x EDITOR  gvim
        set -g -x MYVIM   vim
        set -g -x MYNVIM  nvim

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

      # oh-my-fish/plugin-brew case FreeBSD NetBSD DragonFly
    # Mac }}}
    case '*'
        echo Who are you?
end
# OS Detect }}}

# Alias {{{
abbr v  $EDITOR
abbr vi $MYVIM
abbr n  $MYNVIM
abbr -a V $EDITOR --remote-tab-silent
abbr -a vv $EDITOR ~/.vim/rc/dein.toml
abbr -a vF $EDITOR ~/.config/fish/config.fish
# abbr -a vF vf
abbr -a vv $EDITOR ~/dotfiles/rc/vim/.
abbr -a vs $EDITOR ~/dotfiles/init/

abbr p python3
abbr s scala
abbr py python3
abbr python python3
abbr python2 python2
abbr ipython ipython3
abbr p2 python2
abbr -a ppi pip3 install
abbr -a ppr pip3 remove
abbr -a ppip pip3
abbr -a ppu pip3 install --upgrade
abbr -a ppi2 pip2 install
abbr -a ppu2 pip2 install --upgrade
abbr -a pgi gem install
abbr -a pni npm install
abbr -a png npm install -g
abbr -a phtml google-chrome
abbr -a skk yaskkserv2 --config-filename ~/.skk/linux_yaskkserv2.conf
abbr -a pydlm youtube-dl -f best -x --audio-format mp3  -o "~/Music/%(title)s.%(ext)s"
abbr tm tmux
abbr -a tk tmux kill-server
abbr -a kill tmux kill-server
abbr -a dk docker kill (docker ps -q)
abbr -a dkill docker kill (docker ps -q)
abbr -a rmi docker rmi (docker images -q)
abbr -a rmc docker rm (docker ps -a -q)

alias ps='procs'
alias psr='procs |rg '
abbr ct cat
alias cat='bat'
alias catr='bat | rg '
abbr fd find
alias find='fd'
alias top='ytop'
abbr tp ytop
alias wc='tokei'

abbr cd.. cd ..
abbr .. cd ..
abbr ... cd ../..
abbr .... cd ../../..
abbr ..... cd ../../../..

abbr -a pmd mkdir -p
abbr -a pcx chmod +x
abbr -a c-x chmod -x

abbr dsnote docker run -i -t -p 8888:8888 -v (pwd):/opt/playground continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/playground --ip='*' --allow-root --NotebookApp.token='' --NotebookApp.password='' --port=8888 --no-browser"
abbr rocker docker run -d -p 8787:8787 -v (pwd):/home/rstudio rocker/rstudio
abbr ssh-keygen -t rsa -b 4096 -C "anosillus@gmail.com"

alias shodo='eval $BROWSER -app="https://app.shodo.ink/"'
alias gmail='eval $BROWSER -app="https://mail.google.com/mail/u/0/#inbox"'
alias gmail='eval $BROWSER -app="https://mail.google.com/mail/u/0/#inbox"'
alias gcp='eval $BROWSER -app="https://console.cloud.google.com/"'
alias domain='eval $BROWSER -app="https://njal.la/domains/"'

alias c='clear'

alias tar='tar -xvzf'
alias 7z='7z x'
alias xz='tar Jxfv'
alias rar='unrar e -r'

abbr -a W eval $EDITOR ~/Work
abbr -a vW eval $EDITOR ~/Work
abbr -a D eval $EDITOR ~/dev

abbr -a pandoc pandoc --from=markdown --to=latex

# Git {{{
abbr -a gd vim +Gapply
abbr -a gs git status
abbr -a gl git clone
abbr -a ga git add
abbr -a g. git add .
abbr -a gc git commit -m

abbr -a gp git push
#}}}

abbr fault 'sudo shutdown -P now'

if not functions -q exa;
    alias l='exa --icons --all --sort name --extended'
    alias lf='exa --icons --all --sort extension --extended'

    alias la='exa --icons --sort name --blocks --extended'

    # alias la='exa --group-directories-first --icons --long --all --sort Name --no-user --no-permissions --no-time --no-filesize'
    alias ls='exa --icons --all --blocks --extended'
    alias lr='exa --icons --all --extended --sort extension |rg '

    alias las='exa --group-directories-first --icons --long --all --sort size'
    alias lsa='exa --group-directories-first --icons --long --all --sort size'

    # alias ls='exa --group-directories-first --icons --long --sort Size'
    alias ll='exa --all --long --sort name --icons'
    alias lla='exa --long --sort name --icons'

    # alias lla='exa --icons --all --sort name --blocks --extended'
    alias g='exa --long --all --git-ignore --group-directories-first --sort modified --changed  --reverse --icons --git --no-user --no-permissions'

    # abbr ll 'ls -l --git'        # Long format, git status
    # abbr l  'll -a'              # Long format, all files
    # abbr lr 'll -T'              # Long format, recursive as a tree
    # abbr lx 'll -sextension'     # Long format, sort by extension
    # abbr lk 'll -ssize'          # Long format, largest file size last
    # abbr lt 'll -smodified'      # Long format, newest modification time last
    # abbr lc 'll -schanged'       # Long format, newest status change (ctime) last
    alias ld='exa --only-dirs --blocks'       # Long format, newest status change (ctime) last
    alias l2='exa --tree --level=2'       # Long format, newest status change (ctime) last
    alias l3='exa --tree --level=3'       # Long format, newest status change (ctime) last
    alias lt='exa --tree'
end


# alias ap='sudo apt install -y'
# alias au='sudo apt remove -y'
# alias ad='sudo apt update'
# alias q='nvim-qt'

#alias jn='jupyter-notebook'
#alias pip='pip3'
#alias pip2='pip2'

# alias l ls\ -AFG
# alias ll ls\ -AFGl
# }}}

# fundle {{{
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'edc/bass'
fundle plugin 'danhper/fish-fastdir'
fundle plugin 'lowne/fish-prompt-metro'
fundle plugin 'oh-my-fish/plugin-peco'
fundle plugin 'demartini/plugin-docker-compose'
fundle plugin 'Gazorby/fish-git-emojis'
fundle plugin 'eth-p/fish-plugin-sudo'
fundle plugin 'decors/fish-ghq'
fundle plugin 'jethrokuan/z'
fundle plugin 'patrickf1/colored_man_pages.fish'
# fundle plugin 'gazorby/fish-exa'
fundle plugin 'oh-my-fish/theme-bobthefish'
# fundle plugin 'jorgebucaran/powerline.fish'
fundle plugin 'ryoppippi/fish-poetry'
# fundle plugin 'gazorby/fish-exa'
fundle init
# }}}

if not test -d ~/.anyenv
    git clone https://github.com/riywo/anyenv ~/.anyenv
    mkdir -p ~/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
    exec $SHELL -l
    anyenv init - fish | source
    anyenv install pyenv
    anyenv install nodenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git (pyenv root)/plugins/pyenv-virtualenv
else
    # set -x PATH $HOME/.anyenv/bin $PATH
    set PATH $PATH $HOME/.anyenv/bin
    anyenv init - fish | source
    # status --is-interactive; and source (anyenv init -|psub)
    # anyenv init
    eval (direnv hook fish)
end


if functions -q aws-cli
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end

# set fish_plugins theme peco
# set -U async_prompt_inherit_variables all
# set -U async_prompt_functions fish_right_prompt

# set -xg JAVA_HOME "/usr/lib/jvm/default/bin"

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

# Prompt Settings {{{
set VIRTUAL_ENV_DISABLE_PROMPT disable
set VIRTUAL_ENV

set -g theme_display_git yes
# set -g theme_display_git_dirty yes
# set -g theme_display_git_untracked no
# set -g theme_display_git_ahead_verbose yes
# set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
# set -g theme_display_git_default_branch yes
# set -g theme_git_default_branches master main
# set -g theme_git_worktree_support yes
# set -g theme_use_abbreviated_branch_name yes
# set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
# set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv yes
# set -g theme_display_nix yes
# set -g theme_display_ruby yes
# set -g theme_display_python yes
# set -g theme_display_nvm yes
# set -g theme_display_user ssh
# set -g theme_display_hostname ssh
# set -g theme_display_vi yes
set -g theme_display_date no
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_display_user no
# set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Japan/Tokyo
# set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
# set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
# set -g theme_color_scheme solarized-light
# set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
# set -g theme_newline_cursor yes
# set -g theme_newline_prompt '$ '
# Prompt Settings }}}}

direnv hook fish | source
eval (direnv hook fish)

# vim:tw=88 ft=fish ts=4 sw=4 sts=4 fdm=marker si et:

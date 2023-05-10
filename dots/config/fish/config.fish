# set fish_greeting "Hello, world"

# set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"
# set -x -g TERM "xterm-256color"

# OS Detect {{{
switch (uname)
    case Linux
        # WSL {{{
        if uname -r | grep microsoft >/dev/null
            set -gx EDITOR gvim
            set -gx MYVIM gvim
            set -gx MYNVIM nvim

            set -gx BROWSER chromium
            # add coreutils gnubin if installed
            fish_add_path $HOME/.local/bin

            # set -xU GOPATH $HOME/go
            # fish_add_path /usr/sbin $GOPATH/bin

            fish_add_path $HOME/.cargo/env
            fish_add_path $HOME/.nimble/bin

            # }}}
        else
            # Linux Common {{{
            set -gx MYVIM gvim
            set -gx MYNVIM neovide
            set -gx EDITOR $MYNVIM
            set -gx BROWSER chromium
            # }}}
            # Arch {{{
            #    case Arch

            # set -xU GOPATH $HOME/go
            # fish_add_path $GOPATH/bin

            fish_add_path $HOME/.cargo/bin
            fish_add_path $HOME/.cargo/env
            fish_add_path $HOME/.config/rofi/bin
            fish_add_path $HOME/.deno/bin
            fish_add_path $HOME/.local/bin
            fish_add_path $HOME/.nimble/bin
            fish_add_path $HOME/.poetry/bin
            fish_add_path /usr/local/bin
            fish_add_path /usr/sbin

            abbr -a ai paru -S
            abbr -a aud paru -Syy
            abbr -a aug paru -Syyu
            # ld-linux.so
            # set -xg PYTHON_CONFIGURE_OPTS "--enable-unicode=ucs4"

            set -gx LD_LIBRARY_PATH /usr/lib/
            set -xg JAVA_HOME /usr/lib/jvm/java-11-adoptopenjdk
            abbr va $EDITOR $HOME/.config/rofi/bin
            zoxide init fish | source
            # }}}
            # Ubuntu {{{
            #    abbr -a ai sudo apt-get install -y
            #    abbr -a aud sudo apt-get update -y
            #    abbr -a aug sudo apt-get upgrade -y
            # end
        end
        # }}}
        # Mac {{{
    case Darwin
        set -gx MYVIM gvim
        set -gx MYNVIM goneovim
        set -gx EDITOR $MYNVIM
        set -gx BROWSER chromium

        if [ -d /Applications/Postgres.app/Contents/Versions/latest/bin ]
            set -x PATH $PATH "/Applications/Postgres.app/Contents/Versions/latest/bin"
        end
        if [ -e '/Applications/Launchbar.app' ]
            alias launchbar "open -a launchbar"
        end

        set -x PATH $HOME/.rbenv/bin $PATH
        status --is-interactive; and source (rbenv init -|psub)
        # add coreutils gnubin if installed
        set -l gnubin /usr/local/opt/coreutils/libexec/gnubin
        set -l gnuman /usr/local/opt/coreutils/libexec/gnuman
        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/Library/Python/3.7/bin
        set -gx RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
        set -gx QT5PATH /usr/local/Cellar/qt/5.11.2_1

        fish_add_path /usr/local/opt/gnu-getopt/bin
        fish_add_path /usr/local/opt/binutils/bin
        set -g -x CPPFLAGS "$CPPFLAGS -I /usr/local/opt/binutils/include"
        set -g -x LDFLAGS "$LDFLAGS -L /usr/local/opt/binutils/lib"

        if test -d $gnubin
            set -x PATH $gnubin $PATH
            set -x MANPATH $gnuman $MANPATH
        end

        # User bin folder
        fish_add_path /usr/bin
        fish_add_path /usr/local/bin
        fish_add_path /usr/local/sbin
        fish_add_path $HOME/.local/bin
        fish_add_path $HOME/go/bin
        # set -gx GOPATH $HOME/go

        alias reboot='systemctl reboot -i now'
        alias deb='sudo dpkg -i'

        # oh-my-fish/plugin-brew case FreeBSD NetBSD DragonFly
        # Mac }}}
    case '*'
        echo Who are you?
end
# OS Detect }}}

# set -x LANG ja_JP.UTF-8

# Alias {{{
alias x 'sudo xkeysnail --watch ~/.config/xkeysnail/config.py'
abbr v $EDITOR
abbr -a atg atcoder-tools gen
abbr -a att atcoder-tools test
abbr -a ats atcoder-tools submit
abbr -a atsu atcoder-tools submit -u

abbr vi $MYVIM
abbr n $MYNVIM
abbr -a V $EDITOR --remote-tab-silent
abbr -a vv $EDITOR ~/.vim/rc/dein.toml
abbr -a vF $EDITOR ~/.config/fish/config.fish
abbr -a vv $EDITOR ~/dotfiles/dots/vim/rc/dein.toml
abbr -a vs $EDITOR ~/dotfiles/init
abbr p python
abbr s scala
abbr py python
abbr p3 python3
abbr p2 python2
abbr ipython ipython3
abbr p2 python2
abbr -a ppi pip3 install
abbr -a ppua pip freeze \| xargs pip uninstall -y
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
abbr -a pydlm youtube-dl -f best -x --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"
abbr tm tmux
abbr -a tk tmux kill-server
abbr -a kill tmux kill-server
abbr -a ly clyrics -c

abbr -a d docker
abbr -a dc docker-compose
abbr -a dcd docker-compose down
abbr -a dcu docker-compose up
abbr -a dim docker images
abbr -a dpa docker ps -a
abbr -a dps docker ps
abbr -a drm docker rm
abbr -a dst docker stats
abbr -a dk docker kill (docker ps -q)
abbr -a dkill docker kill (docker ps -q)
abbr -a rmi docker rmi (docker images -q)
abbr -a rmc docker rm (docker ps -a -q)
abbr -a ni npm install


abbr ps procs
abbr rm trash
alias rm='trash'
#abbr -a psr procs|rg
abbr cc bat
abbr c clear
alias cat='bat'
# abbr -a cr bat\|rg
#alias grep='rg'
abbr r batgrep
alias rg='batgrep'
abbr find 'fd -X bat'
# alias find='fd -X bat'
alias fd='fd -X bat'

alias top='ytop'
abbr tp ytop
alias tl='tldr'
abbr gr grex
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
abbr kg docker run -v $PWD:/tmp/working -w=/tmp/working -p 8888:8888 --rm -it kaggle/python jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=/tmp/working --allow-root --runtime nvidia
abbr keygen ssh-keygen -t rsa -b 4096 -C "anosillus@gmail.com"

alias shodo='eval $BROWSER -app="https://app.shodo.ink/"'
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
# abbr -a fu git commit --fixup=(git log --oneline | peco | cut -d ' ' -f 1)
abbr -a g git
abbr -a g. git add .
abbr -a gC git checkout
abbr -a ga git add
abbr -a gaa git add -A
abbr -a gau git add -u
abbr -a gc git commit
abbr -a gca git commit --amend
abbr -a gcm git commit -m
abbr -a gdf git diff
abbr -a gfc git fetch
abbr -a gg git grep
abbr -a gl git clone
abbr -a gl git log
abbr -a glo git log --oneline
abbr -a gm git push origin main
abbr -a gmg git merge
abbr -a gmga git merge --abort
abbr -a gmgc git merge --continue
abbr -a gp git push
abbr -a gplm git pull origin main
abbr -a gplo git pull origin
abbr -a gpso git push origin
abbr -a grs git restore
abbr -a grv git revert
abbr -a grb git rebase
abbr -a grba git rebase --abort
abbr -a grbc git rebase --continue
abbr -a grbia git rebase -i --autosquash
abbr -a gw git switch
abbr -a gs git status
abbr -a jl jupyter lab

# abbr -a s  git switch (git branch --sort=-authordate | cut -b 3- | grep -v -- "->" | peco | sed -e "s%origin/%%")
# abbr -a show git show (git log --oneline | peco | cut -d ' ' -f 1)
#}}}

abbr -a fault sudo shutdown -P now
abbr -a de docker-exec

function docker-exec
    set name (docker ps --format "{{.Names}}" | fzf)
    docker exec -it $name $argv
end

if not functions -q exa
    alias l='exa --icons --all --sort name --extended'
    alias lf='exa --icons --all --sort extension --extended'

    alias la='exa --icons --sort name --blocks --extended'

    # alias la='exa --group-directories-first --icons --long --all --sort Name --no-user --no-permissions --no-time --no-filesize'
    alias ls='exa --icons --all --blocks --extended'
    alias lr='exa --icons --all --extended --sort extension |batgrep '

    alias las='exa --group-directories-first --icons --long --all --sort size'
    alias lsa='exa --group-directories-first --icons --long --all --sort size'

    # alias ls='exa --group-directories-first --icons --long --sort Size'
    alias ll='exa --all --long --sort name --icons'
    alias lla='exa --long --sort name --icons'

    # alias lla='exa --icons --all --sort name --blocks --extended'
    alias g='exa --long --all --git-ignore --group-directories-first --sort modified --changed  --reverse --icons --git --no-user --no-permissions'

    abbr lg 'ls -l --git' # Long format, git status
    abbr lt 'exa -T' # Long format, recursive as a tree
    abbr lx 'exa -sextension' # Long format, sort by extension
    abbr lk 'exa -ssize' # Long format, largest file size last
    abbr lt 'exa -smodified' # Long format, newest modification time last
    abbr lc 'exa -schanged' # Long format, newest status change (ctime) last
    alias ld='exa --only-dirs --blocks' # Long format, newest status change (ctime) last
    alias l2='exa --tree --level=2' # Long format, newest status change (ctime) last
    alias l3='exa --tree --level=3' # Long format, newest status change (ctime) last
    alias lt='exa --tree'
    abbr lg 'exa |grep '

end


# alias ap='sudo apt install -y'
# alias au='sudo apt remove -y'
# alias ad='sudo apt update'
# alias q='nvim-qt'

# alias jl='jupyter lab'
#alias pip='pip3'
#alias pip2='pip2'

# alias l ls\ -AFG
# alias ll ls\ -AFGl
# }}}

# fundle {{{
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin edc/bass
fundle plugin IlanCosman/tide
fundle plugin danhper/fish-fastdir
fundle plugin oh-my-fish/plugin-peco
fundle plugin demartini/plugin-docker-compose
fundle plugin Gazorby/fish-git-emojis
fundle plugin eth-p/fish-plugin-sudo
fundle plugin decors/fish-ghq
# fundle plugin FabioAntunes/fish-nvm
# fundle plugin jorgebucaran/fish-nvm

# fundle plugin 'jethrokuan/z'
fundle plugin patrickf1/colored_man_pages.fish
fundle plugin lgathy/google-cloud-sdk-fish-completion
# fundle plugin 'gazorby/fish-exa'
# fundle plugin 'oh-my-fish/theme-bobthefish'
# fundle plugin 'jorgebucaran/powerline.fish'
fundle plugin 'jorgebucaran/spark.fish'
fundle plugin ryoppippi/fish-poetry
# fundle plugin 'b4b4r07/enhancd'
fundle plugin oh-my-fish/plugin-pyenv
fundle plugin ka2n/fish-peco_todoist
fundle init

# }}}

# {{{ env install and path
if not test -d ~/.anyenv
    git clone https://github.com/riywo/anyenv ~/.anyenv
    mkdir -p ~/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
    exec $SHELL -l
    anyenv init - fish | source
    anyenv install pyenv
    # anyenv install nodenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git (pyenv root)/plugins/pyenv-virtualenv
else
    # set -x PATH $HOME/.anyenv/bin $PATH
    set PATH $PATH $HOME/.anyenv/bin
    set PATH $PATH $HOME/.anyenv/envs/pyenv/bin
    set PATH $PATH $HOME/.anyenv/envs/nodenv/bin

    if command -v pyenv 1>/dev/null 2>&1
        if status is-login && test -z "$TMUX"
            pyenv init --path fish | source
        end
        pyenv init - fish | source
        pyenv virtualenv-init - fish | source
    end

    # anyenv init - fish | source
    # status --is-interactive; and source (anyenv init -|psub)
    # anyenv init
    eval (direnv hook fish)
end
# direnv hook fish | source
# eval (direnv hook fish)


if functions -q aws-cli
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end
# }}}

function fish_user_key_bindings
    bind \ch 'peco_select_history (commandline -b)'
    bind \cu 'cdh | peco | read select'
    bind \ctt peco_todoist_item
    bind \ctp peco_todoist_project
    bind \ctl peco_todoist_labels
    bind \ctc peco_todoist_close
    bind \ctd peco_todoist_delete
end

function pya -d "Activates the current project's Python virtualenv"
    if [ -e Pipfile ]
        command pipenv shell --fancy
    else if [ -e ".python-version" ]
        pyenv activate (cat ".python-version")
    else if [ -e "pyproject.toml" ]
        set -l path (poetry env info -p)
        source $path/bin/activate.fish
    else
        echo "No virtual environment found for this project!"
    end
end


function goneovim
    nohup goneovim "$argv" >/dev/null 2>&1 & disown
end

set fish_plugins theme peco
set GHQ_SELECTOR peco
# set -U async_prompt_inherit_variables all
# set -U async_prompt_functions fish_right_prompt

# set -xg JAVA_HOME "/usr/lib/jvm/default/bin"

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
set -U ENHANCD_FILTER peco

# Prompt Settings {{{
set VIRTUAL_ENV_DISABLE_PROMPT disable
# set VIRTUAL_ENV

set -g theme_display_git yes
set -g theme_display_git_dirty no
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support no
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_aws_vault_profile yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix yes
set -g theme_display_python yes
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
# set -g theme_display_vi no
# set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Japan/Tokyo
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
set -g theme_color_scheme solarized-dark
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1
# set -g theme_newline_cursor yes
# set -g theme_newline_prompt '$ '
# Prompt Settings }}}}

# fish enhancd is buggy {{{
# set -g ENHANCD_ROOT
# set -g ENHANCD_COMMAND
# set -g ENHANCD_FILTER
# set -g ENHANCD_DIR $HOME/.enhancd
# set -g ENHANCD_DISABLE_DOT -0
# set -g ENHANCD_DISABLE_HYPHEN -0
# set -g ENHANCD_DOT_ARG -..
# set -g ENHANCD_HYPHEN_ARG --
# set -g ENHANCD_HYPHEN_NUM -10
# set -g ENHANCD_HOME_ARG -
# set -g ENHANCD_USE_FUZZY_MATCH -1
# set -g ENHANCD_COMPLETION_DEFAULT
# set -g ENHANCD_COMPLETION_KEYBIND -^I
# set -g ENHANCD_COMPLETION_BEHAVIOR -default
# set -g ENHANCD_DISABLE_HOME 1
# set -g ENHANCD_FILTER peco
# }}}


# vim:tw=88 ft=fish ts=4 sw=4 sts=4 fdm=marker si et:

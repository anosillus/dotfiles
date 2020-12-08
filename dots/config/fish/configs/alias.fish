# alias ap='sudo apt install -y'
# alias au='sudo apt remove -y'
# alias ad='sudo apt update'
# alias q='nvim-qt'

abbr p python3
abbr python python3
abbr python2 python2
abbr ipython ipython3
abbr p2 python2
abbr pi pip3 install
abbr pr pip3 remove
abbr pip pip3
abbr pu pip3 install --upgrade
abbr pi2 pip2 install
abbr pu2 pip2 install --upgrade
abbr gi gem install
abbr ni npm install
abbr ng npm install -g
abbr html google-chrome
abbr skk yaskkserv2 --config-filename ~/.skk/linux_yaskkserv2.conf

#alias jn='jupyter-notebook'
#alias pip='pip3'
#alias pip2='pip2'

# alias l ls\ -AFG
# alias ll ls\ -AFGl

alias W='eval $EDITOR ~/Work'
alias vW='eval $EDITOR ~/Work'
alias D='eval $EDITOR ~/dev'

abbr v $EDITOR
abbr V $EDITOR --remote-tab-silent
abbr vv $EDITOR ~/.vim/rc/dein.toml
abbr vf $EDITOR ~/.config/fish/config.fish
abbr va $EDITOR ~/.config/fish/configs/alias.fish

alias shodo='eval $Browser -app="https://app.shodo.ink/"'
alias gmail='eval $Browser -app="https://mail.google.com/mail/u/0/#inbox"'
alias gmail='eval $Browser -app="https://mail.google.com/mail/u/0/#inbox"'
alias gcp='eval $Browser -app="https://console.cloud.google.com/"'
alias domain='eval $Browser -app="https://njal.la/domains/"'

alias tar='tar -xvzf'
alias 7z='7z x'
alias xz='tar Jxfv'
alias rar='unrar e -r'
abbr pandoc pandoc --from=markdown --to=latex
abbr ai sudo apt-get install -y
abbr aud sudo apt-get update -y
abbr aug sudo apt-get upgrade -y


abbr ydlm youtube-dl -f best -x --audio-format mp3  -o "~/Music/%(title)s.%(ext)s"
abbr tmux kill-server
abbr v $EDITOR

alias tm='tmux'
abbr skkserv yaskkserv2 --config-filename ~/.skk/linux_yaskkserv2.conf


alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

alias fault= 'sudo shutdown -P now'

alias md 'mkdir -p'
alias cx 'chmod +x'
alias 'c-x' 'chmod -x'

abbr docker run -i -t -p 8888:8888 -v (pwd):/opt/playground continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/playground --ip='*' --allow-root --NotebookApp.token='' --NotebookApp.password='' --port=8888 --no-browser"
abbr docker run -d -p 8787:8787 -v (pwd):/home/rstudio rocker/rstudio
abbr ssh-keygen -t rsa -b 4096 -C "anosillus@gmail.com"

# Git {{{
alias gd='vim +Gapply'
alias gs='git status'
alias gc='git clone '
alias ga='git add '
alias gaa='git add .'
alias gc='git commit -m '
alias gp='git push'
#}}}
#balias g git

# alias ap='sudo apt install -y'
# alias au='sudo apt remove -y'
# alias ad='sudo apt update'
# alias q='nvim-qt'

alias p='python3'
alias python='python3'
alias python2='python2'
alias ipython='ipython3'
alias p2='python2'
alias pi='pip3 install'
alias pip='pip3'
alias pu='pip3 install --upgrade'
alias pi2='pip2 install'
alias pu2='pip2 install --upgrade'
alias gi='gem install'
alias ni='npm install'
alias ng='npm install -g'
alias html='google-chrome'
alias skkserv='yaskkserv2 --config-filename ~/.skk/linux_yaskkserv2.conf'

#alias jn='jupyter-notebook'
#alias pip='pip3'
#alias pip2='pip2'

# alias l ls\ -AFG
# alias ll ls\ -AFGl

alias W='eval $EDITOR ~/Work'
alias vW='eval $EDITOR ~/Work'
alias D='eval $EDITOR ~/dev'

alias v='eval $EDITOR'
alias V='eval $EDITOR --remote-tab-silent'
alias vv='eval $EDITOR ~/.vim/rc/dein.toml'
alias vf='eval $EDITOR ~/.config/fish/config.fish'

alias shodo='eval $Browser -app="https://app.shodo.ink/"'
alias gmail='eval $Browser -app="https://mail.google.com/mail/u/0/#inbox"'
alias gmail='eval $Browser -app="https://mail.google.com/mail/u/0/#inbox"'
alias gcp='eval $Browser -app="https://console.cloud.google.com/"'
alias domain='eval $Browser -app="https://njal.la/domains/"'

alias tar='tar -xvzf'
alias 7z='7z x'
alias xz='tar Jxfv'
alias rar='unrar e -r'
abbr pandoc --from=markdown --to=latex
abbr youtube-dl -f best -x --audio-format mp3  -o "~/Music/%(title)s.%(ext)s"

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

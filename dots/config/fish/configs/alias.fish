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

alias l ls\ -AFG
alias ll ls\ -AFGl

alias W='eval $EDITOR ~/Work'
alias vW='eval $EDITOR ~/Work'
alias D='eval $EDITOR ~/dev'
alias tar='tar -xvzf'
alias 7z='7z x'
alias xz='tar Jxfv'
alias rar='unrar e -r'
alias pantex='pandoc --from=markdown --to=latex'
alias um='youtube-dl -f best -x --audio-format mp3  -o "~/Music/%(title)s.%(ext)s"'
alias jn='docker-compose -f $HOME/docker/jupyter_setup/docker-compose.yml -up -d'
alias rs='docker-compose -f  ~/docker/docker-rstudio-server/docker-compose.yml up -d'

alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

alias fault= 'sudo shutdown -P now'

alias md 'mkdir -p'
alias cx 'chmod +x'
alias 'c-x' 'chmod -x'

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

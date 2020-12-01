# set fish_greeting "Hello, world"

# set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"
# set -x -g TERM "xterm-256color"

switch (uname)
  case Linux
    if uname -r | grep 'microsoft' > /dev/null
      . ~/.config/fish/configs/wsl.fish
    else
      . ~/.config/fish/configs/linux.fish
    end
  case Darwin
    . ~/.config/fish/configs/mac.fish
  case FreeBSD NetBSD DragonFly
    echo Hi Beastie!
  case '*'
    echo Who are you?
end

. ~/.config/fish/configs/alias.fish
. ~/.config/fish/configs/func.fish

if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if not test -d ~/.anyenv
  git clone https://github.com/riywo/anyenv ~/.anyenv
  mkdir -p ~/.anyenv/plugins
  git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
  exec $SHELL -l
  anyenv init - fish | source
  anyenv install pyenv
  anyenv install nodenv
end
set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
anyenv init - fish | source

eval (direnv hook fish)

if functions -q aws-cli
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end


# set fish_plugins theme peco
set -U async_prompt_inherit_variables all
# set -U async_prompt_functions fish_right_prompt

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

set -g theme_display_git yes
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_nvm yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Japan/Tokyo
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme solarized-light
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
# # direnv hook fish | source

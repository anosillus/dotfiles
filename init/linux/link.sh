function create_link() {
    local source_path="$HOME/dotfiles/dots/$1"
    local target_path="$HOME/$2"

    if [ -d "$source_path" ]; then
        rm -rf "$target_path"
        ln -s "$source_path" "$target_path"
    elif [ -f "$source_path" ]; then
        local target_dir="$(dirname "$target_path")"

        if [ ! -d "$target_dir" ]; then
            mkdir -p "$target_dir"
        fi

        rm -f "$target_path"
        ln -s "$source_path" "$target_path"
    fi
}

create_link "nvim/lua/custom" ".config/nvim/lua/custom"
create_link "fish/config.fish" ".config/fish/config.fish"
create_link "kaggle" ".kaggle"
create_link "skk" ".skk"
create_link "textlintrc" ".textlintrc"
create_link "bash_profile" ".bash_profile"
create_link "atcodertools.toml" ".atcodertools.toml"
create_link "tmux.conf" ".tmux.conf"
create_link "config/fish/config.fish" ".config/fish/config.fish"
create_link "config/git/config" ".config/git/config"
create_link "config/git/ignore" ".config/git/ignore"
create_link "config/direnv/direnvrc" ".config/direnv/direnvrc"
create_link "config/bat/config" ".config/bat/config"
create_link "config/zathura/zathurarc" ".config/zathura/zathurarc"
create_link "config/vlc/vlcrc" ".config/vlc/vlcrc"
create_link "config/rofi" ".config/rofi"
create_link "config/kitty/" ".config/kitty"
function fish_user_key_bindings
        bind \cr peco_select_history
        bind \c] peco_select_ghq_repository

        # gh-open
        bind \cx\cl peco_open_gh_repository
        # コマンド履歴を見る
        bind \cr peco_select_history
        # プロセスをキルする
        bind \cx\ck peco_kill
        # 最近見たディレクトリに移動
        bind \cx\cr peco_recentd

        # fzf
        bind \cx\cf '__fzf_find_file'
        bind \ctr '__fzf_reverse_isearch'
        bind \ex '__fzf_find_and_execute'
        bind \ed '__fzf_cd'
        bind \eD '__fzf_cd_with_hidden'
end
# }}}

# cd のあとに ls -a
# function cd
#   builtin cd $argv
#   ls -a
# end

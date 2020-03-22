scriptencoding utf-8

function! s:template_keywords()
  %s/<+FILE NAME+>/\=expand('%:t')/g
  %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
  if search('<+CURSOR+>')
    execute 'normal! "_da>'
  endif
endfunction
" ---------- Tab/Indent ----------
set splitright
setl expandtab
setl tabstop=2
setl shiftwidth=2
setl softtabstop=2
setl autoindent
setl smartindent
setl smarttab
setl laststatus=2

if exists('&ambiwidth')
  setl ambiwidth=double
endif

function! s:bufnew()
  if &buftype ==# 'terminal' && &filetype ==# ''
    set filetype=terminal
  endif
endfunction

function! s:terminal_settings()
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-g> <C-\><C-n>:q!<CR>,
  " tnoremap <C-c> <C-\><C-n>
  " tnoremap <C-,> <C-\><C-n><C-w>W
  " 他のウィンドウを閉じて最大化する
  nnoremap <Leader>q :<C-u>q!<CR>

  " noremap  <A-o> <C-w>o
  " inoremap <A-o> <Esc><C-w>o
  " tnoremap <C-;> <C-\><C-n><C-w>o
  " tnoremap <C-/> <C-\><C-n><C-w>:"
endfunction

function! s:initialize_ref_viewer()
  nmap <buffer> s <Plug>(ref-back)
  nmap <buffer> t <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
endfunction

function! s:auto_goyo()
  setl filetype=markdown
  :Goyo 80
endfunction

function! s:jp_setting()
  echo "test"
endfunction

augroup MyAutoCmd
  autocmd!
  autocmd BufEnter */jp_memo/* call s:jp_setting()
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab
  autocmd FileType terminal call s:terminal_settings()
  autocmd FileType ref call s:initialize_ref_viewer()
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces

  " autocmd BufRead,BufNewFile *.csv,*.dat setfiletype csv
  " autocmd BufNewFile,BufRead *.ipynb nmap <leader>o :VimpyterInsertPythonBlock<CR>
  " autocmd BufNewFile,BufRead *.ipynb nmap <silent><Leader>o :VimpyterStartJupyter<CR>
  " autocmd BufNewFile,BufRead *.ipynb nmap <C-CR> :VimpyterStartJupyter<CR>
  " autocmd BufNewFile,BufRead *.ipynb highlight VimpyterUpdate term=bold ctermfg=14
  autocmd BufNewFile,BufRead *.ipynb setl filetype=jupyter
  autocmd FileType gina-commit setl spell setl filetype=text
  autocmd FileType c,cpp setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 cindent shiftround
  "https://vim-jp.org/vimdoc-ja/indent.html
  " Reload .vimrc automatically.
  autocmd BufWritePost .vimrc,vimrc,*.rc.vim source $MYVIMRC | redraw
" A | <Plug>(anzu-clear-search-status)euto reload VimScript.
  autocmd FileType,Syntax,BufNewFile,BufNew,BufRead
    \ call vimrc#on_filetype() " it need for ale
  autocmd BufNewFile,BufRead *.R,*.Rout,*.r,*.Rhistory,*.Rt,*.Rout.save,*.Rout.fail setl filetype=r
  autocmd BufNewFile,BufRead *.[rR]history setl filetype=r
  " autocmd BufNew,BufRead,BufNewFile *.{mkd,markdown,md,mdwn,mkdn}  call s:auto_goyo()
  autocmd BufNew,BufRead,BufNewFile *.{mkd,markdown,md,mdwn,mkdn} setl filetype=markdown
  autocmd BufRead,BufNewFile README.md setlocal ft=markdown.gfm
  autocmd BufNewFile,BufRead *.vue setl filetype=javascript
  autocmd BufNew,BufNewFile,BufRead .textlintrc setl filetype=json
  autocmd FileType python nmap <silent> lo <Plug>(pydocstring)
  " autocmd FileType python xmap <silent> lo :<C-u>'<,'>Pydocstring<CR>


  " autocmd BufNewFile,BufRead markdown call s:auto_goyo()
  " autocmd VimEnter * echo 'Sleep'
  " autocmd VimLeave * echo 'Sleep'
  " autocmd BufLeave * sleep | echom 1
  " autocmd BufLeave * !echo 2
  " autocmd BufWrite * !echo 'write'
  " autocmd VimLeave * !echo "end"
  " autocmd QuitPre * !echo "quite pre"

  if has('nvim')
  " Neovim
    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
  else
    " Vim
    autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
  endif
  autocmd FileType help,git-status,git-log nnoremap <buffer> q <C-w>c
  autocmd User plugin-template-loaded call s:template_keywords()
  autocmd User plugin-template-loaded silent %s/<%=\(.\{-}\)%>/\=eval(submatch(1))/ge

  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
   nnoremap <silent><buffer><expr> <CR>
   \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
   \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
   \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
   \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> s
   \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
   \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> a
  \ denite#do_map('do_action', 'add')
    nnoremap <silent><buffer><expr> r
  \ denite#do_map('do_action', 'reset')
  endfunction

  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  endfunction

  if has('nvim')
  " Neovim 用
    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
  else
    " Vim 用
    autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
  endif
  function! SetCursorStyle()
    if &term =~? "xterm\\|rxvt"
      " use a | cursor in insert mode
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      " use a rectangle cursor otherwise
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
      " reset cursor when vim exits
      autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"
    endif
  endfunction
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
  autocmd WinEnter * checktime
augroup END

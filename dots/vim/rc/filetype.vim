scriptencoding utf-8

function! s:template_keywords()
  %s/<+FILE NAME+>/\=expand('%:t')/g
  %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
  if search('<+CURSOR+>')
    execute 'normal! "_da>'
  endif
endfunction

function! s:bufnew()
  if &buftype ==# 'terminal' && &filetype ==# ''
    set filetype=terminal
  endif
endfunction

" Terminal Mode(Not Used) {{{
" function! s:terminal_settings()
  " tnoremap <Esc> <C-\><C-n>
  " tnoremap <C-g> <C-\><C-n>:q!<CR>,
  " tnoremap <C-c> <C-\><C-n>
  " tnoremap <C-,> <C-\><C-n><C-w>W

  " noremap  <A-o> <C-w>o
  " inoremap <A-o> <Esc><C-w>o
  " tnoremap <C-;> <C-\><C-n><C-w>o
  " tnoremap <C-/> <C-\><C-n><C-w>:"
" endfunction
" }}}

function! s:initialize_ref_viewer()
  nmap <buffer> s <Plug>(ref-back)
  nmap <buffer> t <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
endfunction

function! s:auto_goyo()
  " setl filetype=markdown
  :Goyo 80
endfunction

function! s:jp_setting()
  " let b:ale_textlint_options = --rule general-novel-style-ja
  let b:loaded_jasegment = 0
  let g:jasegment#highlight = 2
  call s:auto_goyo()

  setlocal spelllang=cjk
  setlocal spell
  setlocal scrolloff=9999
  setlocal eventignore=hilight-idegraphic-space

  function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {
    \     "\<CR>": '<Over>(easymotion)'
    \   },
    \   'is_expr': 0
    \ }), get(a:, 1, {}))
  endfunction

  noremap <silent><expr> m,  incsearch#go(<SID>incsearch_config())
  noremap <silent><expr> m?  incsearch#go(<SID>incsearch_config({'command': '?'}))


  function! s:config_migemo(...) abort
    return extend(copy({
    \   'converters': [
    \     incsearch#config#migemo#converter(),
    \   ],
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {"\<C-l>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \ }), get(a:, 1, {}))
  endfunction

  noremap <silent><expr> , incsearch#go(<SID>config_migemo())
  noremap <silent><expr> ? incsearch#go(<SID>config_migemo({'command': '?'}))

  noremap <silent> <C-i> f。
  noremap <silent> <C-h> F。
  nmap <silent> I <Plug>JaSegmentMoveNE
  nmap <silent> i <Plug>JaSegmentMoveNW
  nmap <silent> h <Plug>JaSegmentMoveNB
  omap <silent> I <Plug>JaSegmentMoveOE
  omap <silent> i <Plug>JaSegmentMoveOW
  omap <silent> h <Plug>JaSegmentMoveOB
  xmap <silent> I <Plug>JaSegmentMoveVE
  xmap <silent> i <Plug>JaSegmentMoveVW
  xmap <silent> h <Plug>JaSegmentMoveVB
  omap <silent> ai <Plug>JaSegmentTextObjA
  omap <silent> ii <Plug>JaSegmentTextObjI
  xmap <silent> ai <Plug>JaSegmentTextObjVA
  xmap <silent> si <Plug>JaSegmentTextObjVI
endfunction

augroup MyAutoCmd
  autocmd!
  autocmd BufEnter */jp_memo/* call s:jp_setting()
  autocmd BufEnter jp_* call s:jp_setting()
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab
  " autocmd FileType terminal call s:terminal_settings()
  autocmd FileType ref,help call s:initialize_ref_viewer()
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
  autocmd FileType gina-commit setl filetype=gitcommit
  autocmd FileType gitcommit setlocal spell
  autocmd BufNewFile,BufRead textlintrc setl filetype=json
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
  autocmd FileType python map <silent> lo <Plug>(pydocstring)
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

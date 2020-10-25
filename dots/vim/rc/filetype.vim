scriptencoding utf-8

function! s:template_keywords()
  silent %s/<%=\(.\{-}\)%>/\=eval(submatch(1))/ge
  silent %s/<+FILE NAME+>/\=expand('%:t')/g
  silent %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
  silent %s/<+MAIL+>/\anosillus@gmail.com/g
  silent %s/<+AUTHOR+>/\@anosillus/g
  silent %s/<+MIT_LICENCE+>/\MIT/g
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
  " setlocal filetype=markdown
  :Goyo 80
endfunction

augroup MyAutoCmd
  autocmd!
 " autocmd BufRead,BufNewFile *jp.md call s:jp_mode()
 " autocmd WinEnter * if b:japanese_mode ==# 1|call plug#load('coc.vim')|endif
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2 expandtab
  " autocmd FileType terminal call s:terminal_settings()
  autocmd FileType ref,help call s:initialize_ref_viewer()
  " autocmd BufRead,BufNewFile,BufReadPre *.ts setlocal filetype=typescript

  " autocmd BufRead,BufNewFile *.csv,*.dat setfiletype csv
  " autocmd BufNewFile,BufRead *.ipynb nmap <leader>o :VimpyterInsertPythonBlock<CR>
  " autocmd BufNewFile,BufRead *.ipynb nmap <silent><Leader>o :VimpyterStartJupyter<CR>
  " autocmd BufNewFile,BufRead *.ipynb nmap <C-CR> :VimpyterStartJupyter<CR>
  " autocmd BufNewFile,BufRead *.ipynb highlight VimpyterUpdate term=bold ctermfg=14
  autocmd BufNewFile,BufRead *.ipynb set filetype=jupyter
  autocmd FileType gina-commit set filetype=gitcommit
  autocmd FileType gitcommit setlocal spell
  autocmd BufNewFile,BufRead textlintrc, .textlinrc set filetype=json
  autocmd FileType json setlocal expandtab foldmarker=syntax
  "https://vim-jp.org/vimdoc-ja/indent.html
  " Reload .vimrc automatically.
  autocmd BufWritePost .vimrc,vimrc,*.rc.vim source $MYVIMRC | redraw
  autocmd FileType,Syntax,BufNewFile,BufNew,BufRead
    \ call vimrc#on_filetype() " it need for ale
  autocmd BufNewFile,BufRead *.R,*.Rout,*.r,*.Rhistory,*.Rt,*.Rout.save,*.Rout.fail set filetype=r
  autocmd BufNewFile,BufRead *.[rR]history set filetype=r
  " autocmd BufNew,BufRead,BufNewFile *.{mkd,markdown,md,mdwn,mkdn}  call s:auto_goyo()
  autocmd BufNew,BufRead,BufNewFile *.{mkd,markdown,md,mdwn,mkdn} set filetype=markdown
  autocmd BufRead,BufNewFile README.md set filetype=markdown.gfm
  autocmd BufNewFile,BufRead init.macros set filetype=dosbatch
  autocmd BufNewFile,BufRead workflows set filetype=yaml
  autocmd BufNewFile,BufRead *.vue set filetype=javascript
  autocmd FileType python map <silent> lo <Plug>(pydocstring)
  " autocmd FileType python xmap <silent> lo :<C-u>'<,'>Pydocstring<CR>
  " autocmd BufNewFile,BufRead markdown call s:auto_goyo()

  if has('nvim')
  " Neovim
    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
  else
    " Vim
    autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
  endif
  autocmd FileType help,git-status,git-log nnoremap <buffer> q <C-w>c
  autocmd User plugin-template-loaded call s:template_keywords()

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

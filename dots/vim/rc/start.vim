if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
    \                 | redraw
    \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

" == Encoding settings. == {{{1
" Use utf-8.
if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  setglobal encoding=utf-8
endif

" Must after set of 'encoding'.
scriptencoding utf-8

if has('guess_encode')
  setglobal fileencodings=ucs-bom,utf-8,iso-2022-jp,guess,euc-jp,cp932,latin1
else
  setglobal fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,latin1
endif
setglobal fileformats=unix,dos

function! s:source_rc(path, ...) abort
  let l:use_global = get(a:000, 0, !has('vim_starting'))
  let l:abspath = resolve(expand('~/.vim/rc/' . a:path))
  if !l:use_global
    execute 'source' fnameescape(l:abspath)
    return
  endif
endfunction
" }}}

"----------- System ----------- "{{{
let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif
if !isdirectory(expand('$CACHE/vim/undo'))
    call mkdir(expand('$CACHE/vim/undo'), 'p')
endif
if !isdirectory(expand('$CACHE/vim/backup'))
    call mkdir(expand('$CACHE/vim/backup'), 'p')
endif

set directory=+~/.cache/vim/
set undodir=~/.cache/vim/undo
set backupdir=~/.cache/vim/backup
if !has('nvim')
  set viminfo+=n~/.cache/vim/viminfo
else
  set viminfo+=n~/.cache/vim/nviminfo
endif
set backup
set writebackup
set noswapfile
set undofile
set history=100
set undolevels=100
" }}}

runtime! debian.vim

" call s:source_rc('gui.vim')
call s:source_rc('private.vim')
call s:source_rc('env.vim')
call s:source_rc('filetype.vim')
call s:source_rc('plug.vim')

" ColorScheme {{{
if has('vim_starting') && !empty(argv())
  if has('syntax')
    syntax on
  endif
  colorscheme jellybeans
endif

if !exists('g:colors_name')
  colorscheme morning
endif
" }}}

if (has('termguicolors'))
 set termguicolors
endif

call s:source_rc('basic.vim')
call s:source_rc('keymap.vim')

set signcolumn=yes

"---------------------------------------------------------------------------

set secure

" vim: foldmethod=marker

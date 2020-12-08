set encoding=utf-8

if &compatible
  set nocompatible
endif

if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
    \                 | redraw
    \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

function! s:source_rc(path) abort
  let abspath = resolve(expand('~/.vim/rc/' . a:path))
  execute 'source' fnameescape(abspath)
endfunction

if has('vim_starting')
  call s:source_rc('setup.vim')
endif

call s:source_rc('plug.vim')

if has('vim_starting') && !empty(argv())
  if execute('filetype') =~# 'OFF'
    " Lazy loading
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endif

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')
endif

set secure

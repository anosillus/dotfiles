---------------------------------------------------------------------------
" For Mac:
"

" Use sh.  It is faster
set shell=sh
set macmeta
set antialias

" Set path.
let $PATH = expand('~/bin'). ':' expand('~/.pyenv/shims'). ':/usr/local/bin/:'.$PATH

let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:pydocstring_doq_path = $HOME.'/.local/bin/doq'

if has('gui_running')
  finish
endif

"---------------------------------------------------------------------------
" For CUI:
"

" Enable 256 color terminal.
set t_Co=256

if !has('nvim')
  set term=xterm-256color

  " Change cursor shape.
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[0 q"

  if exists('+confirm')
    set confirm
  endif
endif

" Enable true color
if exists('+termguicolors')
  set termguicolors
endif

" Disable the mouse.
set mouse=

" Colorscheme
colorscheme jellybeans

" ---------------------------------------------------------------------------
" For UNIX:
"
" Use sh.  It is faster
set shell=sh

" Set path.
let $PATH = expand('~/bin'). expand('~/.pyenv/shims'). ':/usr/local/bin/:'.$PATH

" set runtimepath+=~\.vim

let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:pydocstring_doq_path = '/home/anosillus/.local/bin/doq'
let g:jasegment#model = 'cabocha'
let g:jasegment#mecab#args = '-Owakati -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd/'
" Use yaskkserv
let g:eskk#dictionary = {
\   'path': expand('$CACHE/skk-jisyo'),
\   'sorted': 0,
\   'encoding': 'utf-8'
\}
let g:eskk#large_dictionary = {
\   'path': '/home/anosillus/dotfiles/dots/skk/SKK-JISYO.L',
\   'sorted': 1,
\   'encoding': 'euc-jp'
\}
let g:eskk#server = {
\   'host': 'localhost',
\   'port':  1178
\}

if has('gui_running')
  finish
endif

"---------------------------------------------------------------------------
" For CUI:
"

" Enable 256 color terminal.
set t_Co=256

" if !has('nvim')
"   set term=xterm-256color

"   " Change cursor shape.
"   let &t_SI = "\<Esc>[6 q"
"   let &t_SR = "\<Esc>[4 q"
"   let &t_EI = "\<Esc>[0 q"

"   if exists('+confirm')
"     set confirm
"   endif
" endif

" Enable true color
if exists('+termguicolors')
  set termguicolors
endif

" Disable the mouse.
set mouse=

" Colorscheme
colorscheme jellybeans

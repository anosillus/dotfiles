scriptencoding utf-8

" ---------- OS ----------
if !exists('g:os')
  if has('win64') || has('win32') || has('win16')
    let g:os = 'Windows'
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

if has('gui_running')
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#tips-for-using-pyenv
  if g:os ==? 'Darwin'
    let g:python_host_prog  = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:eskk#large_dictionary = { 'path': '~/Library/Application\ Support/AquaSKK/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp', }
    let g:pydocstring_doq_path = $HOME.'/.local/bin/doq'
    set macmeta
    set antialias
  elseif g:os ==? 'Linux'
    let g:python3_host_prog='/usr/bin/python3'
    let g:python_host_prog='/usr/bin/python3'
    let g:pydocstring_doq_path = $HOME.'/.local/bin/doq'
    let g:eskk#large_dictionary = { 'path': '/usr/share/skk/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp', }
    let g:eskk#dictionary = { 'path': '$HOME/.config/skk/.skk-jisyo', 'sorted': 0, 'encoding': 'utf-8', }
    " set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
  elseif g:os ==? 'Windows'
    let g:vimproc#download_windows_dll = 1
    set runtimepath+='C:\Python38'
    set pythonthreedll+='C:\Python38\python38.dll'
    let &pythonthreedll='C:\Python38\python38.dll'
    let g:pydocstring_doq_path = 'C:\Python38\Scripts\doq'
    let g:python3_host_prog = expand('C:\Python38\python.exe')
    let g:eskk#large_dictionary = { 'path': '$HOME/Documents/skk/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp', }
    let g:eskk#dictionary = { 'path': '$HOME/.config/skk/.skk-jisyo', 'sorted': 0, 'encoding': 'utf-8', }
    " set shell=powershell.exe shellquote=\" shellpipe=\| shellredir=>
    " set shellslash
    " set shellcmdflag=\ -NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  endif
endif

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:sql_type_default = 'pgsql'
let g:go_bin_path = $GOPATH.'/bin'

"----------- GUI -----------
"
if has('gui')
  setl guioptions=egLta
  if !has('nvim') && has('patch-7.4.1770')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  if exists('+termguicolors')
    set termguicolors
  elseif exists('+guicolors')
    set guicolors
  endif

  setl iminsert=2
  set renderoptions=type:directx
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
endif
"----------- System -----------
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

set helplang=en,ja
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

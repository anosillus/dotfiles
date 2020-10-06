scriptencoding utf-8

" ---------- OS ----------
if !exists('g:os')
  if has('win64') || has('win32') || has('win16')
    let g:os = 'Windows'
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

if has('gui_running')
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#tips-for-using-pyenv
  if g:os ==? 'Darwin'
    let g:python_host_prog  = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:pydocstring_doq_path = $HOME.'/.local/bin/doq'
    set macmeta
    set antialias
    let g:eskk#dictionary = {
        \   'path': expand('$CACHE/skk-jisyo'),
        \   'sorted': 0,
        \   'encoding': 'utf-8',
        \}
    let g:eskk#large_dictionary = {
        \   'path': '~/Library/Application\ Support/AquaSKK/SKK-JISYO.L',
        \   'sorted': 1,
        \   'encoding': 'euc-jp',
        \}
  elseif g:os ==? 'Linux'
    runtime! debian.vim
    let g:python3_host_prog='/usr/bin/python3'
    let g:python_host_prog='/usr/bin/python2'
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    let g:pydocstring_doq_path = $HOME.'/.local/bin/doq'
    let g:jasegment#mecab#args = '-Owakati -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd/'
    " Use yaskkserv
    let g:eskk#server = {
        \	'host': 'localhost',
        \	'port':  1178,
   \}
    let g:eskk#dictionary = {
        \   'path': expand('$CACHE/skk-jisyo'),
        \   'sorted': 0,
        \   'encoding': 'utf-8',
        \}
    let g:eskk#large_dictionary = {
        \   'path': '$HOME/.skk/SKK-JISYO.L',
        \   'sorted': 1,
        \   'encoding': 'euc-jp',
        \}
  elseif g:os ==? 'Windows'
    let g:vimproc#download_windows_dll = 1
    set runtimepath+=C:\Users\anosillus\AppData\Local\Microsoft\WindowsApps\python.exe
    set pythonthreedll+=C:\Users\anosillus\AppData\Local\Programs\Python\Python38\python38.dll
    let &pythonthreedll='C:\Users\anosillus\AppData\Local\Programs\Python\Python38\python38.dll'
    let g:lsp_settings_servers_dir='C:\Users\anosillus\.config\vim-lsp-settings'
    let g:pydocstring_doq_path='C:\Users\anosillus\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts\doq.exe'
    let g:python3_host_prog = expand('C:\Users\anosillus\AppData\Local\Microsoft\WindowsApps\python.exe')
    let g:jasegment#mecab#cmd="C:/'Program Files'/MeCab/bin/mecab.exe"
    let g:jasegment#mecab#args='-Owakati -d C:\Tools\mecab-ipadic-neologd'
    let g:jasegment#mecab#enc='utf-8'
    let g:eskk#dictionary = {
        \   'path': expand('$CACHE/skk-jisyo'),
        \   'sorted': 0,
        \   'encoding': 'utf-8',
        \}
    let g:eskk#large_dictionary = {
        \   'path': '$HOME/.skk/SKK-JISYO.L',
        \   'sorted': 1,
        \   'encoding': 'euc-jp',
        \}
    let g:eskk#server = {
    \	'host': 'localhost',
    \	'port':  1178,
    \	'type': 'notfound',
    \}
  endif
endif

let g:sql_type_default = 'pgsql'
let g:go_bin_path = $GOPATH.'/bin'

"----------- GUI -----------

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
" if !isdirectory(expand('$CACHE/vim/backup'))
    " call mkdir(expand('$CACHE/vim/backup'), 'p')
" endif

set helplang=en,ja
set directory=+~/.cache/vim/
set undodir=~/.cache/vim/undo
set backupdir=~/.cache/vim/backup
if !has('nvim')
  set viminfo+=n~/.cache/vim/viminfo
else
  set viminfo+=n~/.cache/vim/nviminfo
endif
set nobackup
set nowritebackup
" set backup
" set writebackup
set noswapfile
set undofile
set history=100
set undolevels=100

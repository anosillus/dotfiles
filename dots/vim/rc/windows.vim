"---------------------------------------------------------------------------
" For Windows:
"

" In Windows, can't find exe, when $PATH isn't contained $VIM.
if $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if !exists('g:colors_name') && !has('gui_running')
  colorscheme jellybeans
  set term=pcansi
  set t_Co=256
endif

let g:vimproc#download_windows_dll = 1
set runtimepath+=C:\Users\anosillus\AppData\Local\Microsoft\WindowsApps\python.exe
set pythonthreedll+=C:\Users\anosillus\AppData\Local\Programs\Python\Python38\python38.dll
let &pythonthreedll='C:\Users\anosillus\AppData\Local\Programs\Python\Python38\python38.dll'
let g:lsp_settings_servers_dir='C:\Users\anosillus\.config\vim-lsp-settings'
let g:pydocstring_doq_path='C:\Users\anosillus\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts\doq.exe'
let g:python3_host_prog = expand('C:\Users\anosillus\AppData\Local\Microsoft\WindowsApps\python.exe')
" let g:jasegment#cabocha#args = '-I0 -O2 -f1 -d C:\Tools\mecab-ipadic-neologd'
" to complile neologd in shift-jis is troublesome.
let g:jasegment#mecab#cmd='"C:/Program Files (x86)/MeCab/bin/mecab.exe"'
let g:jasegment#cabocha#cmd = '"C:/Program Files (x86)/CaboCha/bin/cabocha.exe"'
let g:jasegment#model = 'cabocha'

"---------------------------------------------------------------------------
" For Windows:
"

" In Windows, can't find exe, when $PATH isn't contained $VIM.
if $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

set runtimepath+=~\.vim

let g:vimproc#download_windows_dll = 1
set runtimepath+=C:\Users\anosillus\AppData\Local\Microsoft\WindowsApps\python.exe
set pythonthreedll+=C:\Users\anosillus\AppData\Local\Programs\Python\Python38\python38.dll
let &pythonthreedll='C:\Users\anosillus\AppData\Local\Programs\Python\Python38\python38.dll'
let g:lsp_settings_servers_dir='C:\Users\anosillus\.config\vim-lsp-settings'
let g:pydocstring_doq_path='C:\Users\anosillus\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts\doq.exe'
let g:ale_cs_mcsc_assemblies = [
      \ 'C:\Program Files\Unity\Hub\Editor\2018.4.29f1\Editor\Data\Managed\UnityEngine\UnityEngine.dll'
      \ ]
let g:python3_host_prog = expand('C:\Users\anosillus\AppData\Local\Microsoft\WindowsApps\python.exe')
" let g:jasegment#cabocha#args = '-I0 -O2 -f1 -d C:\Tools\mecab-ipadic-neologd'
" to complile neologd in shift-jis is troublesome.
let g:jasegment#mecab#cmd='"C:/Program Files (x86)/MeCab/bin/mecab.exe"'
let g:jasegment#cabocha#cmd = '"C:/Program Files (x86)/CaboCha/bin/cabocha.exe"'
let g:jasegment#model = 'cabocha'
let g:eskk#dictionary = {
\   'path': expand('$CACHE/skk-jisyo'),
\   'sorted': 0,
\   'encoding': 'utf-8'
\}
let g:eskk#large_dictionary = {
\   'path': '$HOME/.skk/SKK-JISYO.L',
\   'sorted': 1,
\   'encoding': 'euc-jp'
\}
let g:eskk#server = {
\   'host': 'localhost',
\   'port':  1178,
\   'type': 'notfound'
\}

if !exists('g:colors_name') && !has('gui_running')
  colorscheme jellybeans
  set term=pcansi
  set t_Co=256
endif

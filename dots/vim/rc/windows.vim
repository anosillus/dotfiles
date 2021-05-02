"---------------------------------------------------------------------------
" For Windows:
"
" In Windows, can't find exe, when $PATH isn't contained $VIM.
if $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

let g:vimproc#download_windows_dll = 1

" set runtimepath+=C:/Users/anosillus/scoop/apps/python/current
" set pythonthreedll=C:/Users/anosillus/scoop/apps/python/current/python39.dll
set pythonthreedll=C:/tools/python-3.7.9/python37.dll
" let &pythonthreedll="C:/tools/python-3.7.9/python37.dll"
set pythonthreehome=C:/tools/python-3.7.9/
let g:pydocstring_doq_path="C:tools\python-3.7.9\scripts\doq.exe"
" let g:ale_cs_nmcsc_assemblies = [
      "\ 'C:\Program Files\Unity\Hub\Editor\2018.4.29f1\Editor\Data\Managed\UnityEngine\UnityEngine.dll'

let g:python3_host_prog = expand('"C:/tools/python-3.7.9/python.exe"')
" let g:jasegment#cabocha#args = '-I0 -O2 -f1 -d C:\tools\mecab-ipadic-neologd'
" to complile neologd in shift-jis is troublesome.
let g:jasegment#mecab#cmd='"C:/Program Files (x86)/MeCab/bin/mecab.exe"'
let g:jasegment#cabocha#cmd = '"C:/Program Files (x86)/CaboCha/bin/cabocha.exe"'
" let g:jasegment#mecab#cmd = '"C:/Program Files/MeCab/bin/mecab.exe"'
let g:jasegment#model = 'cabocha'
" let g:jasegment#cabocha#enc = 'utf-8'
let g:eskk#dictionary = {
\   'path': expand('$CACHE/skk-jisyo'),
\   'sorted': 0,
\   'encoding': 'utf-8'
\}
" let g:eskk#large_dictionary = {
"\   'path': '$HOME/.skk/SKK-JISYO.L',
"\   'sorted': 1,
"\   'encoding': 'euc-jp'
"\}
let g:eskk#server = {
\   'host': 'localhost',
\   'port':  1178,
\}

if !exists('g:colors_name') && !has('gui_running')
  colorscheme jellybeans
  set term=pcansi
  set t_Co=256
endif

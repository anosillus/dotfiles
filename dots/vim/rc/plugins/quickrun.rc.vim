let g:quickrun_no_default_key_mappings = 1

let g:quickrun#config= {
\ '_': {
\   'runner': 'vimproc',
\   'runner/vimproc/updatetime' : 20,
\   'outpuutter/buffer/split' : ':votright 10sp',
\   'outputter/buffer/close_on_empty' : 1,
\   'outputter/error/error' : 'quickfix',
\   'outputter/error/success' : 'buffer',
\   'outputter' : 'error',
\   'hook/time/enable' : 1,
\   'tempfile'  : '%{tempname()}',
\   'args': '',
\   'exec': '%c %o %s %a',
\   'hook/extend_config/enable' : 1,
\   'hook/shebang/enable': has('win32') || has('win64'),
\   'hook/close_buffer/enable_empty_data' : 1,
\   'hook/close_buffer/enable_failure' : 1,
\   'hook/close_quickfix/enable_hook_loaded' : 1,
\   'hook/close_quickfix/enable_success' : 1,
\ },
\ 'awk': {
\   'exec': '%c %o -f %s %a',
\ },
\ 'cs': {
\   'type': executable('csc')  ? 'cs/csc'  :
\           executable('dmcs') ? 'cs/dmcs' :
\           executable('smcs') ? 'cs/smcs' :
\           executable('gmcs') ? 'cs/gmcs' :
\           executable('mcs')  ? 'cs/mcs' : '',
\ },
\ 'cs/csc': {
\   'command': 'csc',
\   'exec': ['%c /nologo /out:%s:p:r:gs?/?\\?.exe %s:gs?/?\\?', '%s:p:r.exe %a'],
\   'tempfile': '%{tempname()}.cs',
\   'hook/output_encode/encoding': '&termencoding',
\   'hook/sweep/files': ['%S:p:r.exe'],
\ },
\ 'cs/mcs': {
\   'command': 'mcs',
\   'exec': ['%c %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],
\   'tempfile': '%{tempname()}.cs',
\   'hook/sweep/files': ['%S:p:r.exe'],
\ },
\ 'cs/gmcs': {
\   'command': 'gmcs',
\   'exec': ['%c %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],
\   'tempfile': '%{tempname()}.cs',
\   'hook/sweep/files': ['%S:p:r.exe'],
\ },
\ 'cs/smcs': {
\   'command': 'smcs',
\   'exec': ['%c %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],
\   'tempfile': '%{tempname()}.cs',
\   'hook/sweep/files': ['%S:p:r.exe'],
\ },
\ 'cs/dmcs': {
\   'command': 'dmcs',
\   'exec': ['%c %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],
\   'tempfile': '%{tempname()}.cs',
\   'hook/sweep/files': ['%S:p:r.exe'],
\ },
\ 'cpp': {'type': 'cpp/gcc++17'},
\ 'cpp/gcc++17' : {
\   'command': 'g++',
\   'cmdopt' : '-std=c++17 -Wall --pedantic-error',
\ },
\ 'cpp/clang++17' : {
\   'command': 'clang++',
\   'cmdopt' : '-std=c++17 -Wall --pedantic-error',
\ },
\ 'go': {
\   'command': 'go',
\   'exec': '%c run %s:p:t %a',
\   'tempfile': '%{tempname()}.go',
\   'hook/output_encode/encoding': 'utf-8',
\   'hook/cd/directory': '%S:p:h',
\ },
\ 'html': {
\   'command': 'open',
\   'exec': '%c %s',
\   'outputter': 'browser'
\ },
\ 'java': {
\   'exec': ['javac %o %s', '%c %s:t:r %a'],
\   'hook/output_encode/encoding': '&termencoding',
\   'hook/sweep/files': '%S:p:r.class',
\ },
\ 'javascript': {
\   'type': executable('js') ? 'javascript/spidermonkey':
\           executable('d8') ? 'javascript/v8':
\           executable('node') ? 'javascript/nodejs':
\           executable('phantomjs') ? 'javascript/phantomjs':
\           executable('jrunscript') ? 'javascript/rhino':
\           executable('cscript') ? 'javascript/cscript': '',
\ },
\ 'javascript/cscript': {
\   'command': 'cscript',
\   'exec': '%c //e:jscript %o %s %a',
\   'cmdopt': '//Nologo',
\   'tempfile': '%{tempname()}.js',
\ },
\ 'javascript/rhino': {
\   'command': 'jrunscript',
\   'tempfile': '%{tempname()}.js',
\ },
\ 'javascript/spidermonkey': {
\   'command': 'js',
\   'tempfile': '%{tempname()}.js',
\ },
\ 'javascript/v8': {
\   'command': 'd8',
\   'tempfile': '%{tempname()}.js',
\ },
\ 'javascript/nodejs': {
\   'command': 'node',
\   'tempfile': '%{tempname()}.js',
\ },
\ 'javascript/phantomjs': {
\   'command': 'phantomjs',
\   'tempfile': '%{tempname()}.js',
\ },
\ 'jsx': {
\   'exec': '%c --run %o %s %a',
\   'hook/eval/template':
\     'class _Main { static function main(args : string[]) :void { %s }}',
\ },
\ 'lisp': {
\   'command': 'clisp',
\ },
\ 'lua': {},
\ 'markdown': {
\   'runner': 'shell',
\   'outputter': 'null',
\   'command': ':PrevimOpen',
\   'exec': '%c',
\ },
\ 'perl': {
\   'hook/eval/template': join([
\     'use Data::Dumper',
\     '\$Data::Dumper::Terse = 1',
\     '\$Data::Dumper::Indent = 0',
\     'print Dumper eval{%s}'], ';')
\ },
\ 'perl6': {'hook/eval/template': '{%s}().perl.print'},
\ 'python': {
\   'type': executable('/usr/bin/env/python') ? 'python/env':
\           executable('/usr/bin/python') ? 'python/base': ''
\ },
"\           executable('~/Anaconda3/python.exe') ? 'python/conda': 'python/windows'
\  'python/test': {
\    'command': 'py.test',
\    'cmdopt': '-v',
\ },
\  'python/base': {
\    'hook/eval/template': 'print(%s)',
\    'command': 'python'
\ },
\  'python/env': {
\    'hook/eval/template': 'print(%s)',
\    'command': 'python'
\ },
\  'python/windows': {
\    'command': 'python.exe',
\    'hook/shebang/enable': 0,
\    'exec': 'expand(%c) %s',
\ },
\  'python/conda': {
\    'command': '$HOME/Anaconda3/python.exe',
\ },
\ 'php': {},
\ 'r': {
\   'command': 'R',
\   'exec': '%c %o --no-save --slave %a < %s',
\ },
\ 'ruby': {'hook/eval/template': " p proc {\n%s\n}.call"},
\ 'scala': {
\   'cmdopt': '-Dfile.encoding=' . '&termencoding',
\   'hook/output_encode/encoding': '&termencoding',
\ },
\ 'typescript': {
\   'command': 'tsc',
\   'exec': ['%c --target esnext --module commonjs %o %s', 'node %s:r.js'],
\   'hook/sweep/files': ['%S:p:r.js'],
\   'tempfile': '%{tempname()}.ts',
\ },
\ 'vim': {
\   'command': ':source',
\   'exec': '%C %s',
\   'hook/eval/template': 'echo %s',
\   'runner': 'vimscript',
\ },
\ }

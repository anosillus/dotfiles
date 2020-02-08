scriptencoding utf-8

" {{{ plug list
"https://www.reddit.com/r/vim/comments/5ja0mn/vim_what_the_best_practice_to_sync_up_all_plugins/"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
set runtimepath^=$HOME/.vim
set runtimepath^=$HOME/.vim/syntax
call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim'
else
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deol.nvim'
Plug 'anosillus/vim-ipynb'
Plug 'rhysd/vim-grammarous'
let g:grammarous#disabled_rules = {
\ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
\ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
	\ }
Plug 'mopp/layoutplugin.vim', { 'on': 'LayoutPlugin'}
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'chemzqm/denite-git'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartinput'
Plug 'w0rp/ale'
Plug 'thinca/vim-ref'
let g:ref_no_default_key_mappings = 1
let g:ref_pydoc_cmd	 = 'python3 -m pydoc'
" let g:ref_pydoc_cmd = executable('python3') ? 'pydoc3' : ''
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = '1'
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_command = ''
let g:jedi#rename_command = ''
Plug 'maximbaz/lightline-ale'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-jp/autofmt'
Plug 'editorconfig/editorconfig-vim'
Plug 'haya14busa/is.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/vim-edgemotion'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'kana/vim-smartword'
Plug 'bkad/CamelCaseMotion'
Plug 'thinca/vim-quickrun'
Plug 'Yggdroot/indentLine'
Plug 'pbrisbin/vim-mkdir'
Plug 'liuchengxu/vista.vim'
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
Plug 'vim-scripts/autodate.vim'
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-submode'
Plug 'lambdalisue/gina.vim'
Plug 'sjl/gundo.vim'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown', 'cpp']
Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }
let g:cpp_named_requirements_highlight = 1
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
let g:markdown_enable_mappings = 0
let g:markdown_enable_spell_checking = 0
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries',  'for': 'golang' }
Plug 'junegunn/goyo.vim', {'for':'markdown'}
Plug 'ap/vim-css-color'
Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
Plug 'thinca/vim-template'
Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious', {'for' : ['toml','markdown', 'text']}
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']
Plug 'rhysd/vim-gfm-syntax',{ 'for': 'markdown.gfm' }
Plug 'tyru/caw.vim'
let g:caw_no_default_keymappings = 1
let g:caw_operator_keymappings = 0
Plug 'Shougo/neoyank.vim'
let g:neoyank#file = $HOME.'/.cache/yank/yankring.txt'
Plug 'vim-jp/syntax-vim-ex'
let g:niceblock_no_default_key_mappings = 1
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-user'
Plug 'tyru/eskk.vim'
Plug 'rhysd/accelerated-jk'
Plug 'machakann/vim-sandwich'
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-sources'
" Plug 'neoclide/coc-lists'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'honza/vim-snippets'

call plug#end()

" }}}

" let g:vimpyter_jupyter_notebook_flags = '--browser=vivaldi --port=8855'
" let g:vimpyter_view_directory = '$HOME/.vimpyter_views'

" SubMode {{{
call submode#enter_with('bufmove', 'n', '', '<C-g>h', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-g>i', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-g>n', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-g>e', '<C-w>-')
call submode#map('bufmove', 'n', '', 'h', '<C-w>>')
call submode#map('bufmove', 'n', '', 'i', '<C-w><')
call submode#map('bufmove', 'n', '', 'n', '<C-w>+')
call submode#map('bufmove', 'n', '', 'e', '<C-w>-')


call submode#enter_with('bufmove', 'n', '', '<C-g>y', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>')
call submode#enter_with('bufmove', 'n', '', '<C-g>u', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>')
call submode#enter_with('bufmove', 'n', '', '<C-g>Y', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>')
call submode#enter_with('bufmove', 'n', '', '<C-g>U', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>')

call submode#map('bufmove', 'n', '', 'y', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>')
call submode#map('bufmove', 'n', '', 'u', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>')
call submode#map('bufmove', 'n', '', 'U', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>')
call submode#map('bufmove', 'n', '', 'Y', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>')
" }}}

" Gundo {{{
let g:gundo_map_move_older = 'n'
let g:gundo_map_move_newer = 'e'
let g:gundo_prefer_python3 = 1
" }}}

" {{{ ALE
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1

let g:ale_linters_explicit = 1
let g:ale_dockerfile_hadolint_use_docker = 'always'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
"I use cica font."
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'
" let g:ale_cpp_clang_options = '-std=c++17 -Wall -I../includes'
" let g:ale_cpp_gcc_options = '-std=c++17 -Wall -I../includes'
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
let g:ale_c_clangformat_options = '-style=google'
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_javascript_eslint_options='-c google'
let g:ale_lint_on_insert_leave = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_black_options = '--line-length 79'
let g:ale_python_flake8_executable = 'python3'
" let g:ale_python_flake8_options = '-m flake8 --select=C,E,F,W,B901'
let g:ale_python_flake8_options = '-m flake8'


let g:ale_linters = {
\   'c':          ['clang'],
\   'cmake':      ['cmake'],
\   'cpp':        ['clang', 'g++', 'ccls'],
\   'dockerfile': ['hadolint'],
\   'css':        ['prettier', 'stylelint'],
\   'fish':       ['fish'],
\   'html':       ['prettier', 'htmlint', 'write-good', 'stylelint'],
\   'json':       ['eslint','prettier', 'jsonlint'],
\   'latex':      ['vale', 'textlint'],
\   'markdown':   ['markdownlint', 'prettier'],
\   'python':     ['pylama', 'black', 'flake8'],
\   'r':          ['lintr'],
\   'rust':       ['rustfmt'],
\   'sql':        ['sqlfmt'],
\   'text':       ['textlint', 'vale'],
\   'vim':        ['vint'],
\   'yaml':       ['yamlint']
\ }

let g:ale_fixers = {
\   'bash':       ['remove_trailing_lines', 'trim_whitespace', 'language-server', 'shellcheck'],
\   'c':          ['remove_trailing_lines', 'trim_whitespace', 'trim_whitespace', 'clang-format'],
\   'cpp':        ['remove_trailing_lines', 'trim_whitespace', 'trim_whitespace', 'clang-format'],
\   'css':        ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'stylelint'],
\   'dockerfile': ['remove_trailing_lines', 'trim_whitespace', 'hadolint'],
\   'fish':       ['remove_trailing_lines', 'trim_whitespace'],
\   'go':         ['remove_trailing_lines', 'trim_whitespace', 'gofmt'],
\   'html':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'stylelint'],
\   'javascript': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint', 'importjs','prettier-standard'],
\   'json':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'fixjson'],
\   'markdown':   ['remove_trailing_lines', 'prettier', 'textlint', 'vale'],
\   'python':     ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'black', 'reorder-python-imports'],
\   'r':          ['remove_trailing_lines', 'trim_whitespace', 'styler', 'litr'],
\   'rust':       ['remove_trailing_lines', 'trim_whitespace', 'rustfmt'],
\   'sh':         ['remove_trailing_lines', 'trim_whitespace', 'shfmt'],
\   'sql':        ['remove_trailing_lines', 'trim_whitespace', 'sqlfmt',],
\   'text':       ['remove_trailing_lines', 'prettier', 'textlint'],
\   'vim':        ['remove_trailing_lines', 'trim_whitespace'],
\   'xml':        ['remove_trailing_lines', 'trim_whitespace', 'xmllint'],
\   'yaml':       ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
\ }
highlight clear ALEErrorSign
highlight clear ALEWarningSign
"}}}

" EasyMotion {{{
let g:EasyMotion_do_mapping = 0

 " depends on vim-anzu and is.vim
" nnoremap <leader>k K
" set statusline=%{anzu#search_status()}

let g:EasyMotion_keys = 'neihdoarstdluyfwp;qj,.'
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:is#do_default_mappings=0
" }}}

" QuickRun{{{
let g:quickrun#config= {
\ '_': {
\   'runner': 'vimproc',
\   'runner/vimproc/updatetime' : 20,
\   'outpuutter/buffer/split' : ':votright 10sp',
\   'outputter/buffer/close_on_empty' : 1,
\   'hook/time/enable' : 1,
\   'tempfile'  : '%{tempname()}',
\   'args': '',
\   'exec': '%c %o %s %a',
\   'hook/extend_config/enable' : 1,
\   'hook/close_buffer/enable_empty_data' : 1,
\   'hook/close_buffer/enable_failure' : 1,
\   'hook/close_quickfix/enable_hook_loaded' : 1,
\   'hook/close_quickfix/enable_success' : 1,
\ },
\ 'awk': {
\   'exec': '%c %o -f %s %a',
\ },
\ 'bash': {},
\ 'clojure': {
\   'type': executable('jark') ? 'clojure/jark':
\           executable('clj') ? 'clojure/clj':
\           '',
\ },
\ 'clojure/jark': {
\   'command': 'jark',
\   'exec': '%c ns load %s',
\ },
\ 'clojure/clj': {
\   'command': 'clj',
\   'exec': '%c %s',
\ },
\ 'coffee': {},
\ 'cs': {
\   'type': executable('csc')  ? 'cs/csc'  :
\           executable('dmcs') ? 'cs/dmcs' :
\           executable('smcs') ? 'cs/smcs' :
\           executable('gmcs') ? 'cs/gmcs' :
\           executable('mcs') ? 'cs/mcs' : ''
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
\ 'd': {
\   'type':
\     executable('rdmd')           ? 'd/rdmd' :
\     executable('ldc')            ? 'd/ldc' :
\     executable('gdc')            ? 'd/gdc' : '',
\ },
\ 'd/rdmd': {
\   'command': 'rdmd',
\   'tempfile': '%{tempname()}.d',
\ },
\ 'd/ldc': {
\   'command': 'ldc',
\   'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\   'tempfile': '%{tempname()}.d',
\   'hook/sweep/files': ['%S:p:r'],
\ },
\ 'd/gdc': {
\   'command': 'gdc',
\   'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\   'tempfile': '%{tempname()}.d',
\   'hook/sweep/files': ['%S:p:r'],
\ },
\ 'dosbatch': {
\   'command': '',
\   'exec': 'call %s %a',
\   'tempfile': '%{tempname()}.bat',
\ },
\ 'dart': {
\   'type':
\     executable('dart') ? 'dart/dart/checked':
\   '',
\ },
\ 'dart/dart/checked': {
\   'command': 'dart',
\   'cmdopt': '--enable-type-checks',
\   'tempfile': '%{tempname()}.dart',
\ },
\ 'dart/dart/production': {
\   'command': 'dart',
\   'tempfile': '%{tempname()}.dart',
\ },
\ 'erlang': {
\   'command': 'escript',
\ },
\ 'eruby': {
\   'command': 'erb',
\   'exec': '%c %o -T - %s %a',
\ },
\ 'fortran': {
\   'type': 'fortran/gfortran',
\ },
\ 'fortran/gfortran': {
\   'command': 'gfortran',
\   'exec': ['%c %o -o %s:p:r %s', '%s:p:r %a'],
\   'tempfile': '%{tempname()}.f95',
\   'hook/sweep/files': ['%S:p:r'],
\ },
\ 'go': {
\   'command': 'go',
\   'exec': '%c run %s:p:t %a',
\   'tempfile': '%{tempname()}.go',
\   'hook/output_encode/encoding': 'utf-8',
\   'hook/cd/directory': '%S:p:h',
\ },
\ 'groovy': {
\   'cmdopt': '-c %{&fenc==#""?&enc:&fenc}'
\ },
\ 'haskell': {'type': 'haskell/runghc'},
\ 'haskell/runghc': {
\   'command': 'runghc',
\   'tempfile': '%{tempname()}.hs',
\   'hook/eval/template': 'main = print \$ %s',
\ },
\ 'haskell/ghc': {
\   'command': 'ghc',
\   'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\   'cmdopt': '-v0 --make',
\   'tempfile': '%{tempname()}.hs',
\   'hook/sweep/files': ['%S:p:r', '%S:p:r.o', '%S:p:r.hi'],
\ },
\ 'haskell/ghc/core': {
\   'command': 'ghc',
\   'exec': '%c %o -ddump-simpl -dsuppress-coercions %s',
\   'cmdopt': '-v0 --make',
\   'tempfile': '%{tempname()}.hs',
\   'hook/sweep/files': ['%S:p:r', '%S:p:r.o', '%S:p:r.hi'],
\ },
\ 'html': {
\   'command' : ':gnome-open',
\   'outputter/browser' : 1,
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
\    'hook/eval/template': 'print(%s)',
\    'command': 'python3'
\ },
\ 'php': {},
\ 'r': {
\   'command': 'R',
\   'exec': '%c %o --no-save --slave %a < %s',
\ },
\ 'ruby': {'hook/eval/template': " p proc {\n%s\n}.call"},
\ 'scala': {
\   'cmdopt': '-Dfile.encoding=' . &termencoding,
\   'hook/output_encode/encoding': '&termencoding',
\ },
\ 'scheme': {
\   'type': executable('gosh')     ? 'scheme/gauche':
\           executable('mzscheme') ? 'scheme/mzscheme': '',
\ },
\ 'scheme/gauche': {
\   'command': 'gosh',
\   'exec': '%c %o %s:p %a',
\   'hook/eval/template': '(display (begin %s))',
\ },
\ 'scheme/mzscheme': {
\   'command': 'mzscheme',
\   'exec': '%c %o -f %s %a',
\ },
\ 'sed': {},
\ 'sh': {},
\ 'typescript': {
\   'command': 'tsc',
\   'cmdopt': '--exec',
\   'tempfile': '%{tempname()}.ts',
\ },
\ 'vim': {
\   'command': ':source',
\   'exec': '%C %s',
\   'hook/eval/template': 'echo %s',
\   'runner': 'vimscript',
\ },
\ 'wsh': {
\   'command': 'cscript',
\   'cmdopt': '//Nologo',
\   'hook/output_encode/encoding': '&termencoding',
\ },
\ 'zsh': {},
\ }

let g:quickrun_no_default_key_mappings = 1
"}}}
"
" ESKK {{{
set imdisable
let g:eskk#server = {'host': 'localhost','port': 55100}
let g:eskk#select_cand_keys = 'arshnei'
let g:eskk#no_default_mappings = 1
let g:eskk#enable_completion = 1
let g:eskk#keep_state = 0
let g:eskk#statusline_mode_strings = {
	\	'hira': 'あ',
	\	'kata': 'ア',
	\	'ascii': 'aA',
	\	'zenei': 'ａ',
	\	'hankata': 'ｧｱ',
	\	'abbrev': 'aあ'
	\}
"let g:eskk#debug = 0
let g:eskk#show_annotation = 1
let g:eskk#rom_input_style = 'msime'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#tab_select_completion = 1
let g:eskk#start_completion_length = 2
let g:eskk#marker_henkan = '<>'
let g:eskk#marker_henkan_select = '>>'

let g:jasentence_endpat = '[。．？！]\+'


augroup skk
  autocmd!
  autocmd User eskk-enable-post call s:eskk_enable_post()
  function! s:eskk_enable_post()
      EskkMap -force <S-Space> <ESC>
  endfunction

  autocmd User eskk-initialize-pre call s:eskk_initial_pre()
  function! s:eskk_initial_pre()
    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
    call t.add_map('~', '～')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('tm', '™')
    call t.add_map('z ', '　')
    " "1." のように数字の後のドットはそのまま入力
    for n in range(10)
      call t.add_map(n . '.', n . '.')
    endfor
    call eskk#register_mode_table('hira', t)
  endfunction
augroup END

 let g:eskk#cursor_color = {
  \   'ascii': ['#8b8b83', '#bebebe'],
  \   'hira': ['#8b3e2f', '#ffc0cb'],
  \   'kata': ['#228b22', '#00ff00'],
  \   'abbrev': '#4169e1',
  \   'zenei': '#ffd700',
\}
 " }}}

" COC {{{
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=10000
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <C-Space>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-e>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
 inoremap <silent><expr> <s-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
 " }}}

" Lightline {{{
let g:lightline = {
\   'colorscheme': 'jellybeans',
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [ ['mode', 'paste'],
\               ['ale', 'anzu', 'cocstatus', 'currentfunction', 'fugitive', 'readonly', 'filename', 'qfstatusline', 'modified', 'method'] ],
\     'right':[ ['lineinfo'],['percent'],['fileformat', 'fileencoding', 'filetype'],
\               ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'] ],
\   },
\   'component_function': {
\     'ale':             'ALEGetStatusLine',
\     'anzu':            'anzu#search_status',
\     'cocstatus':       'coc#status',
\     'method':          'NearestMethodOrFunction',
\     'currentfunction': 'CocCurrentFunction',
\     'fileencoding':    'LightlineFileencoding',
\     'fileformat':      'LightlineFileformat',
\     'filename':        'LightlineFilename',
\     'filetype':        'LightlineFiletype',
\     'fugitive':        'LightlineFugitive',
\     'mode':            'LightlineMode',
\     'modified':        'LightlineModified',
\     'readonly':        'LightlineReadonly',
\   },
\   'component_expand': {
\     'linter_checking': 'lightline#ale#checking',
\     'linter_warnings': 'lightline#ale#warnings',
\     'linter_errors':   'lightline#ale#errors',
\     'linter_ok':       'lightline#ale#ok'
\   },
\   'component_type':    {
\     'qfstatusline':    'error',
\     'linter_checking': 'left',
\     'linter_warnings': 'warning',
\     'linter_errors':   'error',
\     'linter_ok':       'left'
\   }
\ }

let g:Qfstatusline#UpdateCmd = function('lightline#update')
let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_warnings = 'W'
let g:lightline#ale#indicator_errors = 'E'
let g:lightline#ale#indicator_ok = 'OK'
let g:lightline#ale#indicator_ok = "\uf00c"

call denite#custom#option('default', 'statusline', v:false)

function! LightlineFilename()
  return &filetype =~? 'NERD_tree' ? 'NERD' :
      \ &filetype ==? 'unite'     ? unite#get_status_string() :
      \ &filetype ==? 'denite'    ? substitute(denite#get_status('buffer_name'), '-\\| ', '', 'g'):
      \ ('' !=? &filetype ? &filetype : '[No Name]')
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineModified()
  return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" }}}

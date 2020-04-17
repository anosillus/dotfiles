scriptencoding utf-8

" -----------------------------------------------------------------------
" VimPlug {{{
" Base Settings {{{
"https://www.reddit.com/r/vim/comments/5ja0mn/vim_what_the_best_practice_to_sync_up_all_plugins/"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

set runtimepath^=$HOME/.vim
set runtimepath^=$HOME/.vim/syntax
call plug#begin('~/.vim/plugged')
" }}}

" ShougoWare {{{

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim'
else
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/unite.vim'
Plug 'Shougo/deol.nvim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'chemzqm/denite-git'
Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious', {'for' : ['toml','markdown', 'text']}
Plug 'Shougo/neoyank.vim'
let g:neoyank#file = $HOME.'/.cache/yank/yankring.txt'

" }}}

" MyPlugin {{{
Plug 'anosillus/vim-ipynb'
Plug 'anosillus/caw.vim'
" Plug 'anosillus/toggl.vim'
" Plug 'anosillus/vim-toggl'

let g:caw_no_default_keymappings = 1
let g:caw_operator_keymappings = 0

" }}}

" PlugMaker {{{
" Plug 'mopp/layoutplugin.vim', { 'on': 'LayoutPlugin'}
" }}}

" Language {{{
" Common {{{
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown', 'cpp']
Plug 'vim-jp/syntax-vim-ex'
Plug 'thinca/vim-ref'
let g:ref_no_default_key_mappings = 1
let g:ref_man_lang = 'ja'
let g:ref_pydoc_cmd	 = 'python3 -m pydoc'
" let g:ref_pydoc_cmd = executable('python3') ? 'pydoc3' : ''
" }}}
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']


" Python {{{
" Plug 'numirias/semshi'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = '1'
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_command = ''
let g:jedi#rename_command = ''
Plug 'heavenshell/vim-pydocstring'
let g:pydocstring_doq_path = $HOME.'/.local/bin/doq'
Plug 'szkny/Ipython'
Plug 'szkny/SplitTerm'
Plug 'tmhedberg/SimpylFold'
" }}}

" CSV, Table {{{
Plug 'chrisbra/csv.vim', { 'for' : 'csv' }
let g:csv_nomap_cr = 1
" Plug 'dhruvasagar/vim-table-mode'
" let g:table_mode_map_prefix	= '<leader><del>'
Plug 'mattn/vim-maketable'
" }}}

" CPP {{{
Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }
let g:cpp_named_requirements_highlight = 1
" }}}

" Markdown {{{
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
let g:markdown_enable_mappings = 0
let g:markdown_enable_spell_checking = 0
Plug 'junegunn/goyo.vim', {'for':'markdown'}
Plug 'rhysd/vim-gfm-syntax',{ 'for': 'markdown.gfm' }
" }}}

" Web {{{
Plug 'ap/vim-css-color'
" }}}

" Golang {{{
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries',  'for': 'golang' }
" }}}
" }}}

" View {{{
Plug 'chrisbra/vim-diff-enhanced'
if &diff
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'markonm/traces.vim'
" }}}

" Motion {{{
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/is.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/vim-edgemotion'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-migemo.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'kana/vim-smartword'
Plug 'bkad/CamelCaseMotion'
Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
Plug 'kana/vim-niceblock'
let g:niceblock_no_default_key_mappings = 1
Plug 'rhysd/accelerated-jk'
" }}}

" TextObj {{{
Plug 'kana/vim-operator-user'
Plug 'machakann/vim-sandwich'
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1
" let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
" }}}

" Japanese {{{
Plug 'deton/eblook.vim'
let eblook_no_default_key_mappings = 1
Plug 'vim-jp/vimdoc-ja'
" Plug 'vim-jp/autofmt'
" set formatexpr=autofmt#japanese#formatexpr()
Plug 'deton/jasegment.vim'
let b:loaded_jasegment = 1
let g:jasegment_no_default_key_mappings = 1
let g:jasegment#model = 'mecab'
let g:jasegment#mecab#args = '-Owakati -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd/'
Plug 'tyru/eskk.vim'
let g:eskk#no_default_mappings = 0
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 0
"Plug 'ueokande/popupdict.vim'
" }}}

" Config {{{
" Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/autodate.vim'
Plug 'kana/vim-smartinput'
Plug 'thinca/vim-template'
Plug 'thinca/vim-ft-help_fold'
Plug 'vim-jp/vital.vim'
Plug 'Konfekt/FastFold'
let g:fastfold_savehook = 1
let g:fastfold_fdmhook = 0
let g:fastfold_fold_movement_commands = [']m', '[m', 'm', 'mk']
" }}}

" Command {{{
Plug 'thinca/vim-quickrun'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'liuchengxu/vista.vim'
Plug 'lambdalisue/gina.vim'
Plug 'sjl/gundo.vim'
Plug 'kana/vim-submode'
Plug 'mattn/emmet-vim'
Plug 'previm/previm'
Plug 'azadkuh/vim-cmus'
Plug 'skanehira/translate.vim'
let g:translate_source = 'en'
let g:translate_target = 'ja'
let g:translate_winsize = 10
" }}}

" Coc {{{
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-sources'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neco-vim'
Plug 'SirVer/ultisnips'
" Plug 'iamcco/coc-vimlsp'
" Plug 'jamcco/coc-spell-checker'
" Plug 'josa42/coc-docker'
" Plug 'neoclide/coc-denite'
" Plug 'neoclide/coc-git'
" Plug 'neoclide/coc-lists'
" Plug 'neoclide/coc-neco'
" Plug 'neoclide/coc-python'
" Plug 'neoclide/coc-r-lsp'
" Plug 'neoclide/coc-rls'
" css, html, yaml
" Plug 'neoclide/coc-snippets'
" Plug 'neoclide/coc-sources'
" Plug 'neoclide/coc-tabnine'
" Plug 'neoclide/coc-yaml'
" Plug 'weirongxu/coc-explorer'
" coc-ccls
" coc-go
" Plug 'honza/vim-snippets'
" }}}

call plug#end()
" }}}
" -----------------------------------------------------------------------

" Emment {{{
let g:user_emmet_install_global = 1
let g:user_emmet_mode='vn'
let g:user_emmet_leader_key='<C-j>'
" }}}

" SubMode {{{
call submode#enter_with('bufmove', 'n', '', '<C-g>h', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-g>i', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-g>n', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-g>e', '<C-w>-')
call submode#enter_with('bufmove', 'n', '', '<C-g>H', '<C-w>H')
call submode#enter_with('bufmove', 'n', '', '<C-g>I', '<C-w>L')
call submode#enter_with('bufmove', 'n', '', '<C-g>N', '<C-w>J')
call submode#enter_with('bufmove', 'n', '', '<C-g>E', '<C-w>K')
call submode#enter_with('bufmove', 'n', '', '<C-g>O', '<C-w>r')

call submode#map('bufmove', 'n', '', 'h', '<C-w>>')
call submode#map('bufmove', 'n', '', 'i', '<C-w><')
call submode#map('bufmove', 'n', '', 'n', '<C-w>+')
call submode#map('bufmove', 'n', '', 'e', '<C-w>-')
call submode#map('bufmove', 'n', '', 'H', '<C-w>H')
call submode#map('bufmove', 'n', '', 'I', '<C-w>L')
call submode#map('bufmove', 'n', '', 'N', '<C-w>J')
call submode#map('bufmove', 'n', '', 'E', '<C-w>K')
call submode#map('bufmove', 'n', '', 'O', '<C-w>r')

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
let g:ale_dockerfile_hadolint_use_docker = 'yes'
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
" let g:ale_vim_vint_executable = '$HOME/.local/bin/vint'
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
let g:ale_python_pylama_options = '--linters pycodestyle pydocstyle Mccabe Pylint'
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --select=C,E,F,W,B901'
" let g:ale_python_flake8_options = '-m flake8'

let g:ale_linter_aliases = {'gitcommit': ['gitcommit', 'text']}

let g:ale_linters = {
\   'c':          ['clang'],
\   'cmake':      ['cmake'],
\   'cpp':        ['clang', 'g++', 'ccls'],
\   'css':        ['prettier', 'stylelint'],
\   'Dockerfile': ['hadolint'],
\   'fish':       ['fish'],
\   'gitcommit':  ['gitlint', 'textlint', 'write-good'],
\   'html':       ['prettier', 'htmlint', 'write-good', 'stylelint'],
\   'java':       ['checkstyle'],
\   'typescript': ['eslint'],
\   'json':       ['eslint','prettier', 'jsonlint'],
\   'latex':      ['vale', 'textlint'],
\   'markdown':   ['markdownlint', 'prettier'],
\   'python':     ['pylama', 'black', 'flake8'],
\   'r':          ['lintr'],
\   'rust':       ['rustfmt'],
\   'sql':        ['sqlfmt'],
\   'text':       ['textlint', 'proselint', 'writegood'],
\   'vim':        ['vint'],
\   'yaml':       ['yamlint']
\ }
" Vale is too fast.

let g:ale_fixers = {
\   'bash':       ['remove_trailing_lines', 'trim_whitespace', 'language-server', 'shellcheck'],
\   'c':          ['remove_trailing_lines', 'trim_whitespace', 'trim_whitespace', 'clang-format'],
\   'cpp':        ['remove_trailing_lines', 'trim_whitespace', 'trim_whitespace', 'clang-format'],
\   'css':        ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'stylelint'],
\   'Dockerfile': ['remove_trailing_lines', 'trim_whitespace'],
\   'fish':       ['remove_trailing_lines', 'trim_whitespace'],
\   'go':         ['remove_trailing_lines', 'trim_whitespace', 'gofmt'],
\   'html':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'stylelint'],
\   'javascript': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint', 'importjs','prettier-standard'],
\   'typescript': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint'],
\   'java':       ['remove_trailing_lines', 'trim_whitespace'],
\   'json':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'fixjson'],
\   'markdown':   ['remove_trailing_lines', 'prettier', 'textlint'],
\   'python':     ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'black', 'reorder-python-imports'],
\   'r':          ['remove_trailing_lines', 'trim_whitespace', 'styler'],
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
let g:EasyMotion_keys = 'neihdoarstdluyfwp;qj,.'
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_use_smartsign_us = 1
let g:is#do_default_mappings=0
" }}}

" Defx (Todo){{{
" nnoremap <silent>   [Space]p
" \ :<C-u>Defx -listed -resume -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent><buffer><expr> <CR>
" \ defx#async_action('drop')
" nnoremap <silent><buffer><expr> c
" \ defx#do_action('copy')nnoremap <silent><buffer><expr> !
" \ defx#do_action('execute_command')
" nnoremap <silent><buffer><expr> m
" \ defx#do_action('move')
" nnoremap <silent><buffer><expr> p
" \ defx#do_action('paste')
" nnoremap <silent><buffer><expr> l
" \ defx#async_action('open')
" nnoremap <silent><buffer><expr> E
" \ defx#do_action('open', 'vsplit')
" nnoremap <silent><buffer><expr> <CR>
" \ defx#do_action('open', 'vsplit')
"
" nnoremap <silent><buffer><expr> P
" \ defx#do_action('open', 'pedit')
" nnoremap <silent><buffer><expr> K
" \ defx#do_action('new_directory')
" nnoremap <silent><buffer><expr> N
" \ defx#do_action('new_file')
" nnoremap <silent><buffer><expr> M
" \ defx#do_action('new_multiple_files')
" nnoremap <silent><buffer><expr> d
" \ defx#do_action('remove_trash')
" nnoremap <silent><buffer><expr> r
" \ defx#do_action('rename')
" nnoremap <silent><buffer><expr> x
" \ defx#do_action('execute_system')
" nnoremap <silent><buffer><expr> >
" \ defx#do_action('toggle_ignored_files')
" nnoremap <silent><buffer><expr> .
" \ defx#do_action('repeat')
" nnoremap <silent><buffer><expr> yy
" \ defx#do_action('yank_path')
" nnoremap <silent><buffer><expr> h
" \ defx#do_action('cd', ['..'])
" nnoremap <silent><buffer><expr> ~
" \ defx#do_action('cd')
" nnoremap <silent><buffer><expr> \
" \ defx#do_action('cd', getcwd())
" nnoremap <silent><buffer><expr> q
" \ defx#do_action('quit')
" nnoremap <silent><buffer><expr> <Space>
" \ defx#do_action('toggle_select') . 'j'
" nnoremap <silent><buffer><expr> *
" \ defx#do_action('toggle_select_all')
" nnoremap <silent><buffer><expr> j
" \ line('.') == line('$') ? 'gg' : 'j'
" nnoremap <silent><buffer><expr> k
" \ line('.') == 1 ? 'G' : 'k'
" nnoremap <silent><buffer><expr> <C-l>
" \ defx#do_action('redraw')
" nnoremap <silent><buffer><expr> <C-g>
" \ defx#do_action('print')
" nnoremap <silent><buffer><expr> <Tab> winnr('$') != 1 ?
" \ ':<C-u>wincmd w<CR>' :
" \ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'
" " }}}
" Don't work

" QuickRun{{{
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
\   'hook/close_buffer/enable_empty_data' : 1,
\   'hook/close_buffer/enable_failure' : 1,
\   'hook/close_quickfix/enable_hook_loaded' : 1,
\   'hook/close_quickfix/enable_success' : 1,
\ },
\ 'awk': {
\   'exec': '%c %o -f %s %a',
\ },
\ 'bash': {},
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
let g:quickrun_no_default_key_mappings = 1
"}}}

" Ipython {{{
let g:ipython_startup_options = ['--no-confirm-exit']
let g:ipython_startup_command = [
\  'from pylab import *',
\  'import pandas as pd',
\  'import numpy as np',
\  'import tqdm',
\  'from collections import *',
\  'pd.options.display.max_rows = 10',
\  'pd.options.display.max_columns = 10',
\  'pd.options.display.precision = 3'
\]

let g:ipython_window_width = 0"
" }}}

" Vista {{{
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\ 'func':           "\Uff794",
\ 'function':       "\Uff794",
\ 'functions':      "\Uff794",
\ 'var':            "\Uff71b",
\ 'variable':       "\Uff71b",
\ 'variables':      "\Uff71b",
\ 'const':          "\Uff8ff",
\ 'constant':       "\Uff8ff",
\ 'method':         "\Uff6a6",
\ 'package':        "\Ufe612",
\ 'packages':       "\Ufe612",
\ 'enum':           "\Uff435",
\ 'enumerator':     "\Uff435",
\ 'module':         "\Uff668",
\ 'modules':        "\Uff668",
\ 'type':           "\Ufe22b",
\ 'typedef':        "\Ufe22b",
\ 'types':          "\Ufe22b",
\ 'field':          "\Uff93d",
\ 'fields':         "\Uff93d",
\ 'macro':          "\Uff8a3",
\ 'macros':         "\Uff8a3",
\ 'map':            "\Uffb44",
\ 'class':          "\Uff9a9",
\ 'augroup':        "\Uffb44",
\ 'struct':         "\Uffb44",
\ 'union':          "\Uffacd",
\ 'member':         "\Uff02b",
\ 'target':         "\Uff893",
\ 'property':       "\Uffab6",
\ 'interface':      "\Uffa52",
\ 'namespace':      "\Uff475",
\ 'subroutine':     "\Uff915",
\ 'implementation': "\Uff87a",
\ 'typeParameter':  "\Uff278",
\ 'default':        "\Uff29c"
\ }
" }}}

" ESKK {{{
set imdisable
let g:eskk#server = {'host': 'localhost','port': 55100}
let g:eskk#select_cand_keys = 'arshnei'
let g:eskk#no_default_mappings = 1
let g:eskk#enable_completion = 1
let g:eskk#keep_state = 1
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
" let g:eskk#rom_input_style = 'msime'
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
    let g:skk_keep_state = 1
    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
    call t.add_map('~', '～')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('tm', '™')
    call t.add_map('z ', '　')
    call t.add_map('z1', '①')
    call t.add_map('z2', '②')
    call t.add_map('z3', '③')
    call t.add_map('z4', '④')
    call t.add_map('z5', '⑤')
    call t.add_map('z6', '⑥')
    call t.add_map('z7', '⑦')
    call t.add_map('z8', '⑧')
    call t.add_map('z9', '⑨')
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

autocmd User eskk-enable-pre call s:eskk_enable_pre()
function! s:eskk_enable_pre()
    call deoplete#enable()
    inoremap <expr><C-o> deoplete#auto_complete()
    inoremap <expr><C-i> deoplete#smart_close_popup()."\<C-o>"
    inoremap <expr><C-h> deoplete#undo_completion()
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  endfunction


" autocmd User  eskk-disable-post call s:eskk_disable()
" function! s:eskk_disable()
  " call deoplete#disable()
" endfunction

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
\               ['ale', 'anzu', 'cocstatus', 'currentfunction',  'readonly', 'filename', 'qfstatusline', 'modified'],
\               ['method']],
\     'right':[ ['lineinfo'],[ 'percent'],
\               ['fileformat', 'fileencoding', 'filetype'],
\               ['blame'],
\               ['gitbranch', 'gitstage'],
\               ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
\               ['toggl_task', 'toggl_time']],
\   },
\   'component_function': {
\     'ale':             'ALEGetStatusLine',
\     'anzu':            'anzu#search_status',
\     'cocstatus':       'coc#status',
\     'method':          'NearestMethodOrFunction',
\     'currentfunction': 'CocCurrentFunction',
\     'fileencoding':    'LightlineFileencoding',
\     'fileformat':      'LightlineFileformat',
\     'filetype':        'LightlineFiletype',
\     'blame':           'LightlineGitBlame',
\     'mode':            'LightlineMode',
\     'modified':        'LightlineModified',
\     'readonly':        'LightlineReadonly',
\     'gitbranch': 'gina#component#repo#branch',
\     'gitstage':  'gina#component#status#staged',
\     'component_function': {
\     'toggl_task': 'toggl#task',
\     'toggl_time': 'toggl#time'
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
\     'linter_ok':       'left',
\   }
\ }
\}

let g:Qfstatusline#UpdateCmd = function('lightline#update')
let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_warnings = 'W'
let g:lightline#ale#indicator_errors = 'E'
let g:lightline#ale#indicator_ok = 'OK'
let g:lightline#ale#indicator_ok = "\uf00c"

call denite#custom#option('default', 'statusline', v:false)

" function! LightlineFilename()
"   return &filetype =~? 'NERD_tree' ? 'NERD' :
"       \ &filetype ==? 'unite'     ? unite#get_status_string() :
"       \ &filetype ==? 'denite'    ? substitute(denite#get_status('buffer_name'), '-\\| ', '', 'g'):
"       \ ('' !=? &filetype ? &filetype : '[No Name]')
" endfunction


" let staged = 	  let unstaged = gina#component#status#unstaged()
	  " let conflicted = gina#component#status#conflicted()


function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  return winwidth(0) > 120 ? blame : ''
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

" Dicts {{{
let eblook_dictlist1 = [
  \{
    \'book': '/home/anosillus/Documents/epwing/koujien',
    \'name': 'kojien',
    \'title': '広辞苑第五版',
  \}
\]
" }}}

" let winid = popup_create("hello gorilla", {})
" vim: foldmethod=marker

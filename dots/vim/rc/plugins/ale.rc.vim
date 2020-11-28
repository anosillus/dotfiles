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
\   'cpp':        ['clang-format', 'clangtidy', 'g++', 'ccls'],
\   'cs':         ['mcsc'],
\   'css':        ['prettier', 'stylelint'],
\   'Dockerfile': ['hadolint'],
\   'fish':       ['fish'],
\   'gitcommit':  ['gitlint', 'textlint', 'write-good'],
\   'html':       ['prettier', 'htmlint', 'write-good', 'stylelint'],
\   'java':       ['checkstyle'],
\   'typescript': ['eslint'],
\   'json':       ['eslint','prettier', 'jsonlint'],
\   'latex':      ['vale', 'textlint'],
\   'markdown':   ['markdownlint', 'prettier', 'textlint'],
\   'python':     ['pylama', 'black', 'flake8','mypy'],
\   'r':          ['lintr'],
\   'rust':       ['rustfmt'],
\   'sql':        ['sqlfmt'],
\   'text':       ['textlint', 'proselint', 'writegood'],
\   'vim':        ['vint'],
\   'yaml':       ['yamlint']
\ }
" Vale is too fast for human.

let g:ale_fixers = {
\   'bash':       ['remove_trailing_lines', 'trim_whitespace', 'language-server', 'shellcheck'],
\   'c':          ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp':        ['remove_trailing_lines', 'trim_whitespace'],
\   'cs':         ['remove_trailing_lines', 'trim_whitespace'],
\   'css':        ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'stylelint'],
\   'Dockerfile': ['remove_trailing_lines', 'trim_whitespace'],
\   'fish':       ['remove_trailing_lines', 'trim_whitespace'],
\   'go':         ['remove_trailing_lines', 'trim_whitespace', 'gofmt'],
\   'html':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'stylelint'],
\   'javascript': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint', 'importjs','prettier-standard'],
\   'typescript': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint'],
\   'java':       ['remove_trailing_lines', 'trim_whitespace'],
\   'json':       ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'fixjson'],
\   'markdown':   ['remove_trailing_lines', 'prettier'],
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

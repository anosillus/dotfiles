let g:lightline = {
\   'colorscheme': 'jellybeans',
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [ ['mode', 'paste'],
\               ['pyenv'],
\               ['ale', 'anzu', 'currentfunction',  'readonly', 'filename', 'qfstatusline', 'modified'],
\               ['method']],
\     'right':[ ['lineinfo'],[ 'percent'],
\               ['fileformat', 'fileencoding', 'filetype'],
\               ['blame'],
\               ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
\               ['toggl_task', 'toggl_time']],
\   },
\   'component_function': {
\     'ale':             'ALEGetStatusLine',
\     'anzu':            'anzu#search_status',
\     'method':          'NearestMethodOrFunction',
\     'fileencoding':    'LightlineFileencoding',
\     'fileformat':      'LightlineFileformat',
\     'filetype':        'LightlineFiletype',
\     'mode':            'LightlineMode',
\     'modified':        'LightlineModified',
\     'readonly':        'LightlineReadonly',
\     'toggl_task': 'toggl#task',
\     'toggl_time': 'toggl#time',
\     'pyenv': 'pyenv#statusline#component'
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
\   },
\ }

"\     'gitbranch': 'gina#component#repo#branch',
"\     'gitstage':  'gina#component#status#staged',
"\               ['gitbranch', 'gitstage'],

let g:Qfstatusline#UpdateCmd = function('lightline#update')
let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_warnings = 'W'
let g:lightline#ale#indicator_errors = 'E'
let g:lightline#ale#indicator_ok = 'OK'
let g:lightline#ale#indicator_ok = "\uf00c"

" let staged = 	  let unstaged = gina#component#status#unstaged()
" let conflicted = gina#component#status#conflicted()


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
  return winwidth(0) > 60 ? (lightline#mode() . (exists('g:loaded_eskk') && eskk#is_enabled() ? eskk#statusline('(%s)') : '')) : ''
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

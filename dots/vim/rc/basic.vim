scriptencoding=utf8

" ---------- Basic Option ----------
" setl number
setl wrap
setl showmatch
set matchpairs+=<:>
setl matchtime=1
setl list
setl listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set formatoptions+=mM
set foldmethod=marker
" ---------- Command/Status Line ----------
setl ruler
setl laststatus=2
setl cmdheight=2
setl showcmd
" ---------- Search ----------
setl hlsearch
setl incsearch
setl ignorecase
setl smartcase
setl nowrapscan
setl showmatch

set wildmode=longest,list
set wildignore&
set wildignore=.git,.hg,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.out,*.class
set wildignore+=*.swp,*.swo,*.swn
set wildignore+=*.DS_Store
" ---------- Move ----------
setl backspace=indent,eol,start
setl whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
setl scrolloff=3
setl sidescrolloff=16
setl sidescroll=1
set shiftround

" ---------- File setlting ----------
setl hidden
setl t_Co=256
setl imdisable
setl autoread

" ---------- help ----------
" setl helpheight=999
set keywordprg=:help
set helplang& helplang=en,ja

" ---------- OS/JP setting ----------
setl mouse=a
setl shellslash
set virtualedit& virtualedit+=block

" ---------- Enocode ----------
setl fileformats=unix,dos,mac
setl fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
" language mes en_US.utf8

" ---------- Bell Off ----------
setl visualbell t_vb=
setl noerrorbells

" ---------- Japanese Input ----------
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

set ambiwidth=double
set formatoptions+=mM

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode ==# 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

set formatexpr=autofmt#japanese#formatexpr()
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

function! s:GetHighlight(hi)
  redir => l:hl
  exec 'highlight '.a:hi
  redir END
  let l:hl = substitute(l:hl, '[\r\n]', '', 'g')
  let l:hl = substitute(l:hl, 'xxx', '', '')
  return l:hl
endfunction

" ZEN-KAKU
" Display zenkaku-space
augroup hilight-idegraphic-space
  autocmd!
  autocmd VimEnter,ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd WinEnter * match IdeographicSpace /　/
  autocmd VimEnter,ColorScheme * call <SID>hl_trailing_spaces()
  autocmd VimEnter,ColorScheme * call <SID>hl_zenkaku_space()
augroup END

function! s:hl_trailing_spaces()
  highlight! link TrailingSpaces Error
  syntax match TrailingSpaces containedin=ALL /\s\+$/
endfunction

function! s:hl_zenkaku_space()
  highlight! link ZenkakuSpace Error
  syntax match ZenkakuSpace containedin=ALL /　/
endfunction

scriptencoding=utf8

" ---------- Basic Option ----------
setlocal wrap
setlocal showmatch
setlocal matchpairs+=<:>,「:」,（:）
setlocal matchtime=1
setlocal list
setlocal listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set formatoptions+=mM
" set foldmethod=marker
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
" ---------- Command/Status Line ----------
setlocal ruler
setlocal laststatus=2
set cmdheight=2
setlocal showcmd
set modeline
set modelines=5
" ---------- Search ----------
setlocal hlsearch
setlocal incsearch
setlocal ignorecase
setlocal smartcase
setlocal nowrapscan
setlocal showmatch
set wildmode=longest,list
set wildignore&
set wildignore=.git,.hg,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.out,*.class
set wildignore+=*.swp,*.swo,*.swn
set wildignore+=*.DS_Store
" ---------- Move ----------
setlocal backspace=indent,eol,start
setlocal whichwrap=b,s,h,l,<,>,[,]
setlocal scrolloff=3
setlocal sidescrolloff=16
setlocal sidescroll=1
set shiftround
" ---------- File setlting ----------
setlocal hidden
setlocal t_Co=256
setlocal imdisable
setlocal autoread
setlocal splitright
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
" ---------- help ----------
" setlocal helpheight=999
set keywordprg=:help
set helplang& helplang=en,ja
" ---------- OS/JP setting ----------
setlocal shellslash
set virtualedit& virtualedit+=block
" ---------- Enocode ----------
setlocal fileformats=unix,dos,mac
setlocal fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
language message en_US.utf8
" ---------- Bell Off ----------
setlocal visualbell
setlocal noerrorbells
" ---------- Tab/Indent ----------
setl expandtab
setl tabstop=2
setl shiftwidth=2
setl softtabstop=2
setl autoindent
setl smartindent
setl smarttab
setl laststatus=2

if exists('&ambiwidth')
  setl ambiwidth=double
endif
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

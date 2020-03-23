scriptencoding utf8

" Font {{{

set ambiwidth=double
if has('win32') || has('win64')
  " For Windows.

  set guifont=Cica:h16:cSHIFTJIS:qDRAFT
  " set guifontwide=VL\ Gothic:h11
  " set guifont=Courier\ New:h11
  " set guifont=VL\ Gothic:h11
  " set guifont=Consolas:h12
  " set guifont=Inconsolata:h12

  " Number of pixel lines inserted between characters.
   set linespace=2

  if has('patch-7.4.394')
    " Use DirectWrite
     set renderoptions=type:directx
  endif

  if has('kaoriya')
    " For Kaoriya only.
     set ambiwidth=auto
  endif
elseif has('mac')
  " For Mac.
   set guifont=Osaka－等幅:h14
else
  " For Linux.
   " set guifontwide=VL\ Gothic\ 13
   " set guifont=Courier\ 10\ Pitch\ 14
   " set guifont=Font\ Family\ 12
   " set guifontwide=Font\ Family\ 12
   set guifontwide=Cica\ 14
   set guifont=Cica\ 14
endif
" }}}

" Window Size {{{
if &columns < 170
  set columns=170
endif
if &lines < 40
  set lines=40
endif
" }}}

" ColorScheme {{{
if !exists('g:colors_name')
  colorscheme morning
endif
" }}}

" GuiOptions {{{
set mouse=
set mousemodel=
set nomousefocus
set mousehide
set guioptions=c
set guicursor&
set guicursor+=a:blinkon0
" }}}

" vim: foldmethod=marker

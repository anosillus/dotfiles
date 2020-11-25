"---------------------------------------------------------------------------
" GUI:
"

"---------------------------------------------------------------------------
" Fonts:

set ambiwidth=double
if has('win32') || has('win64')
  " For Windows.
  " set guifont=Cica:h12:cSHIFTJIS:qDRAFT
  " set guifont=Cica:h12
  " set guifontwide=VL\ Gothic:h11
  " set guifont=Courier\ New:h11
  " set guifont=VL\ Gothic:h11
  " set guifont=Consolas:h12
  " set guifont=Inconsolata:h12

  " Number of pixel lines inserted between characters.
   set linespace=2

  " Use DirectWrite
  "set renderoptions=type:directx

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
   " set guifontwide=Cica\ 18
   " set guifont=Cica\ 18
endif

"---------------------------------------------------------------------------
" Window:
"
if has('win32') || has('win64')
  " Width of window.
   set columns=230
  " Height of window.
   set lines=55
else
  if &columns < 170
    " Width of window.
     set columns=170
  endif
  if &lines < 40
    " Height of window.
     set lines=40
  endif
endif

" Don't override colorscheme.
if !exists('g:colors_name')
  colorscheme candy
endif

"---------------------------------------------------------------------------
" Options:
set mouse=
set mousemodel=

" Don't focus the window when the mouse pointer is moved.
set nomousefocus
" Hide mouse pointer on insert mode.
set mousehide

" Hide toolbar and menus.
set guioptions=cd

" Don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0

set t_vb=

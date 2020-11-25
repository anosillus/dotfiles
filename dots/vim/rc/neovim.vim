if has('vim_starting') && empty(argv())
  syntax off
endif

if exists('&inccommand')
  set inccommand=nosplit
endif

if exists('&pumblend')
  set pumblend=20
  " For gonvim
  " autocmd MyAutoCmd InsertEnter * set pumblend=20
endif

if exists('&winblend')
  set winblend=20
endif

" Use cursor shape feature
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


" Modifiable terminal
autocmd MyAutoCmd TermOpen * setlocal modifiable
autocmd MyAutoCmd TermClose * buffer #

let g:terminal_scrollback_buffer_size = 3000

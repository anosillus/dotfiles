let g:dein#auto_recache = v:false
let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = v:false
let g:dein#notification_icon = '~/.vim/signs/warn.png'

let g:dein#inline_vimrcs = ['keymap.vim', 'basic.vim', 'filetype.vim', 'gui.vim']


if IsLinux()
 call add(g:dein#inline_vimrcs, 'unix.vim')
elseif IsWindows()
 call add(g:dein#inline_vimrcs, 'windows.vim')
elseif IsMac()
 call add(g:dein#inline_vimrcs, 'mac.vim')
endif

" if has('gui_running')
"  call add(g:dein#inline_vimrcs, 'gui.vim')
" endif

if has('nvim')
  call add(g:dein#inline_vimrcs, 'neovim.vim')
endif

call map(g:dein#inline_vimrcs, "resolve(expand('~/.vim/rc/' . v:val))")

let s:path = expand('$CACHE/dein')
if !dein#load_state(s:path)
  finish
endif

let s:dein_toml = '~/.vim/rc/dein.toml'
let s:dein_lazy_toml = '~/.vim/rc/deinlazy.toml'
let s:dein_ft_toml = '~/.vim/rc/deinft.toml'

call dein#begin(s:path, [
      \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ft_toml
      \ ])

call dein#load_toml(s:dein_toml, {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
call dein#load_toml(s:dein_ft_toml)
" call dein#add('~/.vim/local/vim-ipynb')

call dein#end()
call dein#save_state()

filetype plugin indent on
syntax enable

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif

scriptencoding utf8

" <SPACE> is 'Prefix'. {{{
let g:mapleader = "\<Space>"
nmap <Space>   [Space]
nmap [Space]   <Nop>
vnoremap <leader><Leader> <ESC>
" cnoremap <silent> <Space><Space> <ESC>
cnoremap <silent> <C-c> <ESC>

"this isn't work"
inoremap <C-c> <ESC>
nmap <Space><Space> :<C-u>w<CR>
" }}}

" <Enter> is 'Page Scroll'. {{{
nnoremap  <CR> <C-f>
" xmap     <CR> <Plug>(EasyAlign)
xmap <CR> <Plug>(EasyAlign)
nmap     <S-CR>  <C-b>
noremap  <C-CR>  <C-d>
inoremap <C-CR> <ESC>+i

"<Todo>
" I didn't wrote enough deol setting yet.
nnoremap <silent><leader><CR> :<C-u>Deol -split=floating<CR>
" }}}
" Write Deol setting more !!

" Symbols {{{

" < :/; > is 'Command'. {{{
noremap ;  :
noremap :  ;
nnoremap <leader>; :<C-u>Denite command_history<CR>
nnoremap <leader>: :<C-u>Denite file/old -start-filter<CR>
nnoremap m;        :<C-u>Denite file/rec:~/.vim/rc -start-filter<CR>
nnoremap m:        :<C-u>Denite file/rec -start-filter<CR>
" }}}


" Change histry mover
map , /
nnoremap g. g;
nnoremap g: g,
" <C-,/.> didn't work on ubuntu.
" nnoremap g, " change list next
" cnoremap <C-,> <C-r>/
" }}}

"  >,<  is 'Tab'. {{{
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
" You can't use this mapping. I use <C-s> and <C-t>. I didn't test <lt> key.
" inoremap <C-.> <C-i>    " you can't use this keymap.
" inoremap <C-,> <C-t>
" }}}

" < */# > is 'Seasch Cursorl Word'. {{{
" map *  is is.vim
" map g* is is.vim
" map # is is.vim
" This is not realistic.
" cnoremap <C-*> <C-R><C-W>
"}}}

" other symbols. {{{
nnoremap <Leader>= <C-w>=
map  <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
noremap  <bs> _x
noremap  <Leader><bs> _X

" Gina {{{
nnoremap <Right> :<C-u>Gina diff<CR>
nnoremap <Left> :<C-u>Gina commit<CR>
nnoremap <UP> :<C-u>Gina status<CR>
nnoremap <Down> :<C-u>Gina push<CR>
" nnoremap <Down> :<C-u>call gina#custom#execute('/\%(status\|branch\|ls\|grep\|changes\|tag\)','setlocal winfixheight',)
" }}}

" }}}
" }}}

" <Wheel> is 'Motion'. {{{
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" }}}
" Todo later
" Right Hand {{{
" h/n is 100 %.
" < n/e > is 'UP/DOWN'. {{{
noremap n gj
noremap e gk
" nmap N/E is edge motion.
map  <leader>n }
map  <leader>e {
" nmap <silent><leader>N <Plug>(coc-git-nextchunk)
" nmap <silent><leader>E <Plug>(coc-git-prevchunk)
snoremap <silent> <BS> <c-g>c
snoremap <silent> <DEL> <c-g>c
snoremap <silent> <c-i> <c-g>c
snoremap <silent> <c-h> <c-g>c
snoremap <c-r> <c-g>"_c<c-r>

snoremap <c-r> <c-g>"_c<c-r>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap gn <C-w>j
nnoremap ge <C-w>k
nnoremap gN <C-w>J
nnoremap gE <C-w>K
inoremap <C-n> <Down>
inoremap <C-e> <Up>
" cnoremap <C-n> <C-n>
cnoremap <C-e> <C-p>
" This isn't realistic.
" inoremap <expr><S-TAB> pumvisible() ? "\<C-e>" : "\<C-h>"
" }}}

" h/i is 100 %.
" < h/i > is 'Word Motion'. {{{
noremap i w
noremap h b
noremap I e
noremap H ge
noremap <Leader>h ^
noremap <Leader>i $
noremap <Leader>H 0
noremap <Leader>I +
nnoremap gh <C-w>h
nnoremap gi <C-w>l
nnoremap gH <C-w>H
nnoremap gI <C-w>L
inoremap <C-h> <Left>
inoremap <C-i> <Right>
" Base 'omap i' is replaced by s

" Japanese mode {{{
" This is defined in fiiletype.vim
" nmap <silent> I <Plug>JaSegmentMoveNE
" nmap <silent> i <Plug>JaSegmentMoveNW
" nmap <silent> h <Plug>JaSegmentMoveNB
" omap <silent> I <Plug>JaSegmentMoveOE
" omap <silent> i <Plug>JaSegmentMoveOW
" omap <silent> h <Plug>JaSegmentMoveOB
" xmap <silent> I <Plug>JaSegmentMoveVE
" xmap <silent> i <Plug>JaSegmentMoveVW
" xmap <silent> h <Plug>JaSegmentMoveVB
" omap <silent> ai <Plug>JaSegmentTextObjA
" omap <silent> ii <Plug>JaSegmentTextObjI
" xmap <silent> ai <Plug>JaSegmentTextObjVA
" xmap <silent> si <Plug>JaSegmentTextObjVI
" }}}
"}}}

" o is 50 % userd(i, v, g is empty.)
" <o> is 'New Line'. {{{
" map o is o
nnoremap go :<C-u>e<Space>
" imap <C-o> <Plug>(coc-snippets-expand)
" vmap <C-o> <Plug>(coc-snippets-select)
" imap <C-o> <Plug>(coc-snippets-expand-jump)
nnoremap <Leader>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
" }}}
" Todo later

" < u/y > is 'Left/Right'{{{
noremap u <Left>
noremap y <Right>
"map U,Y is easymotion
noremap <C-u> :bprevious<CR>
noremap <C-y> :bnext<CR>
nnoremap gu :vs
nnoremap gy :sp
cnoremap <C-u> <Left>
cnoremap <C-y> <Right>

inoremap <C-u> <BS>
inoremap <C-y> <Delete>

" Sub-idea {{{
" Complement of imap <C-n>, <C-i>
" inoremap <C-u> <C-G><C-j>
" inoremap <C-y> <C-G><C-k>

" I can't type <C-S-i> yet.
" map U <Plug>(smartword-ge)
" map Y <Plug>(smartword-e)
" }}}
" }}}

" <m> is 'Mark/Fold/MiddleScreen'. {{{
" Mark
nnoremap M '
" nmap <leader>m is Denite
" Fold
noremap mn zj
noremap me zk
noremap mN ]z
noremap mE [z
noremap mh zc
noremap mH zH
noremap mi zo
noremap mI zO
noremap mm zM
noremap mM zR
noremap mo zMzv
noremap mO zX
" Middle Scsreen.
nnoremap gm M
nnoremap <C-m> zz
nmap md <Plug>(EasyAlign)

" }}}


" l is 10%. <leader> and L is empty.
" <l> is 'Comment'. {{{
" nxmap l is caw

" For python (at filetype.vim)
" map lo pydocstring

" <ToDo>
" <C-l> is prefix of <Tab>
" But <leader>L and gl is not used.
" }}}


" j is 5 %
" j is denite/unite {{{
nmap j  <Nop>
xmap j  <Nop>
" nnoremap  jp  :Ipython<CR>
" vnoremap  jp  :VIpython<CR>

" nmap <C-j> is emment.vim
" imap <C-j> is eskk.vim

" }}}


" K is 30% used.
" <k/K> is Search 'Up/Down'. {{{
" map k is.vim
" map K is.vim
onoremap k s

" }}}

" b is 50%
" <b> is 'Help/Document' {{{
nmap b <Plug>(ref-keyword)
let g:jedi#documentation_command = 'b'
" xmap B :<C-u>'<,'>Gtrans<CR>
nnoremap <leader>b :<C-u>Denite -split=vertical help -start-filter<CR>
omap b (
omap B {
" }}}
" }}}

" Left hand {{{
" < s/t > is 'Insert/Append'. {{{
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1
let g:sandwich_no_default_key_mappings = 1

nnoremap s i
nnoremap S I
nnoremap t a
nnoremap T A
" s,t omap is for inner/outer.
onoremap s i
onoremap t a
xnoremap s i
xnoremap t a
" sentence is k
" Note: t omap is tag.
xmap S  <Plug>(niceblock-I)
xmap T  <Plug>(niceblock-A)
" Indent
inoremap <C-s> <C-d>
" inoremap <C-t> <C-t>
" <C-s> is fasetr than 'l', but not needed.
" nxo<C-s> is caw
nnoremap <C-t> :<C-u>Vista!!<CR>
" nx<leader>s is easymotion
nnoremap <silent> <Leader>t :<C-u>Denite -split=vertical outline -start-filter -auto-resize<CR>
" nnoremap <buffer> <leader>t :<C-u>DeniteCursorWord tag<CR>

nnoremap gs :<C-u>%s/\v//g<Left><Left><Left>
vnoremap gs :s/\v//g<Left><Left><Left>
noremap gt <C-]>
" I don't use '<C-]>'
" }}}

" <r> is 'Replace'. {{{
" map r is r
inoremap <C-r> <ESC>R
nnoremap <Leader>r :<C-u>QuickRun<CR>
nnoremap <C-r> *:%s///g<Left><Left>
" }}}

" <a> is 'Visual Mode/Head/Macro'. {{{
" Visual Mode
nnoremap a v
nnoremap A V
nnoremap <C-a> <C-v>
onoremap a t
" omap a is tag
" Head
nnoremap ga gv
vnoremap <C-a> 0
inoremap <C-a> <Esc>0i
" Macro
noremap <leader>a q
noremap <M-a> @ "This defined at Meta.
" }}}

" <d> is 'Delete'. {{{
inoremap <C-d> <C-u>
" }}}
" 10 %

" < f/p > is 'Forward/Previous'. {{{
" map <leader>f <Plug>(coc-git-nextchunk)
" map <leader>p <Plug>(coc-git-prevchunk)
" n <C-f><C-p> is ale

inoremap <C-f> <C-y>
inoremap <C-p> <C-e>
" }}}
" 80 %
" 100%
" <w> is 'Operator/Word-grep'. {{{
" moxmap<w,W> is sandwitch
map w <Nop>
map W <Nop>

map  w  <Plug>(operator-sandwich-add)
map  wD <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-query-a)
map  wd <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-auto-a)
map  wR <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
map  wr <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)
map  wR <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
map  wr <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)
omap aw <Plug>(textobj-sandwich-auto-a)
imap aW <Plug>(textobj-sandwich-query-a)
omap w  <Plug>(textobj-sandwich-auto-i)
omap W  <Plug>(textobj-sandwich-query-i)
xmap aw <Plug>(textobj-sandwich-auto-a)
xmap aW <Plug>(textobj-sandwich-query-a)
xmap w  <Plug>(textobj-sandwich-auto-i)
xmap W  <Plug>(textobj-sandwich-query-i)
omap sw <Plug>(textobj-sandwich-auto-i)
xmap sw <Plug>(textobj-sandwich-auto-i)
omap tw <Plug>(textobj-sandwich-auto-a)
xmap tW <Plug>(textobj-sandwich-query-a)
omap sW <Plug>(textobj-sandwich-query-i)
xmap sW <Plug>(textobj-sandwich-query-i)
omap tW <Plug>(textobj-sandwich-query-a)
xmap tW <Plug>(textobj-sandwich-query-a)

" Word-gerp
" nmap<C-w> is denite
" ic<C-w> is word-delete.
" nxo<leader>w is earymotion
" }}}

" <q> is 'Quit'. {{{
nnoremap q :<C-u>bprevious<CR>
nnoremap Q :<C-u>bdelete<CR>
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>Q :<C-u>q!<CR>
nnoremap <C-q> :<C-u>Denite change -start-filter<CR>
" qq is too slow.
" <Todo> fix to '={}' from ==.
imap <C-q> <C-f>
" imap <C-q> <ESC>==i
"}}}
" <g> is 'Git/Definition'. {{{
nnoremap gp :Denite gitlog -start-filter<CR>
nnoremap gP :Denite gitlog:all -start-filter<CR>
nnoremap gf :Denite gitchanged -start-filter<CR>
nnoremap gF :Denite gitfiles -start-filter<CR>
let g:jedi#goto_assignments_command = '<leader>g'
nmap <silent> <leader>g <Plug>(coc-definition)
" nmap <C-g> is submode
" }}}

" < x/c/v > is 'Delete/Cut/Paste'. {{{
"nnoremap x x
noremap  c  y
noremap  C  y$".
nnoremap v  ]p
nnoremap v  p
nnoremap gv gp
noremap  V  ]P
nnoremap gV gP
noremap  mV P
vnoremap v  "_dp
vnoremap V  "_dP
inoremap <C-x>   <Delete>
inoremap <C-v>   <C-r><Right>
inoremap <S-C-v> <ESC>"+pi
" inoremap <C-c> <ESC>
nnoremap <silent> <C-v>
\ :<C-u>Denite -buffer-name=register
\ register neoyank<CR>
xnoremap <silent> <C-v>
\ :<C-u>Denite -default-action=replace -buffer-name=register
\ register neoyank<CR>
cnoremap <C-v> <C-r>"
noremap <silent> <Leader>v "+p
noremap <silent> <Leader>V <Right>"+p
noremap <silent> <Leader>c "+y
noremap <silent> <Leader>C "+y$
noremap <silent> <Leader>x "+d
noremap <silent> <Leader>X "+d$

" <M-c> is 'CMUS' {{{
nmap ã [CMUS]
nmap [CMUS]   <Nop>
nnoremap [CMUS]i :CmusCurrent<cr>
nnoremap [CMUS]z :CmusPrevious<cr>
nnoremap [CMUS]x :CmusPlay<cr>
nnoremap [CMUS]c :CmusPause<cr>
nnoremap [CMUS]v :CmusStop<cr>
nnoremap [CMUS]b :CmusNext<cr>
" }}}
" }}}

" <z> is 'Undo/Redo'. {{{
nnoremap z u
nnoremap Z <C-r>
inoremap <C-z> <ESC>:<C-U>undo<CR>i
nnoremap gz U
nnoremap gz :<C-U>undo<CR>
nnoremap <leader>z :<C-u>GundoToggle<CR>
" increment
noremap <C-z> <C-a>
" <C-z> is for Suspend.
" }}}

" }}}

" Meta key mappings {{{
"q (replacement of <M-Ctrl>)
" map  ú ! "This broke vim"
" map! ú ! "This broke vim"
map   <M-q>  !
map!  <M-q>  !
tmap  <M-q>  !

" a
map  á @
map! á @
tmap á @

" r
map  ò #
map! ò #
tmap ò #

" s
map  ó $
map! ó $
tmap ó $

" t
map  ô %
map! ô %
tmap ô %

" d
map  ä ^
map! ä ^
tmap ä ^

" h
map  è &
map! è &
tmap è &

" n
map  î *
map! î *
tmap î *

" e
map  å (
map! å (
tmap å (

" i
map  é )
map! é )
tmap é )

" o
map  ï _
map! ï _
tmap ï _

" <CR>
" Note : <M-CR> isn't work, I use <M-;>)
map  <M-;> <kPlus>
map! <M-;> <kPlus>
tmap <M-;> <kPlus>

" b
map  â "
map! â "
tmap â "

" k
map  ë ?
map! ë ?
tmap ë ?

" m
map  í {
map! í {
tmap í {

" ,
map  ¬ }
map! ¬ }
tmap ¬ }

" .
map  ® <bar>
map! ® <bar>
tmap ® <bar>
" }}}

" terminal mode setting(not yet) {{{
" terminal mode
" set termkey=<C-l>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-g> <C-\><C-n>:q!<CR>,
" }}}

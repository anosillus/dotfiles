scriptencoding utf8

" <SPACE> is 'Prefix'. {{{
let g:mapleader = "\<Space>"
nmap <Space>   [Space]
nmap [Space]   <Nop>
vnoremap <leader><Leader> <ESC>
" cnoremap <silent> <Space><Space> <ESC>
cnoremap <silent> <C-c> <ESC>
" nnoremap <c-Space> :<C-u>w<CR>

"this isn't work"
inoremap <C-c> <ESC>
nmap <Leader><Leader> :<C-u>w<CR>
" }}}

" <Enter> is 'Page Scroll'. {{{
nmap  <CR> <C-f>
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
" nnoremap <leader>; :<C-u>Denite command_history<CR>
" nnoremap <leader>: :<C-u>Denite file/old -start-filter<CR>
" nnoremap <-;> denite
" nnoremap m;        :<C-u>Denite file/rec:~/.vim/rc -start-filter<CR>
" nnoremap m:        :<C-u>Denite file/rec -start-filter<CR>
" }}}

" Change histry mover
map , /
" nnoremap g. g;
" nnoremap g: g,
" <C-,/.> didn't work on ubuntu.
" nnoremap g, "remmaped for search
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
" map  <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
noremap  <bs> _x
noremap  <Leader><bs> _X
" }}}

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap gn <C-w>j
nnoremap ge <C-w>k
nnoremap gN <C-w>J
snoremap gE <C-w>K
inoremap <C-n> <Down>
inoremap <C-e> <Up>
" cnoremap <C-n> <C-n>
cnoremap <C-e> <C-p>
" This isn't realistic.
" inoremap <expr><S-TAB> pumvisible() ? "\<C-e>" : "\<C-h>"
" }}}

" h/i is 100 %.
" < h/i > is 'Word Motion'. {{{
" noremap i w
" noremap h b
" noremap I e
" noremap H ge
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
" nnoremap go :<C-u>e<Space>
" go is history jump
nnoremap <Leader>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
nnoremap <C-o> o<Esc>

" iv<C-o> is coc snippets
" }}}
" Todo later

" < u/y > is 'Left/Right'{{{
noremap u <Left>
noremap y <Right>
nnoremap <leader>u <C-o>
nnoremap <leader>y <C-i>
nnoremap <leader>U g;
nnoremap <leader>Y g.

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
nnoremap m '
nnoremap M m
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
xmap mf zf
noremap md zd
noremap mD zD
" leader m is denite
" nnoremap <C-m> zz
" leader m is denite mark
" C-m is show mark
" mz is gundo
" m, is word count
" m* is another count
" mt  is tag.
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
" gJ is gJ

" nnoremap  jp  :Ipython<CR>
" vnoremap  jp  :VIpython<CR>

" nmap <C-j> is emment.vim
" imap <C-j> is eskk.vim

" }}}

" K is 30% used.
" <k/K> is Search 'Up/Down'. {{{
" map k is.vim
" map K is.vim
" }}}

" b is 50%
" <b> is 'Help/Document' {{{
" nmap b <Plug>(ref-keyword)
let g:jedi#documentation_command = 'b'
" xmap B :<C-u>'<,'>Gtrans<CR>
"nmap B is coc document.
omap b (
omap B {
" }}}
" }}}

" Left hand {{{
" < s/t > is 'Insert/Append'. {{{

nnoremap s i
nnoremap S I
nnoremap t a
nnoremap T A
nnoremap gt ga
nnoremap gT gA
nnoremap gs :<C-u>%s/\v//g<Left><Left><Left>
vnoremap gs :s/\v//g<Left><Left><Left>
" nnoremap gS gI
" s,t omap is for inner/outer.
onoremap s i
onoremap t a
xnoremap s i
xnoremap t a
" sentence is k
" tag is sandwitch.vim
" xmap <S/T> is <Plug>(niceblock)
inoremap <C-s> <C-d>
" inoremap <C-t> <C-t>
" <C-s> is fasetr than 'l', but not needed.
" nxo<C-s> is caw
nnoremap <C-t> :<C-u>Vista!!<CR>
" nx<leader>s is easymotion
nnoremap <silent> <Leader>t :<C-u>Denite -split=vertical outline -start-filter -auto-resize<CR>
" nnoremap <buffer> <leader>t :<C-u>DeniteCursorWord tag<CR>
noremap gt <c-]>
" I don't use '<C-]>'
" }}}

" <r> is 'Replace'. {{{
" map r is r
" map R is operator
nnoremap <C-r> *:%s///g<Left><Left>
inoremap <C-r> <ESC>R
vnoremap r s
" nnoremap gr :<C-u>%s/\v//g<Left><Left><Left>
" vnoremap gr :s/\v//g<Left><Left><Left>


" Leader r is symbol rename.
" nnoremap <Leader>R :<C-u>QuickRun<CR>
" }}}

" <a> is 'Visual/Head'. {{{
" Visual Mode
nnoremap a v
nnoremap A V
nnoremap <C-a> <C-v>
nnoremap ga gv
nnoremap gA gV
vnoremap <C-a> 0
inoremap <C-a> <Esc>0i
" }}}

" <d> is 'Delete'. {{{
inoremap <C-d> <C-u>
" gd is jump by coc.
" }}}
" 10 %

" < f/p > is 'Forward/Previous'. {{{
" map <leader>f <Plug>(coc-git-nextchunk)
" map <leader>p <Plug>(coc-git-prevchunk)
" n <C-f><C-p> is ale
inoremap <C-p> [Nop]
inoremap <C-f> <C-e>
inoremap <C-p> <C-y>
" }}}
" 80 %
" 100%
" <w> is 'Operator/Word-grep'. {{{
" moxmap<w,W> is sandwitch and Word-gerp
nnoremap wq :<C-u>w<CR>
" nmap<C-w> is denite
" nxo<leader>w is earymotion
" }}}

" <q> is 'Macro/Quit.' {{{
" nmap q :bd<CR>
noremap Q @
" xmap q <Plug>(coc-codeaction-selected)
" nnoremap <C-q> :<C-u>q!<CR>
" nnoremap Q history
" <q> is 'Quit'. {{{
" map q is q
nnoremap Q @
nmap qq :bd<CR>
xmap q <Plug>(coc-codeaction-selected)
imap <C-q> <C-]>
" nnoremap <-q> is denite history
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>Q :<C-u>q!<CR>
" <C-q> is history
" <Todo> fix to '={}' from ==.
" imap <C-q> <C-f>
imap <C-q> <ESC>==i
"}}}

" <g> is 'Git/Definition'. {{{
nnoremap gp :Denite gitlog -start-filter<CR>
nnoremap gP :Denite gitlog:all -start-filter<CR>
nnoremap gf :Denite gitchanged -start-filter<CR>
nnoremap gF :Denite gitfiles -start-filter<CR>
let g:jedi#goto_assignments_command = '<leader>g'
" gt is tag
" nmap <silent> <leader>g <Plug>(coc-definition)
" <leader>g is denite dein
" gM is denite mark
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
" inoremap <C-x>   <Delete>
inoremap <C-v>   <C-r><C-r><Right>
inoremap <C-b> <ESC>"+pi
" inoremap <C-c> <ESC>
"nx <C-v> is neoyank
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
" nnoremap gz U
nnoremap gz :<C-U>undo<CR>
" nnoremap <leader>z :<C-u>GundoToggle<CR>
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
lmap  <M-q>  !
tmap  <M-q>  !

" a
map  á @
map! á @
lmap á @
tmap á @

" r
map  ò #
map! ò #
lmap ò #
tmap ò #

" s
map  ó $
map! ó $
lmap ó $
tmap ó $

" t
map  ô %
map! ô %
lmap ô %
tmap ô %

" d
map  ä ^
map! ä ^
lmap ä ^
tmap ä ^

" h
map  è &
map! è &
lmap è &
tmap è &

" n
map  î *
map! î *
lmap î *
tmap î *

" e
map  å (
map! å (
lmap å (
tmap å (

" i
map  é )
map! é )
lmap é )
tmap é )

" o
map  ï _
map! ï _
lmap ï _
tmap ï _

" <CR>
" Note : <M-CR> isn't work, I use <M-;>)
map  <M-;> <kPlus>
map! <M-;> <kPlus>
lmap <M-;> <kPlus>
tmap <M-;> <kPlus>

" b
map  â "
map! â "
lmap â "
tmap â "

" k
map  ë ?
map! ë ?
lmap ë ?
tmap ë ?

" m
map  í {
map! í {
lmap í {
tmap í {

" ,
map  ¬ }
map! ¬ }
lmap ¬ }
tmap ¬ }

" .
map  ® <bar>
map! ® <bar>
map! ® <bar>
lmap ® <bar>
tmap ® <bar>
" }}}

" terminal mode setting(not yet) {{{
" terminal mode
" set termkey=<C-l>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-g> <C-\><C-n>:q!<CR>,
" }}}

" vim: ts=2 et sw=2 fdm=marker

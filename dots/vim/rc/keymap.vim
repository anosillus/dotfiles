scriptencoding utf8

" <SPACE> is 'Prefix'. {{{
let g:mapleader = "\<Space>"
nmap <Space>   [Space]
nmap [Space]   <Nop>
" nnoremap <Leader><Leader> :<C-u>source ~/.config/nvim/init.vim<CR> <bar> <Ctr-l>
vnoremap <leader><Leader> <ESC>
" cnoremap <silent> <Space><Space> <ESC>
cnoremap <silent> <C-c> <ESC>

"this isn't work"
inoremap <C-c> <ESC>
nmap <Space><Space> :<C-u>w<CR>
" map <Space><Space> <Plug>(easymotion-bd-w)
" omap <Space><Space> <Plug>(easymotion-bd-w)
" }}}

" <Enter> is 'Page Scroll'. {{{
noremap  <CR> <C-f>
xmap     <CR> <Plug>(EasyAlign)
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

" < ,/. > is 'Search'. {{{
" functions defined {{{
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

function! s:config_migemo(...) abort
return extend(copy({
\   'converters': [
\     incsearch#config#migemo#converter(),
\   ],
\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
\   'keymap': {"\<C-l>": '<Over>(easymotion)'},
\   'is_expr': 0,
\ }), get(a:, 1, {}))
endfunction

function! s:config_easyfuzzymotion(...) abort
return extend(copy({
\   'converters': [incsearch#config#fuzzyword#converter()],
\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
\   'keymap': {"\<CR>": '<Over>(easymotion)'},
\   'is_expr': 0,
\   'is_stay': 1
\ }), get(a:, 1, {}))
endfunction
" }}}

noremap  <silent><expr> ,  incsearch#go(<SID>incsearch_config())
noremap  <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap  <silent><expr> m, incsearch#go(<SID>config_migemo())
noremap  <silent><expr> m? incsearch#go(<SID>config_migemo({'command': '?'}))
noremap  <silent><expr> <Leader>, incsearch#go(<SID>config_easyfuzzymotion())
nnoremap <silent><expr> <leader>. :<C-u>Denite -buffer-name=search line -start-filter<CR>
" Change histry mover
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
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
" This is not realistic.
" cnoremap <C-*> <C-R><C-W>
"}}}

" other symbols. {{{
nnoremap <Leader>= <C-w>=
noremap  <silent> <Esc><Esc> :<C-u>nohlsearch<CR><bar><Plug>(anzu-clear-search-status)
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
" < n/e > is 'UP/DOWN'. {{{
noremap n gj
noremap e gk
nmap <silent>n <Plug>(accelerated_jk_gj)
nmap <silent>e <Plug>(accelerated_jk_gk)
map  N <Plug>(edgemotion-j)
map  E <Plug>(edgemotion-k)
map  <C-n> <Plug>(easymotion-j)
map  <C-e> <Plug>(easymotion-k)
map  <leader>n }
map  <leader>e {
nmap <silent><leader>N <Plug>(coc-git-nextchunk)
nmap <silent><leader>E <Plug>(coc-git-prevchunk)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
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

" < h/i > is 'Word Motion'. {{{
map <silent> i <Plug>CamelCaseMotion_w
map <silent> h <Plug>CamelCaseMotion_ge
map <silent> I <Plug>CamelCaseMotion_e
map <silent> H <Plug>CamelCaseMotion_ge
map <C-i> <Plug>(smartword-w)
map <C-h> <Plug>(smartword-b)
map <C-S-i> <Plug>(smartword-e)
map <C-S-h> <Plug>(smartword-ge)
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

" <o> is 'New Line'. {{{
" map o is o
nnoremap go :<C-u>e<Space>

imap <C-o> <Plug>(coc-snippets-expand)
vmap <C-o> <Plug>(coc-snippets-select)
imap <C-o> <Plug>(coc-snippets-expand-jump)
nnoremap <Leader>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

inoremap <silent><expr> <C-o>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<c-i>'
let g:coc_snippet_prev = '<c-h>'
" }}}
" Todo later

" < u/y > is 'Left/Right'{{{
noremap u <Left>
noremap y <Right>
map U <Plug>(easymotion-linebackward)
map Y <Plug>(easymotion-lineforward)
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
nnoremap <leader>m :Denite mark<CR>
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
" }}}

" <l> is 'Comment'. {{{
nmap l  <Nop>
xmap l  <Nop>
nmap l  <Plug>(caw:prefix)
nmap lh <Plug>(caw:zeropos:toggle)
nmap li <Plug>(caw:dollarpos:toggle)
nmap ll <Plug>(caw:wrap:toggle)
nmap ls <Plug>(caw:box:comment)
nmap ln <Plug>(caw:jump:comment-next)
nmap le <Plug>(caw:jump:comment-prev)
xmap l  <Plug>(caw:prefix)
xmap lh <Plug>(caw:zeropos:toggle)
xmap li <Plug>(caw:dollarpos:toggle)
xmap ll <Plug>(caw:wrap:toggle)
xmap ls <Plug>(caw:box:comment)
xmap ln <Plug>(caw:jump:comment-next)
xmap le <Plug>(caw:jump:comment-prev)
" For python (at filetype.vim)
" map lo pydocstring

" <ToDo>
" <C-l> is prefix of <Tab>
" But <leader>L and gl is not used.
" }}}
" L is 10%.

" j is ??? {{{
nmap j  <Nop>
xmap j  <Nop>
nnoremap  jp  :Ipython<CR>
vnoremap  jp  :VIpython<CR>
" vmap <leader>j  <Plug>(coc-format-selected)
" nmap <leader>j  <Plug>(coc-format-selected)

" noremap <silent> js :GscopeFind s <C-R><C-W><cr>
" noremap <silent> jg :GscopeFind g <C-R><C-W><cr>
" noremap <silent> jc :GscopeFind c <C-R><C-W><cr>
" noremap <silent> jt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> je :GscopeFind e <C-R><C-W><cr>
" noremap <silent> jf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> ji :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> jd :GscopeFind d <C-R><C-W><cr>
" noremap <silent> ja :GscopeFind a <C-R><C-W><cr>

" nmap <C-j> is emment.vim
imap <C-j> <Plug>(eskk:toggle)
cmap <C-j> <Plug>(eskk:toggle)
" }}}
" 5 %

" <k/K> is Search 'Up/Down'. {{{
map k <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map K <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
" }}}
" K is 30% used.

" <b> is 'Help/Document' {{{
nmap b <Plug>(ref-keyword)
let g:jedi#documentation_command = 'b'
xmap B :<C-u>'<,'>Gtrans<CR>
nnoremap <leader>b :<C-u>Denite -split=vertical help -start-filter<CR>
map <Leader>B <Plug>EblookInput
map <C-b> <Plug>EblookSearch
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
" s omap is for inner.
onoremap s i
" Note: t omap is tag.
xmap S  <Plug>(niceblock-I)
xmap T  <Plug>(niceblock-A)
" Indent
inoremap <C-s> <C-d>
" inoremap <C-t> <C-t>
" <C-s> is fasetr than 'l', but not needed.
nmap <C-s> <Plug>(caw:hatpos:toggle)
xmap <C-s> <Plug>(caw:hatpos:toggle)
omap <C-s> <Plug>(caw:hatpos:toggle)
nnoremap <C-t> :<C-u>Vista!!<CR>
nmap <leader>s <Plug>(easymotion-overwin-f2)
xmap <leader>s <Plug>(easymotion-bd-f2)
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
" omap a is a
" Head
nnoremap ga gv
vnoremap <C-a> 0
inoremap <C-a> <Esc>0i
" Macro
noremap <leader>a q
" noremap <M-a> @ "This defined at Meta.
" }}}

" <d> is 'Delete'. {{{
inoremap <C-d> <C-u>
" }}}
" 10 %

" < f/p > is 'Forward/Previous'. {{{
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)
map p <Plug>(easymotion-tl)
map P <Plug>(easymotion-Tl)
map <leader>f <Plug>(coc-git-nextchunk)
map <leader>p <Plug>(coc-git-prevchunk)
nmap <C-f> <Plug>(ale_next)
nmap <C-p> <Plug>(ale_previous)

inoremap <C-f> <C-y>
inoremap <C-p> <C-e>
" }}}
" 80 %

" <w> is 'Operator/Word-grep'. {{{
" Operator
map  w  <Plug>(operator-sandwich-add)
map  wD <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-query-a)
map  wd <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-auto-a)
map  wR <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
map  wr <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)
map  wR <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
map  wr <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)
omap aw <Plug>(textobj-sandwich-auto-a)
omap aW <Plug>(textobj-sandwich-query-a)
omap w  <Plug>(textobj-sandwich-auto-i)
omap W  <Plug>(textobj-sandwich-query-i)
xmap aw <Plug>(textobj-sandwich-auto-a)
xmap aW <Plug>(textobj-sandwich-query-a)
xmap w  <Plug>(textobj-sandwich-auto-i)
xmap W  <Plug>(textobj-sandwich-query-i)
" Word-gerp
nnoremap <C-w> :<C-u>DeniteCursorWord grep <CR>
nmap  <Leader>w <Plug>(easymotion-overwin-w)
xmap  <Leader>w <Plug>(easymotion-bd-w)
omap  <Leader>w <Plug>(easymotion-bd-w)
" imap, cmap <C-w> is word-delete.
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

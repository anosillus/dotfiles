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

" < :/; > is 'command'. {{{
noremap ;  :
noremap :  ;
nnoremap <leader>; :<C-u>Denite command_history<CR>
nnoremap <leader>: :<C-u>Denite file/old -start-filter<CR>
nnoremap m;        :<C-u>Denite file/rec:~/.vim/rc -start-filter<CR>
nnoremap m:        :<C-u>Denite file/rec -start-filter<CR>
" }}}

" < ,/. > is 'search'. {{{
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

" This is the command relate with < and >.
" But <C-,> didn't work on ubuntu.
" inoremap <C-.> <C-i>
" inoremap <C-.> <C-f>
" nnoremap g, " change list next
" }}}

"  >,<  is 'Tab'. {{{
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
inoremap <C-.> <C-i>    " you can't use this keymap.
inoremap <C-,> <C-t>
" }}}

" < */# > is 'Seasch cursorl word'. {{{
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
" }}}

" <Wheel> is 'motion'. {{{
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" }}}

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
map <silent> h <Plug>CamelCaseMotion_b
map <silent> I <Plug>CamelCaseMotion_e
map <silent> H <Plug>CamelCaseMotion_ge
map <C-i> <Plug>(smartword-basic-w)
map <C-h> <Plug>(smartword-basic-b)
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

" < o > is 'New Line'. {{{
nnoremap go :<C-u>e<Space>
" }}}

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
" copy over(below)line.
inoremap <C-u> <C-y>
inoremap <C-y> <C-e>

" Sub-idea {{{
" Complement of imap <C-n>, <C-i>
" inoremap <C-u> <C-G><C-j>
" inoremap <C-y> <C-G><C-k>

" I can't type <C-S-i> yet.
" map U <Plug>(smartword-ge)
" map Y <Plug>(smartword-e)
" }}}
" }}}

" < m > is 'Mark and Fold, Middle-screen'. {{{
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

" l is 'comment'. {{{
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

" <ToDo>
" <C-l> is prefix of <Tab>
" But <leader>L and gl is not used.
" }}}
" L is not used enough.

" < k > is ???. {{{
map k <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map K <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
" }}}

" < b > is 'help ' {{{
let g:ref_man_lang = 'ja'
" Use K to show documentation in preview window
nmap b <Plug>(ref-keyword)
" let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_stubs_command = '<leader>s'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = 'b'
let g:jedi#usages_command = '<leader>n'

nmap B <Nop>
xmap B <Nop>

xmap B :<C-u>'<,'>Gtrans<CR>
" }}}

" t is Insert/Append {{{
nnoremap s i
nnoremap S I
nnoremap t a
nnoremap T A
nmap <C-s> <Plug>(caw:hatpos:toggle)
xmap <C-s> <Plug>(caw:hatpos:toggle)
omap <C-s> <Plug>(caw:hatpos:toggle)
onoremap s i
xmap S  <Plug>(niceblock-I)
xmap T  <Plug>(niceblock-A)
nnoremap <C-t> :<C-u>Vista!!<CR>
inoremap <C-s> <C-d>
nmap <leader>s <Plug>(easymotion-overwin-f2)
xmap <leader>s <Plug>(easymotion-bd-f2)

" inoremap <C-t> Inert Indent
"
nnoremap <silent> <Leader>t :<C-u>Denite -split=tab outline -start-filter <CR>

" nnoremap <buffer> <leader>t :<C-u>DeniteCursorWord tag<CR>
" }}}

" a is Visual mode {{{
nnoremap a v
nnoremap A V
nnoremap <C-a> <C-v>
" " xmap a  <- used by sandwich
" "noremap <Leader>a <C-V>
nnoremap ga gv
vnoremap <C-a> 0
inoremap <C-a> <Esc>0i
" vmap A
" }}}

" <w> is 'operator' {{{
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
nnoremap <C-w> :<C-u>DeniteCursorWord grep <CR>
nmap  <Leader>w <Plug>(easymotion-overwin-w)
xmap  <Leader>w <Plug>(easymotion-bd-w)
omap  <Leader>w <Plug>(easymotion-bd-w)
" }}}

" f, p and w is Move{{{
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)
map p <Plug>(easymotion-tl)
map P <Plug>(easymotion-Tl)
map <leader>f <Plug>(coc-git-nextchunk)
map <leader>p <Plug>(coc-git-prevchunk)
nmap <C-p> <Plug>(ale_previous)
nmap <C-f> <Plug>(ale_next)
inoremap <C-f> <C-y>
inoremap <C-p> <C-e>
" }}}

" d is delete {{{
inoremap <C-d> <C-u>
 " noremap <Leaedr>d coc jump
" }}}

" q is quit {{{
nnoremap q :<C-u>bprevious<CR>
nnoremap Q :<C-u>bdelete<CR>
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>Q :<C-u>q!<CR>
nnoremap <C-q> :<C-u>Denite change -start-filter<CR>
"}}}

" x/c/v is Delete/Cut/Paste {{{
"nnoremap x x
noremap c y
noremap C y$".
nnoremap v ]p
nnoremap mv p
noremap V ]P
noremap mV P
vnoremap v "_dp
vnoremap V "_dP
inoremap <C-x> <Delete>
inoremap <C-v> <C-r><Right>
inoremap <S-C-v> <ESC>"+pi
" inoremap <C-c>
nnoremap <silent> <C-v>
\ :<C-u>Denite -buffer-name=register
\ register neoyank<CR>
xnoremap <silent> <C-v>
\ :<C-u>Denite -default-action=replace -buffer-name=register
\ register neoyank<CR>
cnoremap <C-v> <C-r>"
cnoremap <C-,> <C-r>/

noremap <silent> <Leader>v "+p
noremap <silent> <Leader>V <Right>"+p
noremap <silent> <Leader>c "+y
noremap <silent> <Leader>C "+y$
noremap <silent> <Leader>x "+d
noremap <silent> <Leader>X "+d$

nmap ã [CMS]
nmap [CMS]   <Nop>
nnoremap [CMS]i :CmusCurrent<cr>
nnoremap [CMS]z :CmusPrevious<cr>
nnoremap [CMS]x :CmusPlay<cr>
nnoremap [CMS]c :CmusPause<cr>
nnoremap [CMS]v :CmusStop<cr>
nnoremap [CMS]b :CmusNext<cr>

" }}}

" Gina {{{
nnoremap <Right> :<C-u>Gina diff<CR>
nnoremap <Left> :<C-u>Gina commit<CR>
nnoremap <UP> :<C-u>Gina status<CR>
nnoremap <Down> :<C-u>Gina push<CR>
" nnoremap <Down> :<C-u>call gina#custom#execute('/\%(status\|branch\|ls\|grep\|changes\|tag\)','setlocal winfixheight',)
" }}}

" v is paste {{{
nnoremap gv gp
nnoremap gV gP
" noremap g{} {}
" noremap z{} {}
" noremap m{} {}
" noremap! <C-{}> {}
" }}}

 " R is Replace {{{
inoremap <C-r> <ESC>R
nnoremap <Leader>r :<C-u>QuickRun<CR>
nnoremap <C-r> *:%s///g<Left><Left>
" }}}

" z is Undo/redo {{{
nnoremap z u
xnoremap z :<C-U>undo<CR>
nnoremap Z <C-r>
xnoremap Z :<C-U>redo<CR>
inoremap <C-z> <ESC>:<C-U>undo<CR>i

noremap <C-z> <C-a>
nnoremap gz U
nnoremap gz :<C-U>undo<CR>
nnoremap <leader>z :<C-u>GundoToggle<CR>
" }}}

" k/K is Search Up/Down (old n/N) {{{
imap <C-o> <Plug>(coc-snippets-expand)
vmap <C-o> <Plug>(coc-snippets-select)
imap <C-o> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <C-o>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:coc_snippet_next = '<tab>'
let g:coc_snippet_next = '<c-i>'
let g:coc_snippet_prev = '<c-h>'
"}}}

"
" {{{ g
nnoremap gp :Denite gitlog -start-filter<CR>
nnoremap gP :Denite gitlog:all -start-filter<CR>
nnoremap gf :Denite gitchanged -start-filter<CR>
nnoremap gF :Denite gitfiles -start-filter<CR>

" nnoremap <silent> <Leader>w :<C-u>w<CR>
" nnoremap <Leader>W :<C-u>w!<CR>
" }}}

" j is Folds {{{
nmap j  <Nop>
xmap j  <Nop>

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

"Submode {{{
nnoremap gs :<C-u>%s/\v//g<Left><Left><Left>
vnoremap gs :s/\v//g<Left><Left><Left>

nnoremap <Leader>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
" }}}

" Meta key mappings {{{
"q (replacement of <M-Ctrl>)
" map  ú ! "This broke vim"
" map! ú ! "This broke vim"
map   <M-q>  !
map!  <M-q>  !
" a
map  á @
map! á @
" r
map  ò #
map! ò #
" s
map  ó $
map! ó $
" t
map  ô %
map! ô %
" d
map  ä ^
map! ä ^
" h
map  è &
map! è &
" n
map  î *
map! î *
" e
map  å (
map! å (
" i
map  é )
map! é )
" o
map  ï _
map! ï _
" <CR>
" Note : <M-CR> isn't work, I use <M-;>)
map  <M-;> <kPlus>
map! <M-;> <kPlus>
" b
map  â "
map! â "
" k
map  ë ?
map! ë ?
" m
map  í {
map! í {
" ,
map  ¬ }
map! ¬ }
" .
map  ® <bar>
map! ® <bar>
" }}}

" terminal mode setting(not yet) {{{
" terminal mode
" set termkey=<C-l>
" }}}

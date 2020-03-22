scriptencoding utf8

" 1. SPACE {{{
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

" l is comment out {{{
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

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap g<CR> <Plug>(EasyAlign)
" }}}

" enter {{{
noremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR> <bar> <Plug>(anzu-clear-search-status)
noremap <bs> _x
noremap <Leader><bs> _X
noremap <CR> <C-f>
xmap <CR> <Plug>(EasyAlign)
nmap <S-CR>  <C-b>
noremap <C-CR>  <C-d>
inoremap <C-CR> <ESC>+i
" }}}

"  : / ;  is command{{{
noremap ;  :
noremap :  ;
nnoremap <leader>; :<C-u>Denite command_history<CR>
nnoremap <leader>: :<C-u>Denite file/old -start-filter<CR>

nnoremap go :<C-u>e<Space>
nnoremap <silent><leader><CR> :<C-u>Deol -split=floating<CR>

" }}}

" ,/. is search {{{
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> ,  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))


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

noremap <silent><expr> m, incsearch#go(<SID>config_migemo())
noremap <silent><expr> m? incsearch#go(<SID>config_migemo({'command': '?'}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>, incsearch#go(<SID>config_easyfuzzymotion())
" noremap <C-,> :echo "this keymap didn't work.
" noremap <silent><expr><C-,> incsearch#go(<SID>incsearch_config({'is_stay': 1}))

map k <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map K <Plug>(is-nohl)<Plug>(anzu-N-with-echo)

" This key is userd not working.
nnoremap <silent> <leader>. :<C-u>Denite -buffer-name=search line -start-filter<CR>

" inoremap <C-.> <C-i>
" inoremap <C-.> <C-f>
" Change list mover
nnoremap g. g;
nnoremap g: g,
" nnoremap g, " change list next
" }}}

" < / > {{{
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" imap <C-.> <C-i>    " you can't use this keymap.
" imap <C-,> <C-t>
" }}}

nnoremap <Leader>= <C-w>=

"* is seasch{{{
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
cnoremap <C-*> <C-R><C-W>
"}}}
" n/e is UP/DOWN {{{
noremap n gj
noremap e gk
nmap <silent>n <Plug>(accelerated_jk_gj)
nmap <silent>e <Plug>(accelerated_jk_gk)
" nmap <silent><leader>N <Plug>(coc-git-prevchunk)
" nmap <silent><leader>N <Plug>(coc-git-prevchunk)
" nmap ]g <Plug>(coc-git-nextchunk)
nmap <leader>s <Plug>(easymotion-overwin-f2)
xmap <leader>s <Plug>(easymotion-bd-f2)
map N <Plug>(edgemotion-j)
map E <Plug>(edgemotion-k)
map <C-n> <Plug>(easymotion-j)
map <C-e> <Plug>(easymotion-k)
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-e>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

map <leader>n }
map <leader>e {
" map <leader>N <Plug>(ale_next_wrap)
" map <Leader>E <Plug>(ale_previous_wrap)
nnoremap gn <C-w>j
nnoremap ge <C-w>k
nnoremap gN <C-w>J
nnoremap gE <C-w>K
inoremap <C-n> <Down>
inoremap <C-e> <Up>
cnoremap <C-e> <C-p>
" cnoremap <C-n> <C-n>
" }}}

" h/i is Word/BackWord {{{
" map <C-S-i> <Plug>(smartword-e)
" map <C-S-h> <Plug>(smartword-ge)
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
" omap i is replaced in s
map <silent> i <Plug>CamelCaseMotion_w
map <silent> h <Plug>CamelCaseMotion_b
map <silent> I <Plug>CamelCaseMotion_e
map <silent> H <Plug>CamelCaseMotion_ge
map <C-i> <Plug>(smartword-basic-w)
map <C-h> <Plug>(smartword-basic-b)

"}}}
" u/y is Left/Right{{{
noremap u <Left>
noremap y <Right>
map U <Plug>(smartword-ge)
map Y <Plug>(smartword-e)

" noremap U <Left>
" noremap Y <Right>
noremap <C-u> :bprevious<CR>
noremap <C-y> :bnext<CR>
map <leader>y <Plug>(easymotion-lineforward)
map <leader>u <Plug>(easymotion-linebackward)
" omap <Leader>u <Plug>(easymotion-bd-el)
" omap <Leader>y <Plug>(easymotion-bd-wl)
nnoremap gu :vs
nnoremap gy :sp
cnoremap <C-u> <Left>
cnoremap <C-y> <Right>
inoremap <C-u> <C-G><C-j>
inoremap <C-y> <C-G><C-k>

" }}}

" m/M is fold/Middle {{{
nnoremap <silent> m; :<C-u>Denite file/rec:~/.vim/rc -start-filter<CR>
nnoremap <silent> m: :<C-u>Denite file/rec -start-filter<CR>
nnoremap <leader>m :Denite mark<CR>
" M is screen middle.
" fold 関係
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
nnoremap M '
nnoremap gm M
" }}}
inoremap <C-u> <C-e>
" ioremap <C-y> is paste over line

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

" " w is range operator {{{
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

" autocmd CursorHold * silent call CocActionAsync('highlight')
" nmap <C-v> <Plug>(coc-rename)
 " q is quit {{{
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>Q :<C-u>q!<CR>
nnoremap <silent> qq :<C-u>bd<CR>
" I don't use EX mode.
nnoremap Q @q
vnoremap <silent>Q :norm @q<cr>"}}}

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
" }}}

nnoremap <Right> :<C-u>Gina diff<CR>
nnoremap <Left> :<C-u>Gina commit<CR>
nnoremap <UP> :<C-u>Gina status<CR>
nnoremap <Down> :<C-u>Gina push<CR>
" nnoremap <Down> :<C-u>call gina#custom#execute('/\%(status\|branch\|ls\|grep\|changes\|tag\)','setlocal winfixheight',)


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

" b is {{{
let g:ref_man_lang = 'ja'
" Use K to show documentation in preview window
nmap b <Plug>(ref-keyword)
" let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_stubs_command = '<leader>s'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = 'b'
let g:jedi#usages_command = '<leader>n'


" nmap <silent> <C-o> <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> g <Plug>(coc-implementation)
" nmap <leader>R <Plug>(coc-rename)

" map <leader>b :<C-u>Denite file/old -start-filter<CR>

nmap B <Nop>
xmap B <Nop>


" map B :<C-u>'<,'>Gtrans<CR>
" }}}
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
nnoremap qq :<C-u>bd<CR>

nnoremap <Leader>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
" }}}

" meta key mappings {{{

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
map  <M-;> <kPlus>
map! <M-;> <kPlus>
" map  <M-CR> +
" map! <M-CR> +
" map  Â <kPlus>
" map! Â <kPlus>

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

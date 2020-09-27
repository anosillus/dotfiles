let b:japanese_mode = 1
call plug#load(
  \ 'eblook.vim',
  \ 'autofmt',
  \ 'eskk.vim',
  \ 'deoplete.nvim'
  \)
  "\ 'jasegment.vim'
let b:coc_suggest_disable = 1

" let b:ale_textlint_options = --rule general-novel-style-ja
" setlocal filetype=jp
let b:loaded_jasegment = 0
" let b:jasegment#highlight = 2
call s:auto_goyo()

setlocal spelllang=cjk
setlocal spell
setlocal scrolloff=9999
" setlocal eventignore=hilight-idegraphic-space

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> m,  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> m?  incsearch#go(<SID>incsearch_config({'command': '?'}))


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

noremap <silent><expr> , incsearch#go(<SID>config_migemo())
noremap <silent><expr> ? incsearch#go(<SID>config_migemo({'command': '?'}))

noremap <silent> <C-i> f。
noremap <silent> <C-h> F。
nmap <silent> I <Plug>JaSegmentMoveNE
nmap <silent> i <Plug>JaSegmentMoveNW
nmap <silent> h <Plug>JaSegmentMoveNB
omap <silent> I <Plug>JaSegmentMoveOE
omap <silent> i <Plug>JaSegmentMoveOW
omap <silent> h <Plug>JaSegmentMoveOB
xmap <silent> I <Plug>JaSegmentMoveVE
xmap <silent> i <Plug>JaSegmentMoveVW
xmap <silent> h <Plug>JaSegmentMoveVB
omap <silent> ai <Plug>JaSegmentTextObjA
omap <silent> ii <Plug>JaSegmentTextObjI
xmap <silent> ai <Plug>JaSegmentTextObjVA
xmap <silent> si <Plug>JaSegmentTextObjVI

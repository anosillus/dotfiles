scriptencoding utf-8


let g:loaded_myplugin = 1
" -----------------------------------------------------------------------




"\   'python':     ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'black', 'reorder-python-imports'],

" Defx (Todo){{{
" nnoremap <silent>   [Space]p
" \ :<C-u>Defx -listed -resume -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent><buffer><expr> <CR>
" \ defx#async_action('drop')
" nnoremap <silent><buffer><expr> c
" \ defx#do_action('copy')nnoremap <silent><buffer><expr> !
" \ defx#do_action('execute_command')
" nnoremap <silent><buffer><expr> m
" \ defx#do_action('move')
" nnoremap <silent><buffer><expr> p
" \ defx#do_action('paste')
" nnoremap <silent><buffer><expr> l
" \ defx#async_action('open')
" nnoremap <silent><buffer><expr> E
" \ defx#do_action('open', 'vsplit')
" nnoremap <silent><buffer><expr> <CR>
" \ defx#do_action('open', 'vsplit')
"
" nnoremap <silent><buffer><expr> P
" \ defx#do_action('open', 'pedit')
" nnoremap <silent><buffer><expr> K
" \ defx#do_action('new_directory')
" nnoremap <silent><buffer><expr> N
" \ defx#do_action('new_file')
" nnoremap <silent><buffer><expr> M
" \ defx#do_action('new_multiple_files')
" nnoremap <silent><buffer><expr> d
" \ defx#do_action('remove_trash')
" nnoremap <silent><buffer><expr> r
" \ defx#do_action('rename')
" nnoremap <silent><buffer><expr> x
" \ defx#do_action('execute_system')
" nnoremap <silent><buffer><expr> >
" \ defx#do_action('toggle_ignored_files')
" nnoremap <silent><buffer><expr> .
" \ defx#do_action('repeat')
" nnoremap <silent><buffer><expr> yy
" \ defx#do_action('yank_path')
" nnoremap <silent><buffer><expr> h
" \ defx#do_action('cd', ['..'])
" nnoremap <silent><buffer><expr> ~
" \ defx#do_action('cd')
" nnoremap <silent><buffer><expr> \
" \ defx#do_action('cd', getcwd())
" nnoremap <silent><buffer><expr> q
" \ defx#do_action('quit')
" nnoremap <silent><buffer><expr> <Space>
" \ defx#do_action('toggle_select') . 'j'
" nnoremap <silent><buffer><expr> *
" \ defx#do_action('toggle_select_all')
" nnoremap <silent><buffer><expr> j
" \ line('.') == line('$') ? 'gg' : 'j'
" nnoremap <silent><buffer><expr> k
" \ line('.') == 1 ? 'G' : 'k'
" nnoremap <silent><buffer><expr> <C-l>
" \ defx#do_action('redraw')
" nnoremap <silent><buffer><expr> <C-g>
" \ defx#do_action('print')
" nnoremap <silent><buffer><expr> <Tab> winnr('$') != 1 ?
" \ ':<C-u>wincmd w<CR>' :
" \ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'
" " }}}
" Don't work



" ESKK {{{
set imdisable
" let g:eskk#server = {'host': 'localhost','port': 55100}
let g:eskk#server = {'host': 'localhost','port': 1178}

let g:eskk#select_cand_keys = 'arshnei'
let g:eskk#enable_completion = 1
let g:eskk#keep_state = 1
let g:eskk#statusline_mode_strings = {
	\	'hira': 'あ',
	\	'kata': 'ア',
	\	'ascii': 'aA',
	\	'zenei': 'ａ',
	\	'hankata': 'ｧｱ',
	\	'abbrev': 'aあ'
	\}
"let g:eskk#debug = 0
let g:eskk#show_annotation = 1
" let g:eskk#rom_input_style = 'msime'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#tab_select_completion = 1
let g:eskk#start_completion_length = 2
let g:eskk#marker_henkan = '<>'
let g:eskk#marker_henkan_select = '>>'
let g:jasentence_endpat = '[。．？！]\+'

augroup skk
  autocmd!
  autocmd User eskk-enable-post call s:eskk_enable_post()
    function! s:eskk_enable_post()
        EskkMap -force <S-Space> <ESC>
  endfunction

  autocmd User eskk-initialize-pre call s:eskk_initial_pre()
  function! s:eskk_initial_pre()
    let g:skk_keep_state = 1
    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
    call t.add_map('~', '～')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('tm', '™')
    call t.add_map('z ', '　')
    call t.add_map('z1', '①')
    call t.add_map('z2', '②')
    call t.add_map('z3', '③')
    call t.add_map('z4', '④')
    call t.add_map('z5', '⑤')
    call t.add_map('z6', '⑥')
    call t.add_map('z7', '⑦')
    call t.add_map('z8', '⑧')
    call t.add_map('z9', '⑨')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('tm', '™')
    call t.add_map('z ', '　')

    " "1." のように数字の後のドットはそのまま入力
    for n in range(10)
      call t.add_map(n . '.', n . '.')
    endfor
    call eskk#register_mode_table('hira', t)
  endfunction

  autocmd User eskk-enable-pre call s:eskk_enable_pre()
    function! s:eskk_enable_pre()
      " let b:coc_suggest_disable = 1
      " call  <CR>
      " call deoplete#enable()
      inoremap <expr><C-o> deoplete#auto_complete()
      inoremap <expr><C-i> deoplete#smart_close_popup()."\<C-o>"
      inoremap <expr><C-h> deoplete#undo_completion()
      inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    endfunction

  " autocmd User eskk-disable-post call s:eskk_disable()
    " function! s:eskk_disable()
      " call deoplete#disable()
      " command! -nargs=0 CocEnable
      " :CocEnable <CR>
      " let b:coc_suggest_disable = 0
    " endfunction
" augroup END

" }}}

 " COC {{{
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=10000
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <C-Space>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-e>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
 inoremap <silent><expr> <s-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
 " }}}

" let winid = popup_create("hello gorilla", {})
" vim: foldmethod=marker

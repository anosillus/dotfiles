" let g:deoplete#auto_complete_delay = 0

" <TAB>: completion.
inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <S-TAB>: completion back.
inoremap <expr><C-e>  pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr><C-h>       deoplete#refresh()
inoremap <expr><C-o>       deoplete#cancel_popup()
inoremap <silent><expr><C-i>       deoplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
endfunction

call deoplete#custom#source('_', 'matchers',
      \ ['matcher_fuzzy', 'matcher_length'])
call deoplete#custom#source('denite', 'matchers',
      \ ['matcher_full_fuzzy', 'matcher_length'])
call deoplete#custom#source('eskk', 'matchers', [])
call deoplete#custom#source('tabnine', 'rank', 600)
call deoplete#custom#source('tabnine', 'min_pattern_length', 2)
call deoplete#custom#var('tabnine', {
      \ 'line_limit': 300,
      \ 'max_num_results': 5,
      \ 'markers': ['.git/'],
      \ })

call deoplete#custom#source('fish', 'filetypes', ['fish'])

call deoplete#custom#source('nextword', 'filetypes',
      \ ['markdown', 'help', 'gitcommit', 'text'])

call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_overlap',
      \ 'converter_case',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_info',
      \ 'converter_truncate_menu',
      \ ])
call deoplete#custom#source('tabnine', 'converters', [
      \ 'converter_remove_overlap',
      \ 'converter_truncate_info',
      \ ])
call deoplete#custom#source('eskk', 'converters', [])

" call deoplete#custom#source('buffer', 'min_pattern_length', 9999)
" call deoplete#custom#source('clang', 'input_pattern', '\.\w*|\.->\w*|\w+::\w*')
" call deoplete#custom#source('clang', 'max_pattern_length', -1)

call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
      \ })

" inoremap <silent><expr> <C-t> deoplete#manual_complete('file')

call deoplete#custom#option({
      \ 'auto_refresh_delay': 10,
      \ 'camel_case': v:true,
      \ 'skip_multibyte': v:true,
      \ 'auto_preview': v:true,
      \ })
call deoplete#custom#option('num_processes', 1)

" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
" call deoplete#custom#source('clang', 'debug_enabled', 1)

call deoplete#custom#option('candidate_marks',
      \ ['A', 'R', 'S', 'T', 'D'])
inoremap <expr>A       pumvisible() ? deoplete#insert_candidate(0) : 'A'
inoremap <expr>R       pumvisible() ? deoplete#insert_candidate(1) : 'R'
inoremap <expr>S       pumvisible() ? deoplete#insert_candidate(2) : 'S'
inoremap <expr>T       pumvisible() ? deoplete#insert_candidate(3) : 'T'
inoremap <expr>D       pumvisible() ? deoplete#insert_candidate(4) : 'D'

autocmd MyAutoCmd BufEnter * call s:tabnine_check()
function! s:tabnine_check() abort
  if finddir('.git') !=# ''
    return
  endif
  " Disable tabnine source
  call deoplete#custom#buffer_option('ignore_sources', ['tabnine'])
endfunction
call s:tabnine_check()

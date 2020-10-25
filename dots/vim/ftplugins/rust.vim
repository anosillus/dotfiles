function! s:search_under_cursor(query) range
  if a:query ==# ''
    echomsg 'rust-doc: No identifier is found under the cursor'
    return
  endif

  call rust_doc#open_fuzzy(a:query)
endfunction

nnoremap <buffer><silent>b :<C-u>call <SID>search_under_cursor(expand('<cword>'))<CR>
vnoremap <buffer><silent>b "gy:call <SID>search_under_cursor(getreg('g'))<CR>

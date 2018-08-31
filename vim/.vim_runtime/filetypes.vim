""""""""""""""""""""""""""""""
" => JS, HTML, CSS
""""""""""""""""""""""""""""""

au FileType javascript,html,css
    \ setl tabstop=2 |
    \ setl softtabstop=2 |
    \ setl shiftwidth=2 |
    \ setl nowrap


""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""

au FileType python
    \ setl tabstop=4 |
    \ setl softtabstop=4 |
    \ setl shiftwidth=4 |
    \ setl textwidth=79 |
    \ setl expandtab |
    \ setl autoindent |
    \ setl fileformat=unix |
    \ autocmd BufWritePost *.py call Flake8() |
    \ nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<cr>

" My func RelatedFile(for Django Projects)
nnoremap <leader>1 :call RelatedFile ("models.py")<cr>
nnoremap <leader>2 :call RelatedFile ("views.py")<cr>
nnoremap <leader>3 :call RelatedFile ("urls.py")<cr>
nnoremap <leader>4 :call RelatedFile ("forms.py")<cr>
nnoremap <leader>5 :call RelatedFile ("admin.py")<cr>
nnoremap <leader>6 :call RelatedFile ("tests.py")<cr>
nnoremap <leader>7 :call RelatedFile ("templates/")<cr>
nnoremap <leader>0 :e settings.py<cr>
nnoremap <leader>9 :e urls.py<cr>

let g:last_relative_dir = ''
fun! RelatedFile(file)
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun! SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun

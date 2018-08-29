""""""""""""""""""""""""""""""
" => For easy writing and
" browsing notes
""""""""""""""""""""""""""""""

function! Notes()
    let notes_dir = '~/notes'
    if $TERMUX == 1
        let notes_dir = '~/storage/shared/notes'
    endif
    exec 'lcd' l:notes_dir
    exec 'CtrlP' l:notes_dir
endfunction
command! Notes :call Notes()
nnoremap <leader>n :Notes<cr>

"""""""""""""""""""""""""""""
" => Custom mapping for
" NERDTree
"""""""""""""""""""""""""""""

autocmd VimEnter * call NERDTreeAddKeyMap({
    \ 'key': 'do',
    \ 'callback': 'NERDTreeOpenDjangoApp',
    \ 'quickhelpText': 'open django app with split' })

function! NERDTreeOpenDjangoApp()
    let list_of_files = ['urls.py', 'views.py', 'tests.py', 'models.py']
    let n = g:NERDTreeFileNode.GetSelected()
    NERDTreeClose
    if n != {}
        if n.path.isDirectory
            for name_of_file in list_of_files
                let l:file_path = '/'. join(n.path.pathSegments, '/'). '/'. name_of_file
                execute 'split '.file_path
            endfor
            let l:name_of_tab = n.path.pathSegments[-1]
            execute 'TabooRename ' . name_of_tab
        else
            echo "It's not directory"
        endif
    endif
endfunction

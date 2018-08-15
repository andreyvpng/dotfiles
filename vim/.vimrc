"=====================================================
" Plugins
"=====================================================

call plug#begin('~/.vim/plugged')
    " Project navigation
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'
    Plug 'ctrlpvim/ctrlp.vim'
    " HTML
    Plug 'mattn/emmet-vim'
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'xuyuanp/nerdtree-git-plugin'
    " Other
    Plug 'jiangmiao/auto-pairs'
    Plug 'ervandew/supertab'
    " Zen
    Plug 'junegunn/goyo.vim'
    Plug 'amix/vim-zenroom2'
    " Python
    Plug 'davidhalter/jedi-vim'
    Plug 'klen/python-mode'
    Plug 'plytophogy/vim-virtualenv'
    " Style
    Plug 'chriskempson/base16-vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

"=====================================================
" General settings
"=====================================================

" auto apply settings after save vimrc
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

set nowrap 
set encoding=UTF-8
syntax on                   " enable syntax highlighting
set number                  " show line numbers
set ts=4                    " set tabs to have 4 spaces
set autoindent              " indent when moving to the next line while writing code
set expandtab               " expand tabs into spaces
set shiftwidth=4            " when using the >> or << commands, shift lines by 4 spaces
set cursorline              " show a visual line under the cursor's current line
set showmatch               " show the matching part of the pair for [] {} and ()
set nofoldenable            " disable folding 
set clipboard=unnamedplus   " use the system clipboard for copy and paste

"=====================================================
" Mapping
"=====================================================

let mapleader = '\'

" Use {number}gt for navigation tabs
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>

imap jk <ESC>

"=====================================================
" Settings of plugins
"=====================================================

" EasyMotion

    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    let g:EasyMotion_smartcase = 1

    nmap s <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)"

" Python-mode

    let g:pymode_rope = 0           " Disable autocomplete
    let g:pymode_rope_completion = 0
    let g:pymode_rope_complete_on_dot = 0

    let g:pymode_doc = 0            " Documentation 
    let g:pymode_doc_key = 'K'

    let g:pymode_lint = 1           " Check of code
    let g:pymode_lint_checker = "pyflakes,pep8"
    let g:pymode_lint_ignore="E501,W601,C0110"

    let g:pymode_lint_write = 1     " Check of code after save

    let g:pymode_virtualenv = 1     " virtualenv

    let g:pymode_breakpoint = 1     " breakpoints
    let g:pymode_breakpoint_key = '<leader>b'

    let g:pymode_syntax = 1         " syntax
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    let g:pymode_syntax_space_errors = g:pymode_syntax_all

    let g:pymode_folding = 0
    let g:pymode_run = 0

" NERDTree

    let NERDTreeShowHidden=1
    let NERDTreeWinSize=38
    let NERDTreeMinimalUI=1
    let NERDTreeDirArrowExpandable='+'
    let NERDTreeDirArrowCollapsible='~'

    let NERDTreeIgnore=['__pycache__', '.idea',]

    map <C-n> :NERDTreeToggle<CR>

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
                execute "normal! \<c-w>H"
            else
                echo "It's not directory"
            endif
        endif
    endfunction

" Ctrlp
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'

" Goyo
    map <leader>z :Goyo<CR>
    let g:goyo_width = 100
    let g:goyo_height = 30

" Tagbar
    nmap <F8> :TagbarToggle<CR>

" Emmet
    let g:user_emmet_leader_key=','

"=====================================================
" Functions
"=====================================================

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! Notes()
    let notes_dir = '~/notes'
    exec 'lcd' l:notes_dir
    exec 'CtrlP' l:notes_dir
endfunction
command! Notes :call Notes()
nnoremap <leader>n :Notes<CR>

"=====================================================
" vimrc backgroud
"=====================================================

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

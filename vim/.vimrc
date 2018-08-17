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
    Plug 'elentok/plaintasks.vim'
    " Zen
    Plug 'junegunn/goyo.vim'
    Plug 'amix/vim-zenroom2'
    " Python
    "Plug 'davidhalter/jedi-vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'plytophogy/vim-virtualenv'
    Plug 'vim-scripts/indentpython.vim'
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

"style

" For full syntax highlighting:
let python_highlight_all=1
syntax on

set nowrap
set number                  " show line numbers
set relativenumber
set cursorline              " show a visual line under the cursor's current line
set showmatch               " show the matching part of the pair for [] {} and ()
set nofoldenable            " disable folding 

" Tab settings
set autoindent              " indent when moving to the next line while writing code
set expandtab               " expand tabs into spaces
set tabstop=4               " set tabs to have 4 spaces
set softtabstop=4
set shiftwidth=4            " when using the >> or << commands, shift lines by 4 spaces

" search
set incsearch
set ignorecase
set smartcase

set encoding=UTF-8
set matchtime=1
set clipboard=unnamedplus   " use the system clipboard for copy and paste

"=====================================================
" Mapping
"=====================================================

let mapleader = '\'

" uppercase
inoremap <c-u> <ESC>viwUwi
nnoremap <c-u> <ESC>viwU

" tabs
" Use {number}gt for navigation tabs
nnoremap <leader>+ :tabnew<cr>
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

" wrap
nnoremap <leader>W :set wrap!<cr>

" surround the word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" disable arrow keys
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
inoremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Right> <Nop>

inoremap jk <ESC>
inoremap <esc> <nop>

"=====================================================
"  Abbreviations
"=====================================================

iabbrev an@ andrey-varfolomeev@protonmail.com

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

" NERDTree

    let NERDTreeShowHidden=1
    let NERDTreeWinSize=38
    let NERDTreeMinimalUI=1
    let NERDTreeDirArrowExpandable='+'
    let NERDTreeDirArrowCollapsible='~'

    let NERDTreeIgnore=['__pycache__', '.idea', '*.swp']

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

" YCM
    let g:ycm_autoclose_preview_window_after_completion=1
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

    
    " https://github.com/Valloric/YouCompleteMe/issues/380#issuecomment-88398601
    "" function to list virtualenvs
    fun! ReturnVirtualEnvs(A,L,P)
        return system("ls -d ~/.virtualenvs/*/ \| cut -d'/' -f5")
    endfun

    "" changing virtualenv should restart ycmserver
    command! -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer

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
    if $TERMUX == 1
        let notes_dir = '~/storage/shared/notes'
    endif
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

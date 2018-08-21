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
    Plug 'gcmt/taboo.vim'
    Plug 'tmhedberg/SimpylFold'
    " Organize
    Plug 'mrtazz/vim-plan'
    Plug 'elentok/plaintasks.vim'
    " Zen
    Plug 'junegunn/goyo.vim'
    Plug 'amix/vim-zenroom2'
    " Python
    "Plug 'davidhalter/jedi-vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'plytophogy/vim-virtualenv'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'nvie/vim-flake8'
    " Style
    Plug 'chriskempson/base16-vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

"=====================================================
" vimrc backgroud
"=====================================================

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

"=====================================================
"  Autocmd
"=====================================================

augroup VIMRC
    " auto apply settings after save vimrc
    autocmd! bufwritepost $MYVIMRC source $MYVIMRC

    autocmd BufWritePost *.py call Flake8()

    autocmd BufWritePost * GitGutter

    au BufNewFile,BufRead *.py
        \ setl tabstop=4 |
        \ setl softtabstop=4 |
        \ setl shiftwidth=4 |
        \ setl textwidth=79 |
        \ setl expandtab |
        \ setl autoindent |
        \ setl fileformat=unix

    au BufNewFile,BufRead *.js,*.html,*.css
        \ setl tabstop=2 |
        \ setl softtabstop=2 |
        \ setl shiftwidth=2

    " Create dir
    autocmd BufWritePre *
        \ if !isdirectory(expand("<afile>:p:h")) |
        \   call mkdir(expand("<afile>:p:h"), "p") |
        \ endif

    " Comment
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
augroup END

"=====================================================
" General settings
"=====================================================

"style
set sessionoptions+=tabpages,globals
" For full syntax highlighting:
let python_highlight_all=1
syntax on

set nowrap
set number                  " show line numbers
set relativenumber
set cursorline              " show a visual line under the cursor's current line
set showmatch               " show the matching part of the pair for [] {} and ()
set foldmethod=indent
set foldlevel=99

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

let mapleader=' '
let maplocalleader='\'

" uppercase
inoremap <c-u> <ESC>viwUea
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

inoremap jk <ESC>
inoremap <esc> <nop>

"dp - delete paramenters
onoremap p i(

" Editing vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>

" vim-plan
nnoremap <leader>pw :OpenWeekPlan<CR>
noremap <leader>pm :OpenMonthPlan<CR>
noremap <leader>py :OpenYearPlan<CR>
noremap <leader>pd :Today<CR>
noremap <leader>pt :Timestamp<CR>

" EasyMotion
map s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
" Goya
nnoremap <leader>z :Goyo<CR>

" YCM
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" My func WinMove
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

" My func Notes
nnoremap <leader>n :Notes<CR>

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

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeWinSize=38
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'

let NERDTreeIgnore=['__pycache__', '.idea', '*.swp']

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

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Goyo
let g:goyo_width = 100
let g:goyo_height = 30

" Emmet
let g:user_emmet_leader_key=','

" YCM
let g:ycm_autoclose_preview_window_after_completion=1

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
    
" https://github.com/Valloric/YouCompleteMe/issues/380#issuecomment-88398601
"" function to list virtualenvs
fun! ReturnVirtualEnvs(A,L,P)
    return system("ls -d ~/.virtualenvs/*/ \| cut -d'/' -f5")
endfun

"" changing virtualenv should restart ycmserver
command! -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer

" Flake8
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1
let g:flake8_show_quickfix=1
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
let g:flake8_naming_marker=''      " disable naming warnings

"=====================================================
" Functions
"=====================================================

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

command! Timestamp execute 'normal o### '.strftime("%I:%M%p")

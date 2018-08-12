"=====================================================
" Plugins
"=====================================================

call plug#begin('~/.vim/plugged')
    " Project navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'
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

set wrap 

set encoding=UTF-8

syntax on
" enable syntax highlighting
syntax enable
" show line numbers
set number
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" disable folding 
set nofoldenable

set clipboard=unnamedplus
" auto apply settings after save vimrc
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"=====================================================
" Mapping
"=====================================================

let mapleader = ","

map <C-C> "+y
map <C-P> "+p
nmap <F8> :TagbarToggle<CR>
map <leader>tt :tabnew<CR>
map <leader>tw :tabclose<CR>
map <leader>tn :tabnext<CR>

map <leader>z :Goyo<CR>

imap jk <ESC>

"=====================================================
" NERDTree
"=====================================================

map <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'

"=====================================================
" EasyMotion
"=====================================================

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
"" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"

"=====================================================
" WinMove
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

"=====================================================
" vimrc backgroud
"=====================================================

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"=====================================================
" Python-mode settings
"=====================================================

" Disable autocomplete
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Documentation 
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" Check of code
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" Check of code after save
let g:pymode_lint_write = 1

" virtualenv
let g:pymode_virtualenv = 1

" breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0
let g:pymode_run = 0

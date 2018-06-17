call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'davidhalter/jedi-vim'
    Plug 'chriskempson/base16-vim'
    Plug 'mattn/emmet-vim'
    "Plug 'klen/python-mode'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

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

map <C-C> "+y
map <C-P> "+p

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set clipboard=unnamedplus

autocmd! bufwritepost $MYVIMRC source $MYVIMRC


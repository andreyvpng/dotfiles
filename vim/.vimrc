call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'davidhalter/jedi-vim'
	Plug 'chriskempson/base16-vim'
	Plug 'mattn/emmet-vim'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

syntax on

set nocompatible

set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set expandtab
set smartindent
set textwidth=80

set ignorecase
set smartcase
set hlsearch
set incsearch

set nu
set linebreak
set hidden
set incsearch
set history=50

set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a 

map <C-C> "+y
map <C-P> "+p

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set clipboard=unnamedplus

autocmd! bufwritepost $MYVIMRC source $MYVIMRC


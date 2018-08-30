"""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""

set nocompatible
" Sets how many line of history VIM has to remember
set history=500
" Sets to auto read when a file is changed from a outside
set autoread
" Ignore compiled files
set wildignore=*.o,*.pyc,*/.git

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Set uftf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowb
set noswapfile

" Show matching brackets when text indicator is over them
set showmatch

" Tab settings
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" wrap
set wrap

augroup VIMRC_basic
    " Auto source vimrc
    autocmd! bufwritepost $MYVIMRC,~/.vim_runtime/*.vim source ~/.vimrc
    autocmd BufWritePre *
        \ if !isdirectory(expand("<afile>:p:h")) |
        \   call mkdir(expand("<afile>:p:h"), "p") |
        \ endif
augroup END

" Use the system clipboard for copy and paste
set clipboard=unnamedplus


"""""""""""""""""""""""""""""
" => Style
"""""""""""""""""""""""""""""

syntax on

colorscheme delek

"set termguicolors
set t_Co=256

set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

if has('gui_running')
    set guioptions-=T " no toolbar
    set guioptions-=m " no menu
    set guioptions-=r " no right scroll
    set guioptions-=L " no left scroll
endif

" Always show current position
set ruler

" How many tenths of a second to blink when matching brackets
set mat=2

" show a visual line under the cursor's current line
set cursorline

" disable folding 
set nofoldenable


"""""""""""""""""""""""""""""
" => General mapping
"""""""""""""""""""""""""""""

let mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>
" Fast quit
nnoremap <leader>q :q<cr>
" Fast quit all windows
nnoremap <leader>aq :qall<cr>

" Fix common typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" uppercase
inoremap <c-u> <ESC>viwUea
nnoremap <c-u> <ESC>viwU

" toggle wrap
nnoremap <leader>W :set wrap!<cr>

" toggle relativenumber
nnoremap <leader>N :set relativenumber!<cr>

"""""""""""""""""""""""""""""
" => Moving
"""""""""""""""""""""""""""""

" map to search
nnoremap <space> /
nnoremap <c-space> ?
map / :echo "no god! please nooo!"<cr>
map ? :echo "no god! please nooo!"<cr>


" mapping for tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" switch CWD
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" moving between windows
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""
" => Spell Checking
"""""""""""""""""""""""""""""

nnoremap <leader>ss :setlocal spell! spelllang=ru_ru,en_us<cr>


"""""""""""""""""""""""""""""
" => Function
"""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

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

function! WordProcessorMode()
    setlocal spell spelllang=ru_ru,en_us
    setlocal wrap
    setlocal linebreak
    setlocal nolist
    " russian keyboard
    set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\«ZXCVBNM<>
    set iminsert=0
    set imsearch=0
endfu
command! WP call WordProcessorMode()
nnoremap WP :WP<cr>

command! Timestamp execute 'normal o### '.strftime("%I:%M%p")
noremap <leader>pt :Timestamp<CR>
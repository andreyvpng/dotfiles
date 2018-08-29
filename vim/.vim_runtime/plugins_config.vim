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
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'
" Organize
Plug 'mrtazz/vim-plan'
Plug 'elentok/plaintasks.vim'
" Snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Zen
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
" Python
Plug 'davidhalter/jedi-vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
" Style
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Game
Plug 'johngrib/vim-game-code-break'
call plug#end()

" EasyMotion
map s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=28
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'
let NERDTreeIgnore=['__pycache__', '.idea', '*.swp']

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Goyo
nnoremap <leader>z :Goyo<CR>

let g:goyo_width = 100
let g:goyo_height = 30

" Emmet
let g:user_emmet_leader_key='.'

" Flake8
autocmd BufWritePost *.py call Flake8()
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

" Sessions
nnoremap <leader>os :OpenSession<cr>

let g:session_autosave="yes"
let g:session_autoload="no"
let g:session_command_aliases = 1

" Snips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" gitgutter
autocmd BufWritePost * GitGutter
let g:gitgutter_sign_added = '│' " U+2502
let g:gitgutter_sign_removed = '│' " U+2502
let g:gitgutter_sign_removed_first_line = '│' " U+2502
let g:gitgutter_sign_modified = '│' " U2
let g:gitgutter_sign_modified_removed = '│' " U+2502

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" vim-plan
nnoremap <leader>pw :OpenWeekPlan<CR>
noremap <leader>pm :OpenMonthPlan<CR>
noremap <leader>py :OpenYearPlan<CR>
noremap <leader>pd :Today<CR>

" Airline
let g:airline_theme='base16_default'
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

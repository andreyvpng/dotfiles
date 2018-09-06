call plug#begin('~/.vim/plugged')

" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/bufexplorer.zip'

" HTML
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'cohama/agit.vim'

" Organize
Plug 'mrtazz/vim-plan'
Plug 'elentok/plaintasks.vim'

" Code
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Zen
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Python
"Plug 'davidhalter/jedi-vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'fisadev/vim-isort'

" Style
"Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Other
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'amix/open_file_under_cursor.vim'

call plug#end()

" Colorscheme
let base16colorspace=256
colorscheme gruvbox

" EasyMotion
map s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=28
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable='🗀'
let NERDTreeDirArrowCollapsible='🗁'
let NERDTreeIgnore=['__pycache__', '.idea', '*.swp']

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Goyo
nnoremap <leader>z :Goyo<CR>

let g:goyo_width = 100
let g:goyo_height = 30

" Emmet
let g:user_emmet_leader_key=','

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

" Sessions
nnoremap <leader>so :SessionOpen<cr>
nnoremap <leader>sc :SessionClose<cr>
nnoremap <leader>ss :SessionSave<cr>

let g:session_autosave="yes"
let g:session_autoload="no"
let g:session_command_aliases = 1

" Snips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" gitgutter
nnoremap <leader>gt :GitGutterToggle<cr>

autocmd BufWritePost * GitGutter

let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_async = 1

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
let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 0

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#virtualenv#enabled = 0

let g:airline_section_a = airline#section#create_right(['mode'])
let g:airline_section_b = airline#section#create_right(['branch'])
let g:airline_section_c = airline#section#create_right(['%f'])
let g:airline_section_x = airline#section#create_right(['%{virtualenv#statusline()}'])
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create_right(['%l, %c'])


" MRU
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['flake8'],
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 1

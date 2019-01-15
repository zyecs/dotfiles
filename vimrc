"if has("gui_running")
    "set lines=999 columns=999
"else
    "if exists("+lines")
        "set lines=50
    "endif
    "if exists("#columns")
        "set columns=100
    "endif
"endif

let mapleader=';'

set encoding=utf-8
set termencoding=utf-8

set t_Co=256
set mouse=a
set clipboard=unnamed
"set wrap
"set linebreak
"set wrapmargin=2
set nowrap

set nocompatible
set nu
set relativenumber
set wildmode=list:longest
set wildmenu
set wildchar=<Tab> wildcharm=<C-Z>
set ruler
set cursorline
set cursorcolumn

filetype plugin on

filetype indent on

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set bs=2
set laststatus=2

" incremental search
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

set spell spelllang=en_us

syntax on
syntax enable

nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

ca w!! w !sudo tee "%"

" keep cursor 5 lines away from the screen border
set scrolloff=5

" allow hidden the buffer that has been changed
set hidden

" mapping keys
nmap LB 0
nmap LE $
" enable the function that paste content from system clipboard
nmap <Leader>p "+p
nmap <Leader>M %
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" for sub windows
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-d> <Del>

nnoremap <silent> bl :ls<CR>
nnoremap <silent> bo :enew<CR>
nnoremap <silent> bn :bnext<CR>
nnoremap <silent> bp :bprevious<CR>
nnoremap <silent> bd :bdelete<CR>

nnoremap :vsb :vertical sb
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" code folding
set foldmethod=syntax
set nofoldenable

"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//

set autochdir
set history=1000
set autoread
set listchars=tab:»■,trail:■
set list

" setup for vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'derekwyatt/vim-protodef'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'osyo-manga/vim-anzu'
Plugin 'vim-scripts/mru'
Plugin 'luochen1990/rainbow'
Plugin 'dominikduda/vim_current_word'
Plugin 'matze/vim-move'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/vim-easy-align'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'python-mode/python-mode', { 'branch': 'develop' }
Plugin 'jiangmiao/auto-pairs'
call vundle#end()
filetype plugin indent on

set background=dark
if (has("termguicolors"))
    colorscheme space-vim-dark
endif
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

if (has('gui_running'))
    let g:space_vim_dark_background = 235
    color space-vim-dark
    let g:airline_powerline_fonts = 1
    set guifont=Iosevka\ Term:h14
    set guioptions=egmrt
endif

let g:Powerline_colorscheme='base16_spacemacs'

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" For airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_theme="sierra"
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" enable rainbow pair
let g:rainbow_active = 1
" For anzu
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" Statusline
set statusline=%{anzu#search_status()}

" vim current word
let g:vim_current_word#enabled = 1
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1

" vim easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" For python-mode plugin
let g:pymode_python='python3'
let g:pymode_warnings = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_virtualenv = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
let g:pymode_rope_rename_bind = '<C-r>rr'
let g:pymode_rope_rename_module_bind = '<C-r>r1r'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" for vim-move
let g:move_key_modifier = 'C'

" auto save and reload
autocmd BufWritePost $MYVIMRC source $MYVIMRC

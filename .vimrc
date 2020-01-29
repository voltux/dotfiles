call plug#begin()

"Navigation
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'wesQ3/vim-windowswap'
Plug 'Shougo/unite.vim'
Plug 'regedarek/ZoomWin'
Plug 'junegunn/vim-peekaboo'

"Editor
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'
Plug 'flazz/vim-colorschemes'
Plug 'Julian/vim-textobj-variable-segment'

"Autocompletion
Plug 'ajh17/VimCompletesMe'

"Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'

call plug#end()

"-----------------General Settings---------------

set nocompatible
set backspace=indent,eol,start
syntax enable
set number
set relativenumber
set wildmenu
set wildignorecase
set wildignore+=.pyc,.swp
filetype plugin indent on

"no error bells
set noerrorbells

"show commands as they are typed
set showcmd

"default places for opening splits
set splitbelow
set splitright

"colors
set background=dark
set cursorline
"colorscheme voltus

"activate mouse
set mouse=a

"keywordprg, how will 'K' react (default is man)
set kp=

"Search down into subfolders
"Provides tab completion for all related tasks
set path+=**

"set leader key
let mapleader = "\<Space>"

"-----------------System Key Bindings---------------------

"set abbreviations for common typos
cnoreabbrev   Q    q
cnoreabbrev   W    w
cnoreabbrev   Wq   wq
cnoreabbrev   wQ   wq
cnoreabbrev   WQ   wq
cnoreabbrev   Qa   qa

"move between splits
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

"change current dir to current file pwd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"copy paste between different programs/windows/tabs
set clipboard=unnamedplus

"editor settings
set ignorecase
set smartcase
set history=1000
set autoread
set confirm
set formatoptions+=j
set noswapfile
set pastetoggle=<F7>
set mousemodel=popup_setpos
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set tags=./tags;/
set hidden "hides unsaved files open in buffers instead of closing them, undo possible
set title
set noshowmode
set ttimeoutlen=0 "timeout time for Esc to pass to normal mode -> instantaneous

"search settings
set nohlsearch          " do not highlight searched-for phrases
set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default"

"undo settings
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"Basically you press * or # to search for the current selection
vnoremap <silent> *  : call VisualSearch('f')<CR>
vnoremap <silent> #  : call VisualSearch('b')<CR>
vnoremap <silent> gv : call VisualSearch('gv')<CR>

" Copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p

" Find and replace in the whole file
nnoremap <leader>fr :%s/

"folding zf to create fold, za to toggle
set nofoldenable
set foldmethod=indent
set foldlevelstart=20
hi Folded ctermbg=016

"new splits
nnoremap <leader>vv :vnew<CR>
nnoremap <leader>vs :new<CR>

"gui settings
if has("gui_running")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=M
    set lines=999 columns=999
    colorscheme gruvbox
    set guifont=Monaco\ for\ Powerline\ 9
endif

"Recognizing latex files
let g:tex_flavor='latex'

"Filetypes
au BufNewFile,BufRead *.pri setf idlang

"Resize
nnoremap <leader><Up> :resize +10 <CR>
nnoremap <leader><Down> :resize -10 <CR>
nnoremap <leader><Right> :vertical resize +10 <CR>
nnoremap <leader><Left> :vertical resize -10 <CR>


"----------------------Language Settings----------------------

nmap <leader>lg :set keymap=greek_utf-8<CR>
nmap <leader>le :set keymap&<CR>
nmap <leader>lcg :setlocal spell spelllang=el<CR>
nmap <leader>lce :setlocal spell spelllang=en<CR>
nmap <leader>lcf :setlocal spell spelllang=fr<CR>
nmap <leader>ll  :set nospell<CR>

inoremap ;a à
inoremap ;z â
inoremap ;b ä
inoremap ;c ç
inoremap ;w ê
inoremap ;e é
inoremap ;f ë
inoremap ;r è
inoremap ;i î
inoremap ;j ï
inoremap ;o ô
inoremap ;p ö
inoremap ;q «  »<Esc>hi
inoremap ;u ù
inoremap ;y û
inoremap ;t ü

"----------------------Plugin Configuration-------------------

"Find things with fzf
nnoremap <leader>fr :%s/
nnoremap <leader>fp :Colors<CR>
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fw :BLines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fg :GFiles?<CR>
nnoremap <leader>f' :Marks<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>b  :Unite buffer<CR>


"Nerdtree
nmap <leader>n :NERDTreeToggle<CR>

"Tagbar
nmap <leader>m :TagbarToggle<CR>
let g:tagbar_autofocus=1

"Run shortcuts and bindings
nnoremap <F8> <NOP>
autocmd Filetype zsh,bash,sh nmap <F8> :w <CR> :!source % <CR>
autocmd Filetype c,cpp nmap <F8> :w <CR> :!g++ -std=c++11 % -o %< && ./%< <CR>
autocmd Filetype python nmap <F8> :w <CR> :!python3 %<CR>
autocmd Filetype python vmap <F8> !python3<CR>
autocmd Filetype julia nmap <F8> :w <CR> :!julia % <CR>
autocmd Filetype haskell nmap <F8> :w <CR> :!runhaskell %< % <CR>

"Auto-pairs
let g:AutoPairsShortcutToggle = '<leader>)'

"Airline
let g:airline_theme="jellybeans"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_left_sep         = ''
let g:airline_left_alt_sep     = ''
let g:airline_right_sep        = ''
let g:airline_right_alt_sep    = ''
let g:airline_symbols.branch   = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr   = ''

"ZoomWin
nmap <leader>z <C-w>o

"Whitespace
highlight ExtraWhitespace ctermbg=4
nmap <leader>wh :StripWhitespace<CR>

"Undotree
nnoremap <leader>u :UndotreeToggle<cr>

"Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1

"Tabular
vmap <leader>t :Tabularize/


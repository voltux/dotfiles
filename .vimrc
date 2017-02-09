call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-pyref'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
Plug 'regedarek/ZoomWin'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'ternjs/tern_for_vim'
Plug 'wesQ3/vim-windowswap'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/octave.vim--'
Plug 'derekwyatt/vim-scala'
Plug 'jpalardy/vim-slime'
"Plug 'nvie/vim-flake8'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'maralla/completor.vim'
Plug 'davidhalter/jedi-vim'

call plug#end()
"-----------------General Settings---------------

set nocompatible
hi Normal ctermbg=none
syntax enable
syntax on
set relativenumber
filetype plugin indent on

"colors
set background=dark
colorscheme voltus

"activate mouse
set mouse=a

"Search down into subfolders
"Provides tab completion for all related tasks
set path+=**

"set leader key
let mapleader = ","

"view man pages in vim
runtime! ftplugin/man.vim

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

"copy paste between different programs/windows/tabs
set clipboard=unnamed

"editor settings
set ignorecase
set smartcase
set history=1000
set autoread
set pastetoggle=<F7>
set mousemodel=popup_setpos
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set tags=./tags;/
set textwidth=80
set hidden "hides unsaved files open in buffers instead of closing them, undo possible

"undo settings
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"Basically you press * or # to search for the current selection
vnoremap <silent> *  : call VisualSearch('f')<CR>
vnoremap <silent> #  : call VisualSearch('b')<CR>
vnoremap <silent> gv : call VisualSearch('gv')<CR>

" Fast saving
nnoremap <leader>s :w<cr>

" Fast quit
nnoremap <leader>q :q<cr>

" New vertical split, horizontal split, tab, and movement
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>v :vnew<cr>
nnoremap <leader>h :new<cr>

" Copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p

" Find and replace in the whole file
nnoremap <leader>fr :%s/

"Find things with fzf
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fg :GFiles?<CR>

"gui settings
"set guioptions-=T
"set guioptions-=l
"set guioptions-=L
"set guioptions-=r
"set guioptions-=R
"set guioptions-=m
"set guioptions-=M
if has("gui_running")
    set lines=999 columns=999
    colorscheme molokai
    "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular\ 15
    set guifont=Monaco\ For\ Powerline\ Regular\ 10
endif
map <silent> <F11>
            \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR> "make gvim fullscreen

"search settings
"set nohlsearch          " do not highlight searched-for phrases
"set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default"

"folding zf to create fold, za to toggle
set nofoldenable
set foldmethod=manual
set foldlevelstart=20
hi Folded ctermbg=016

"Recognizing latex files
let g:tex_flavor='latex'

"----------------------Language Settings----------------------

nmap <leader>lg :set keymap=greek_utf-8<CR>
nmap <leader>le :set keymap&<CR>

map! ;a à
map! ;z â
map! ;b ä
map! ;c ç
map! ;w è
map! ;e é
map! ;f ë
map! ;r ê
map! ;i ï
map! ;j î
map! ;o ô
map! ;p ö
imap ;q «  »<Esc>hi
map! ;t ù
map! ;u û
map! ;v ü

"----------------------Plugin Configuration-------------------

"Nerdtree configuration
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>n :NERDTreeTabsToggle<CR>

"Tagbar Config
nmap <leader>m :TagbarToggle<CR>

"Compiler shortcuts and bindings
nnoremap <F8> <NOP>
autocmd Filetype zsh,bash,sh nmap <F8> :w <CR> :!source % <CR>
autocmd Filetype c,cpp nmap <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
autocmd Filetype python nmap <F8> :w <CR> :!python %<CR>
autocmd Filetype python vmap <F8> !python<CR>
autocmd Filetype julia nmap <F8> :w <CR> :!julia % <CR>
autocmd Filetype haskell nmap <F8> :w <CR> :!ghc -o %< % <CR>

"Auto-pairs shortcuts
let g:AutoPairsShortcutToggle = '<leader>)'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

"airline setup
"let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
" airline symbols
let g:airline_left_sep         = ''
let g:airline_left_alt_sep     = ''
let g:airline_right_sep        = ''
let g:airline_right_alt_sep    = ''
let g:airline_symbols.branch   = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr   = ''

"ZoomWin
nmap <leader>z <C-w>o

"whitespace
highlight ExtraWhitespace ctermbg=78
nmap <leader>wh :StripWhitespace<CR>

"buffergator
let g:buffergator_suppress_keymaps=1
map <leader>b :BuffergatorToggle<CR>

"easytags
let g:easytags_async = 1

"Undotree
nnoremap <leader>u :UndotreeToggle<cr>

"Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

"Pyref
:let g:pyref_mapping = 'K'
":let g:pyref_python  = '/usr/share/doc/python3.5-doc/html/'

"Ack
cnoreabbrev Ack Ack!
nnoremap <leader>fa :Ack!<space>

"Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

"Completor
let g:completor_python_binary = '/usr/lib/python3'
let g:completor_clang_binary = '/use/bin/clang'
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"jedi
autocmd FileType python setlocal completeopt+=preview

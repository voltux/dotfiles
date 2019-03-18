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
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-peekaboo'

"Commands
Plug 'tpope/vim-eunuch'

"Editor
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
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
Plug 'mboughaba/i3config.vim'
Plug 'flazz/vim-colorschemes'

"Autocompletion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'ajh17/VimCompletesMe'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'

"Misc
Plug 'xolox/vim-misc'
Plug 'Shougo/vimproc.vim'
Plug 'xolox/vim-easytags'

"Language specific
Plug 'JuliaEditorSupport/julia-vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/octave.vim--'
Plug 'derekwyatt/vim-scala'
Plug 'jceb/vim-orgmode'
Plug 'chrisbra/csv.vim'
Plug 'mattn/emmet-vim'

call plug#end()

"-----------------General Settings---------------

set nocompatible
hi Normal ctermbg=none
syntax enable
syntax on
set number
set relativenumber
set cursorline
set wildignorecase
filetype plugin indent on

"default places for opening splits
set splitbelow
set splitright

"colors
colorscheme voltus

"activate mouse
set mouse=a

"keywordprg, how will 'K' react (default is man)
set kp=

"Search down into subfolders
"Provides tab completion for all related tasks
set path+=**

"Centralize backup and swap directories
"set backup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp

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
set hidden "hides unsaved files open in buffers instead of closing them, undo possible
set textwidth=120
set noshowmode
set title

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

"Find things with fzf
nnoremap <leader>fr :%s/
nnoremap <leader>fp :Colors<CR>
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fg :GFiles?<CR>
nnoremap <leader>f' :Marks<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>b  :Unite buffer<CR>

"gui settings
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M
if has("gui_running")
    set lines=999 columns=999
    set background=dark
    colorscheme Tomorrow-Night
    set guifont=Monaco\ 10
endif
"map <silent> <F11>
            "\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR> "make gvim fullscreen

"search settings
"set nohlsearch          " do not highlight searched-for phrases
set incsearch           " ...but do highlight-as-I-type the search string
set hlsearch
set gdefault            " this makes search/replace global by default"
nnoremap <leader>/ :nohl<CR>

"folding zf to create fold, za to toggle
set nofoldenable
set foldmethod=manual
set foldlevelstart=20
hi Folded ctermbg=016

"Recognizing latex files
let g:tex_flavor='latex'

"Filetypes
au BufNewFile,BufRead *.pri setf idlang

"Resize
nnoremap <S-Up> :resize +2 <CR>
nnoremap <S-Down> :resize -2 <CR>
nnoremap <S-Right> :vertical resize +2 <CR>
nnoremap <S-Left> :vertical resize -2 <CR>

"----------------------Language Settings----------------------

nmap <leader>lg :set keymap=greek_utf-8<CR>
nmap <leader>le :set keymap&<CR>
nmap <leader>lcg :setlocal spell spelllang=el<CR>
nmap <leader>lce :setlocal spell spelllang=en<CR>
nmap <leader>lcf :setlocal spell spelllang=fr<CR>
nmap <leader>ll  :set nospell<CR>

map! ;a à
map! ;z â
map! ;b ä
map! ;c ç
map! ;w ê
map! ;e é
map! ;f ë
map! ;r è
map! ;i ï
map! ;j î
map! ;o ô
map! ;p ö
imap ;q «  »<Esc>hi
map! ;t ù
map! ;u û
map! ;v ü

"----------------------Plugin Configuration-------------------

"Nerdtree
nmap <leader>n :NERDTreeToggle<CR>

"Tagbar
nmap <leader>m :TagbarToggle<CR>

"Run shortcuts and bindings
nnoremap <F8> <NOP>
autocmd Filetype zsh,bash,sh nmap <F8> :w <CR> :!source % <CR>
autocmd Filetype c,cpp nmap <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
autocmd Filetype python nmap <F8> :w <CR> :!python %<CR>
autocmd Filetype python vmap <F8> !python<CR>
autocmd Filetype julia nmap <F8> :w <CR> :!julia % <CR>
autocmd Filetype haskell nmap <F8> :w <CR> :!ghc -o %< % <CR>

"Auto-pairs
let g:AutoPairsShortcutToggle = '<leader>)'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "dracula"
if has("gui_running")
    set lines=999 columns=999
    set background=dark
    colorscheme gruvbox
    let g:airline_theme="tomorrow"
    set guifont=Monaco\ for\ Powerline\ 10
endif
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
 "airline symbols
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
highlight ExtraWhitespace ctermbg=78
nmap <leader>wh :StripWhitespace<CR>

"Easytags
let g:easytags_async = 1

"Undotree
nnoremap <leader>u :UndotreeToggle<cr>

"Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

"Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* loadview
augroup END

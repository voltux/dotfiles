set nocompatible              " be iMproved, required for Vundle
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'mileszs/ack.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-pyref'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-unimpaired'
Plugin 'regedarek/ZoomWin'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ternjs/tern_for_vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/octave.vim--'
"Plugin 'ap/vim-templates'
"Plugin 'derekwyatt/vim-scala'
Plugin 'jpalardy/vim-slime'
Plugin 'nvie/vim-flake8'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rdnetto/YCM-Generator'
"Plugin 'lervag/vimtex'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

call vundle#end()            " required
filetype plugin indent on    " required


"-----------------General Settings---------------

set nocompatible
hi Normal ctermbg=none
syntax enable
syntax on
set relativenumber

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

"Find a file
nnoremap <leader>ff :FZF<CR>

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

"syntastic
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_checkers                 = ['flake8']
let g:syntastic_python_python_exec       = '/usr/bin/python3'
let g:syntastic_python_flake8_exec       = 'python3'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"YouCompleteMe options
let g:ycm_register_as_syntastic_checker = 1
let g:Show_diagnostics_ui               = 1

let g:ycm_enable_diagnostic_signs        = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list  = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags      = 1 "default 1
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_invoke_completion = '<C-Space>'
nnoremap <F9> :YcmForceCompileAndDiagnostics <CR>
nmap <F10> :YcmCompleter FixIt<CR>

"YouCompleteMe + Ultisnips + Supertab
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType    = '<C-j>'

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

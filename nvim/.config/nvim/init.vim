call plug#begin()

"Navigation
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'Shougo/unite.vim'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-peekaboo'
Plug 'wesQ3/vim-windowswap'

"Commands
Plug 'tpope/vim-eunuch'

"Editor
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'sbdchd/neoformat'

"Autocompletion and syntax linters
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ms-jpq/coq_nvim'

"Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'

"Language specific
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'amiorin/vim-textile'

"Search and LSP
Plug 'nvim-lua/plenary.nvim' "telescope prerequisite
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'

call plug#end()

"-----------------General Settings---------------

hi Normal ctermbg=none
syntax enable
syntax on
set number
set relativenumber
set cursorline

"default places for opening splits
set splitbelow
set splitright

"colors
set background=dark
colorscheme gruvbox

"no error bells
set noerrorbells

"Search down into subfolders - Provides tab completion for all related tasks
set path+=**

"set leader key
let mapleader = "\<Space>"

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
set noshowmode
set textwidth=120
set title
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes

"undo settings
set undofile                " Save undo's after file closes
set undodir=$HOME/.config/nvim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"terminal mode
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:tnoremap <C-t> <C-\><C-n>
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
:tnoremap <Leader><ESC> <C-\><C-n>
let g:terminal_scrollback_buffer_size = 100000

"remap space to page forward and ctrl space to page backward
nnoremap <space> <C-f>
nnoremap <leader><Space> <C-b>

"Basically you press * or # to search for the current selection
vnoremap <silent> * y/<C-R>"<CR>

"Zoom opening new tab
nnoremap <leader>z :tab split<CR>

" Copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p

"search settings
set nohlsearch          " do not highlight searched-for phrases
nnoremap <leader>/ :noh<CR>
set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default"

"folding zf to create fold, za to toggle
set nofoldenable
set foldmethod=manual
set foldlevelstart=20
hi Folded ctermbg=016

"Recognizing latex files
let g:tex_flavor='latex'

"Search, find and replace things
nnoremap <leader>fs :Telescope colorscheme<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fc :Telescope commands<CR>
nnoremap <leader>fk :Telescope keymaps<CR>
nnoremap <leader>fi :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fg :Telescope git_files<CR>
nnoremap <leader>fm :Telescope marks<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>b  :Unite buffer<CR>

"Compiler shortcuts and bindings
nnoremap <F8> <NOP>
autocmd Filetype zsh,bash,sh nmap <F8> :w <CR> :!source % <CR>
autocmd Filetype c,cpp       nmap <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
autocmd Filetype python      nmap <F8> :w <CR> :!python % <CR>
autocmd Filetype python 	 vmap <F8> !python<CR>
autocmd Filetype julia       nmap <F8> :w <CR> :!julia % <CR>
autocmd Filetype haskell     nmap <F8> :w <CR> :!ghc -o %< % <CR>
au! BufRead,BufNewFile *.pde setfiletype arduino

"Filetypes
au BufNewFile,BufRead *.pri setf idlang

"Resize
nnoremap <S-Up> :resize +2 <CR>
nnoremap <S-Down> :resize -2 <CR>
nnoremap <S-Right> :vertical resize +2 <CR>
nnoremap <S-Left> :vertical resize -2 <CR>

"----------------------Language Settings----------------------

nmap <leader>lg  :set keymap=greek_utf-8<CR>
nmap <leader>le  :set keymap&<CR>
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
map! ;i î
map! ;j ï
map! ;o ô
map! ;p ö
imap ;q «  »<Esc>hi
map! ;t ù
map! ;u û
map! ;v ü

"----------------------Plugin Configuration-------------------

"Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
nmap <leader>n :NERDTreeToggle<CR>

"Tagbar
nmap <leader>m :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"Auto-pairs shortcuts
let g:AutoPairsShortcutToggle = '<leader>)'

"Ultisnips better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

"Whitespace
highlight ExtraWhitespace ctermbg=78
nmap <leader>wh :StripWhitespace<CR>

"Easytags
let g:easytags_async = 1

"Undotree
nnoremap <leader>u :UndotreeToggle<cr>

"Slime
let g:slime_target           = "tmux"
let g:slime_default_config   = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython   = 0

"Rainbow brackets
let g:rainbow_active = 1

"Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.colnr = ':'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' | '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.spell = 'SPELL'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'wh'
let g:airline#extensions#wordcount#formatter#default#fmt = '%s |'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'

"python3 config
let g:python3_host_prog = '/usr/bin/python3'

lua require('lsp_config')

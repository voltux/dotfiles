lua require('plugins')

set nocompatible "sane defaults
set backspace=indent,eol,start "sane backspace behaviour
set number "show line number
set relativenumber "show line number relative to current
set wildmenu "show menu for options in command mode
set wildignorecase "ignore case for wildmenu in command mode
set wildignore+=.pyc,.swp "ignore certain filetypes in wildmenu
syntax enable "syntax highlighting
filetype plugin indent on "filetype aware behaviour
set noerrorbells "no error bells
set showcmd "show commands as they are typed
set splitbelow "default split below
set splitright "default split right
set kp= "keywordprg, how will 'K' react (default is man)
set path+=** "search down into subfolders, provides tab completion for all related tasks
set nopaste "just in case set paste is activated by default
set laststatus=2 "Always show statusline
set ignorecase "ignore case on search
set smartcase "but do not ignore it if I ask specifically for uppercase
set history=1000 "undo levels
set autoread "refresh file if it changes on disc
set confirm "ask me if I try to leave the editor with an unsaved modified file in a buffer
set formatoptions+=j "when joining lines join comments
set noswapfile "don't create swapfiles
set pastetoggle=<F7>
set mousemodel=popup_setpos "move mouse to click point
set smartindent "do smart autoindenting when changing lines
set expandtab "change tab to spaces
set smarttab "insert correct amount of spaces in begging of line
set tabstop=4 "number of spaces for a tab
set shiftwidth=4 "number of spaces for autoindent
set tags=./tags;/ "use only local tags
set hidden "hides unsaved files open in buffers instead of closing them, undo possible
set title "set title of window to title of file
set ttimeoutlen=0 "timeout time for Esc to pass to normal mode -> instantaneous
set nohlsearch "do not highlight searched-for phrases
set incsearch "but do highlight-as-I-type the search string
set gdefault "this makes search/replace global by default"
set undofile "save undos after file closes
set undodir=$HOME/.vim/undo "where to save undo histories
set undolevels=1000 "how many undos
set undoreload=10000 "number of lines to save for undo
set nofoldenable "all folds should be open when opening a file
set foldmethod=indent
set foldlevelstart=10 "start editing with all folds open when opening a new buffer
set foldnestmax=10 "maximum nested folds
hi Folded ctermbg=016
runtime! ftplugin/man.vim "man pages in vim
set cursorline "show cursorline
set signcolumn=yes "always show signcolumn


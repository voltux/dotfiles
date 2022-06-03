vim.g.mapleader = ' '
vim.g.colors_name = 'gruvbox'
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.wildmenu = true
-- vim.g.wildignorecase "ignore case for wildmenu in command mode
-- vim.g.wildignore+=.pyc,.swp "ignore certain filetypes in wildmenu
-- vim.g.ax enable "syntax highlighting
-- vim.g.type plugin indent on "filetype aware behaviour
-- vim.g.noerrorbells "no error bells
-- vim.g.showcmd "show commands as they are typed
vim.g.splitbelow = true
vim.g.splitright = true
-- vim.g.kp= "keywordprg, how will 'K' react (default is man)
-- vim.g.path+=** "search down into subfolders, provides tab completion for all related tasks
-- vim.g.nopaste "just in case set paste is activated by default
-- vim.g.laststatus=2 "Always show statusline
-- vim.g.ignorecase "ignore case on search
-- vim.g.smartcase "but do not ignore it if I ask specifically for uppercase
-- vim.g.history=1000 "undo levels
-- vim.g.autoread "refresh file if it changes on disc
-- vim.g.confirm "ask me if I try to leave the editor with an unsaved modified file in a buffer
-- vim.g.formatoptions+=j "when joining lines join comments
-- vim.g.noswapfile "don't create swapfiles
-- vim.g.pastetoggle=<F7>
-- vim.g.mousemodel=popup_setpos "move mouse to click point
-- vim.g.smartindent "do smart autoindenting when changing lines
-- vim.g.expandtab "change tab to spaces
-- vim.g.smarttab "insert correct amount of spaces in begging of line
-- vim.g.tabstop=4 "number of spaces for a tab
-- vim.g.shiftwidth=4 "number of spaces for autoindent
-- vim.g.tags=./tags;/ "use only local tags
-- vim.g.hidden "hides unsaved files open in buffers instead of closing them, undo possible
-- vim.g.title "set title of window to title of file
-- vim.g.ttimeoutlen=0 "timeout time for Esc to pass to normal mode -> instantaneous
-- vim.g.nohlsearch "do not highlight searched-for phrases
-- vim.g.incsearch "but do highlight-as-I-type the search string
-- vim.g.gdefault "this makes search/replace global by default"
-- vim.g.undofile "save undos after file closes
-- vim.g.undodir=$HOME/.vim/undo "where to save undo histories
-- vim.g.undolevels=1000 "how many undos
-- vim.g.undoreload=10000 "number of lines to save for undo
-- vim.g.nofoldenable "all folds should be open when opening a file
-- vim.g.foldmethod=indent
-- vim.g.foldlevelstart=10 "start editing with all folds open when opening a new buffer
-- vim.g.foldnestmax=10 "maximum nested folds
-- hi Folded ctermbg=016
-- runtime! ftplugin/man.vim "man pages in vim
-- set cursorline "show cursorline
-- set signcolumn=yes "always show signcolumn

require('plugins')

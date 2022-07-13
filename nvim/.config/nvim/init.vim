lua require('plugins')
lua require('lsp_config')
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}
EOF

"-----------------General Settings---------------
"
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
set undodir=$HOME/.local/share/nvim/undo "where to save undo histories
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

" Terminal
if executable("zsh")
    set shell=zsh
endif
set scrollback=100000 "terminal scrollback size
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
autocmd TermOpen * startinsert

"colors
set termguicolors
set background=dark
colorscheme gruvbox
set cursorline

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

"terminal mode
:tnoremap <C-w>h <C-\><C-n><C-w>h
:tnoremap <C-w>j <C-\><C-n><C-w>j
:tnoremap <C-w>k <C-\><C-n><C-w>k
:tnoremap <C-w>l <C-\><C-n><C-w>l
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:tnoremap <C-w><S-n> <C-\><C-n>
nnoremap <leader>tt :split \| :terminal<CR>
nnoremap <leader>tT :vsplit \| :terminal<CR>
nnoremap <leader>T  :terminal<CR>

"Basically you press * or # to search for the current selection
vnoremap <silent> * y/<C-R>"<CR>

" Copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p

"Recognizing latex files
let g:tex_flavor='latex'

"Run things easily
nnoremap <F8> <NOP>
autocmd Filetype zsh,bash,sh nmap <F8> :w <CR> :!source % <CR>
autocmd Filetype c,cpp nmap <F8> :w <CR> :!g++ -std=c++11 % -o %< && ./%< <CR>
autocmd Filetype python nmap <F8> :w <CR> :!python3 %<CR>
autocmd Filetype python vmap <F8> !python3<CR>
autocmd Filetype julia nmap <F8> :w <CR> :!julia % <CR>
autocmd Filetype haskell nmap <F8> :w <CR> :!runhaskell %< % <CR>
autocmd Filetype go nmap <F8> :w <CR> :!go run %<CR>
autocmd Filetype perl nmap <F8> :w <CR> :!perl %<CR>
autocmd Filetype md,markdown nmap <F8> :MarkdownPreviewToggle <CR>
autocmd Filetype lua nmap <F8> :w <CR> :!lua % <CR>
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

"Easy align
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

"IndentBlankLine
nnoremap <leader>i :IndentBlanklineToggle<CR>

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
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

"Search, find and replace things
nnoremap <leader>fq :Telescope colorscheme<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fc :Telescope commands<CR>
nnoremap <leader>fk :Telescope keymaps<CR>
nnoremap <leader>fi :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fg :Telescope git_files<CR>
nnoremap <leader>fG :Telescope git_status<CR>
nnoremap <leader>fm :Telescope marks<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fa :Telescope live_grep<CR>
nnoremap <leader>fs :Telescope grep_string<CR>
nnoremap <leader>fd :Telescope diagnostics<CR>

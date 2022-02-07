call plug#begin()

"Navigation
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'Shougo/unite.vim'
Plug 'regedarek/ZoomWin'
Plug 'junegunn/vim-peekaboo'

"Commands
Plug 'tpope/vim-eunuch'

"Editor
Plug 'luochen1990/rainbow'
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
Plug 'Yggdroot/indentLine'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'

"Autocompletion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'

"Syntax
Plug 'amiorin/vim-textile'

call plug#end()

runtime! ftplugin/man.vim

"-----------------General Settings---------------

set nocompatible
set backspace=indent,eol,start
syntax enable
syntax on
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
set t_Co=256
set background=dark
set cursorline
colorscheme gruvbox

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

"move inside menus
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

"change current dir to current file pwd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"copy paste between different programs/windows/tabs
set nopaste "don't start in paste mode
set clipboard=unnamedplus

"editor settings
set ignorecase
set smartcase
set history=1000
set autoread
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
set foldlevelstart=10
set foldnestmax=10
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

" Function to delete buffers directly from FZF
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bd' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BuffersDelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

"Find things with fzf
nnoremap <leader>fa  :Rg<CR>
nnoremap <leader>fb  :Buffers<CR>
nnoremap <leader>fd  :BuffersDelete<CR>
nnoremap <leader>fcb :BCommits<CR>
nnoremap <leader>fcc :Commits<CR>
nnoremap <leader>fco :Commands<CR>
nnoremap <leader>ff  :FZF<CR>
nnoremap <leader>fgg :GFiles<CR>
nnoremap <leader>fgc :GFiles?<CR>
nnoremap <leader>fhh :History<CR>
nnoremap <leader>fhc :History:<CR>
nnoremap <leader>fhs :History/<CR>
nnoremap <leader>fht :Helptags<CR>
nnoremap <leader>fi  :BLines<CR>
nnoremap <leader>fl  :Lines<CR>
nnoremap <leader>fm  :Maps<CR>
nnoremap <leader>fp  :Colors<CR>
nnoremap <leader>fr  :%s/
nnoremap <leader>ft  :Tags<CR>
nnoremap <leader>fw  :Windows<CR>
nnoremap <leader>f'  :Marks<CR>
nnoremap <leader>b   :Unite buffer<CR>

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
autocmd Filetype go nmap <F8> :w <CR> :!go run %<CR>

"Auto-pairs
let g:AutoPairsShortcutToggle = '<leader>)'

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

"Taskwarrior
nnoremap <leader>tt :TW <CR>
nnoremap <leader>tr :TWReportInfo <CR>

"Tabular
vmap <leader>t :Tabularize/

"IndentLines
nnoremap <leader>i :IndentLinesToggle<CR>

" Rainbow
let g:rainbow_active = 1

"Lsp Setup
nnoremap <leader>cd :LspDefinition<cr>
nnoremap <leader>cn :LspNextDiagnostic<cr>
nnoremap <leader>cp :LspPreviousDiagnostic<cr>
nnoremap <leader>ce :LspDocumentDiagnostics<cr>
nnoremap <leader>cr :LspRename<cr>
nnoremap <leader>cv :LspPeekDefinition<cr>
nnoremap <leader>ca :LspCodeAction<cr>
nnoremap <leader>ch :LspHover<cr>
nnoremap <leader>cf :LspDocumentFormat<cr>
nnoremap <leader>cc :pclose<cr>


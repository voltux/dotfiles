call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'neomake/neomake'
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
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
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
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'derekwyatt/vim-scala'
Plug 'metakirby5/codi.vim'
Plug 'w0rp/ale'
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-gitgutter'

"Plug 'maralla/completor.vim'
"Plug 'kassio/neoterm'
"Plug 'pgdouyon/vim-accio'
"Plugin 'eugen0329/vim-esearch'
"Plug 'airblade/vim-gitgutter'
"Plug 'euclio/vim-markdown-composer'



call plug#end()

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

"textfiles
autocmd BufNewFile,BufRead *.txt set textwidth=1000
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
"set clipboard=unnamed

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

"terminal mode
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:tnoremap <C-t> <C-\><C-n>
:nnoremap <C-t> :terminal<CR>
:tnoremap <Leader><ESC> <C-\><C-n>
let g:terminal_scrollback_buffer_size = 100000

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

"Zoom opening new tab
nnoremap <leader>z :tab split<CR>


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
nmap <leader>lcg :setlocal spell spelllang=el<CR>
nmap <leader>lce :setlocal spell spelllang=en<CR>
nmap <leader>lcf :setlocal spell spelllang=fr<CR>
nmap <leader>ll :set nospell<CR>

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
nmap <leader>n :NERDTreeToggle<CR>

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

""Neomake
"autocmd! BufWritePost * Neomake
"let g:neomake_python_enabled_makers = ['flake8']
"" E501 is line length of 80 characters
""let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501'], }
""let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=105'], }
"let g:neomake_error_sign='✗'
"let g:neomake_warning_sign='⚠'

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><c-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><c-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"deoplete python
let g:deoplete#sources#jedi#show_docstring = 1

"deoplete clang
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"better key bindings for UltiSnipsExpandTrigger
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
:let g:pyref_python  = '/usr/share/doc/python3.5-doc/html/'

"Ack
cnoreabbrev Ack Ack!
nnoremap <leader>fa :AckWindow <space>

"Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

"Indent Guides
"nmap <leader>ig :IndentGuidesToggle<CR>
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_guide_size = 1

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1

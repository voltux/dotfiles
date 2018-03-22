call plug#begin()

" Universal Plugins

"Navigation
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'jpalardy/vim-slime'
Plug 'wesQ3/vim-windowswap'
Plug 'jeetsukumaran/vim-buffergator'

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

"Terminal
Plug 'kassio/neoterm'

"Autocompletion and syntax linters
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'zchee/deoplete-jedi'
Plug 'sbdchd/neoformat'
"Plug 'neomake/neomake'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

"Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'
Plug 'pelodelfuego/vim-swoop'
"Plug 'eugen0329/vim-esearch'

"Misc
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'Shougo/vimproc.vim'

"Language specific
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-pyref'
Plug 'ternjs/tern_for_vim'
Plug 'vim-scripts/octave.vim--'
Plug 'derekwyatt/vim-scala'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'chrisbra/csv.vim'
Plug 'neovimhaskell/haskell-vim'

"Other
Plug 'jceb/vim-orgmode'
Plug 'itchyny/calendar.vim'
Plug 'metakirby5/codi.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-speeddating'


call plug#end()

"-----------------General Settings---------------

set nocompatible
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
colorscheme voltus

"activate mouse
set mouse=a

"Search down into subfolders - Provides tab completion for all related tasks
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
:tnoremap <Leader><ESC> <C-\><C-n>
let g:terminal_scrollback_buffer_size = 100000

"remap space to page forward and ctrl space to page backward
nnoremap <space> <C-f>
nnoremap <leader><Space> <C-b>

"Basically you press * or # to search for the current selection
vnoremap <silent> * y/<C-R>"<CR>

" Fast save
nnoremap <leader>s :w<cr>

" Fast quit
nnoremap <leader>q :q<cr>

"Zoom opening new tab
nnoremap <leader>z :tab split<CR>

" Copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p

"search settings
set nohlsearch          " do not highlight searched-for phrases
set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default"

"folding zf to create fold, za to toggle
set nofoldenable
set foldmethod=manual
set foldlevelstart=20
hi Folded ctermbg=016

"Recognizing latex files
let g:tex_flavor='latex'

"Search, find and replace things with fzf, swoop, esearch and other
nnoremap <leader>fr :%s/
nnoremap <leader>/ :FZF<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fg :GFiles?<CR>
nnoremap <leader>f' :Marks<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fe :call Swoop()<CR>
vnoremap <leader>fe :call SwoopSelection()<CR>
nnoremap <leader>fs :call SwoopMulti()<CR>
vnoremap <leader>fs :call SwoopMultiSelection()<CR>
nnoremap <leader>b  :BuffergatorToggle<CR>

"Compiler shortcuts and bindings
nnoremap <F8> <NOP>
autocmd Filetype zsh,bash,sh nmap <F8> :w <CR> :!source % <CR>
autocmd Filetype c,cpp nmap <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
autocmd Filetype python nmap <F8> :w <CR> :!python %<CR>
autocmd Filetype python vmap <F8> !python<CR>
autocmd Filetype julia nmap <F8> :w <CR> :!julia % <CR>
autocmd Filetype haskell nmap <F8> :w <CR> :!ghc -o %< % <CR>
au! BufRead,BufNewFile *.pde setfiletype arduino

"Filetypes
au BufNewFile,BufRead *.pri setf idlang

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

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><c-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><c-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1


"deoplete python
let g:deoplete#sources#jedi#show_docstring = 1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

"deoplete clang
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

"supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"Ultisnips better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
" airline symbols
"let g:airline_left_sep         = ''
"let g:airline_left_alt_sep     = ''
"let g:airline_right_sep        = ''
"let g:airline_right_alt_sep    = ''
"let g:airline_symbols.branch   = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr   = ''

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
"let g:slime_python_ipython = 1

"Pyref
let g:pyref_mapping = 'K'

"Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_python_autopep8_use_global = 1
let g:ale_virtualenv_dir_names = ['.env', 'env', 've-py3', 've', 'virtualenv', 'venv', 'venv_python_trisomies']

"Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

"Swoop
let g:swoopUseDefaultKeyMap = 0

"IndentLine
nnoremap <leader>ig :IndentLinesToggle<CR>

""Neoterm
nnoremap <silent> <leader>tt :Tnew <CR>
nnoremap <silent> ,th :call neoterm#close()<cr>
nnoremap <silent> ,tl :call neoterm#clear()<cr>
nnoremap <silent> ,tc :call neoterm#kill()<cr>

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

"Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

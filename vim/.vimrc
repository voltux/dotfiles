let has_plugin_manager = filereadable(expand("$HOME/.vim/autoload/plug.vim"))

if (has_plugin_manager)

    call plug#begin()

    Plug 'scrooloose/nerdtree' "file explorer
    Plug 'PhilRunninger/nerdtree-visual-selection' "open multiple nerdtree files with visual selection
    Plug 'liuchengxu/vista.vim' "in file tag explorer (classes, methods, variables...)
    Plug 'mbbill/undotree' "undo tree explorer
    Plug 'christoomey/vim-tmux-navigator' "navigate seemlessly between vim windows and tmux panes
    Plug 'jpalardy/vim-slime' "send text from vim to another tmux pane
    Plug 'regedarek/ZoomWin' "zoom on a specific vim window
    Plug 'junegunn/vim-peekaboo' "registers explorer
    Plug 'junegunn/vim-easy-align' "easily align lines around any text object
    Plug 'wesQ3/vim-windowswap' "swap easily the placement of two windows
    Plug 'tpope/vim-eunuch' "run a set of common unix commands from vim
    Plug 'luochen1990/rainbow' "multi colored brackets
    Plug 'tpope/vim-unimpaired' "useful pairings for easier next/previous navigation for text/lists
    Plug 'tpope/vim-commentary' "quickly comment/uncomment, syntax aware
    Plug 'tpope/vim-repeat' "make the dot operator behave as expected for more complex tasks
    Plug 'tpope/vim-surround' "quiskly (un)surround a text object with parentheses, brackets...
    Plug 'wellle/targets.vim' "add useful text objects
    Plug 'jiangmiao/auto-pairs' "autoclose parentheses
    Plug 'ntpeters/vim-better-whitespace' "remove unnecessary whitespace
    Plug 'terryma/vim-multiple-cursors' "modify multiple instances of the same word in file
    Plug 'vim-airline/vim-airline' "configurable status bar
    Plug 'kana/vim-textobj-user' "create custom text objects
    Plug 'kana/vim-textobj-line' "line text object
    Plug 'kana/vim-textobj-entire' "entire buffer text object
    Plug 'Julian/vim-textobj-variable-segment' "variable segment text object (between underscores or camelCase)
    Plug 'michaeljsmith/vim-indent-object' "indent text object
    Plug 'morhetz/gruvbox' "best coloscheme ever invented (objectively)
    Plug 'SirVer/ultisnips' "snippet triggerer
    Plug 'honza/vim-snippets' "collection of snippets
    Plug 'prabirshrestha/vim-lsp' "language server protocol implementation for vim
    Plug 'mattn/vim-lsp-settings' "easily configure language server protocol
    Plug 'thomasfaingnaert/vim-lsp-ultisnips' "language server protocol snippets
    Plug 'prabirshrestha/asyncomplete.vim' "asynchronous general autocompletion engine
    Plug 'prabirshrestha/asyncomplete-lsp.vim' "asynchronous language server protocol autocompletion engine
    Plug 'mhinz/vim-signify' "sign column to indicate modifications from version control system
    Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal
    Plug 'tpope/vim-rhubarb' "fugitive extension for github
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim' "find things
    Plug 'amiorin/vim-textile' "textile syntax highlighting
    Plug 'fatih/vim-go' "make vim behave like a go IDE
    Plug 'vim-python/python-syntax' "enhanced python syntax highlighting
    Plug 'tommcdo/vim-exchange' "easy text exchange operator
    Plug 'ryanoasis/vim-devicons' "different icons by filetype for nerdtree and airline
    Plug 'puremourning/vimspector' "graphical debugger
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} "preview markdown in browser (using prebuilt edition to avoid nodejs and yarn)
    Plug 'sotte/presenting.vim' "create markdown presentations in vim
    Plug 'jeetsukumaran/vim-indentwise' "move indentwise in file

    if executable("vifm")
        Plug 'vifm/vifm.vim' "terminal file manager with vim bindings
    endif

    call plug#end()

endif

"-----------------General---------------

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

" Terminal
if executable("zsh")
    set shell=zsh
endif
set termwinscroll=100000 "number of lines to see in vim terminal

"colors
set t_Co=256
set background=dark
if has_plugin_manager || filereadable(expand("$HOME/.vim/colors/gruvbox.vim"))
    colorscheme gruvbox
    set cursorline
endif

"set leader key
let mapleader = "\<Space>"

"-----------------Key Bindings---------------------

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
nnoremap <leader>dd :cd %:p:h<CR>:pwd<CR>

"copy paste between different programs/windows/tabs
set nopaste "don't start in paste mode

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
autocmd Filetype yaml,yml set tabstop=2 shiftwidth=2

"Resize
nnoremap <leader><Up> :resize +10 <CR>
nnoremap <leader><Down> :resize -10 <CR>
nnoremap <leader><Right> :vertical resize +10 <CR>
nnoremap <leader><Left> :vertical resize -10 <CR>

"Terminal
nnoremap <leader>T :terminal ++curwin<CR>
nnoremap <leader>tt :terminal<CR>
nnoremap <leader>tT :vertical terminal<CR>

"Move between buffers
nnoremap <leader>b :b#<CR>

"----------------------Language----------------------

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

"----------------------Plugins or not-------------------
if (has_plugin_manager)
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
      \ 'options': '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'
    \ }))

    " Command to remove filename from searching inside files with ripgrep
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

    "Find things with FZF
    nnoremap <leader>fa :Rg<CR>
    nnoremap <leader>fb :Buffers<CR>
    nnoremap <leader>fd :BuffersDelete<CR>
    nnoremap <leader>fC :BCommits<CR>
    nnoremap <leader>fc :Commits<CR>
    nnoremap <leader>f$ :Commands<CR>
    nnoremap <leader>ff :FZF<CR>
    nnoremap <leader>fg :GFiles<CR>
    nnoremap <leader>fG :GFiles?<CR>
    nnoremap <leader>fh :History<CR>
    nnoremap <leader>f: :History:<CR>
    nnoremap <leader>f/ :History/<CR>
    nnoremap <leader>f? :Helptags<CR>
    nnoremap <leader>fi :BLines<CR>
    nnoremap <leader>fl :Lines<CR>
    nnoremap <leader>fk :Maps<CR>
    nnoremap <leader>fp :Colors<CR>
    nnoremap <leader>fr :%s/
    nnoremap <leader>ft :Vista finder<CR>
    nnoremap <leader>fw :Windows<CR>
    nnoremap <leader>fm :Marks<CR>
    nnoremap <leader>fs :Snippets<CR>

    "Nerdtree
    nmap <leader>n :NERDTreeToggle<CR>

    "Tagbar
    nmap <leader>m :Vista!!<CR>
    let g:tagbar_autofocus=1

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

    "Auto-pairs
    let g:AutoPairsShortcutToggle = '<leader>)'

    "ZoomWin
    nmap <leader>z <C-w>o

    "Whitespace
    highlight ExtraWhitespace ctermbg=4
    nmap <leader>wh :StripWhitespace<CR>
    nmap <leader>wt :ToggleWhitespace<CR>

    "Undotree
    nnoremap <leader>u :UndotreeToggle<cr>

    "Slime
    let g:slime_target = "tmux"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
    let g:slime_dont_ask_default = 1
    " let g:slime_python_ipython = 1 "(un)comment to toggle ipython support for slime, does not work simply by setting variable to 0

    "Tabular
    vmap <leader>tt :Tabularize/

    "Rainbow
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
    let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

    "vim-go
    let g:go_fmt_fail_silently = 1

    "python-syntax
    let g:python_highlight_all = 1

    "ultisnips
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'

    "vim-easy-align
    nmap ga <Plug>(EasyAlign)
    vmap ga <Plug>(EasyAlign)

    "vimspector
    " ======================================================================================================================================
    " |    _Key_     |                   _Mapping_                   |                              _Function_                             |
    " ======================================================================================================================================
    " | 'F5'         | '<Plug>VimspectorContinue'                    | When debugging, continue. Otherwise start debugging.                |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F3'         | '<Plug>VimspectorStop'                        | Stop debugging.                                                     |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F4'         | '<Plug>VimspectorRestart'                     | Restart debugging with the same configuration.                      |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F6'         | '<Plug>VimspectorPause'                       | Pause debuggee.                                                     |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F9'         | '<Plug>VimspectorToggleBreakpoint'            | Toggle line breakpoint on the current line.                         |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | '<leader>F9' | '<Plug>VimspectorToggleConditionalBreakpoint' | Toggle conditional line breakpoint or logpoint on the current line. |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F8'         | '<Plug>VimspectorAddFunctionBreakpoint'       | Add a function breakpoint for the expression under cursor           |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | '<leader>F8' | '<Plug>VimspectorRunToCursor'                 | Run to Cursor                                                       |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F10'        | '<Plug>VimspectorStepOver'                    | Step Over                                                           |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F11'        | '<Plug>VimspectorStepInto'                    | Step Into                                                           |
    " --------------------------------------------------------------------------------------------------------------------------------------
    " | 'F12'        | '<Plug>VimspectorStepOut'                     | Step out of current function scope                                  |
    " --------------------------------------------------------------------------------------------------------------------------------------
    let g:vimspector_enable_mappings='HUMAN'
    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]


    "fugitive
    nnoremap <leader>gd :Gdiff<cr>
    nnoremap <leader>gb :G blame<cr>
    nnoremap <leader>gg :G<cr>

    "Lsp Setup
    nnoremap ]q :LspNextDiagnostic<cr>
    nnoremap [q :LspPreviousDiagnostic<cr>
    nnoremap <leader>cd :LspDefinition<cr>
    nnoremap <leader>cg :LspDeclaration<cr>
    nnoremap <leader>ce :LspDocumentDiagnostics<cr>
    nnoremap <leader>cr :LspRename<cr>
    nnoremap <leader>cv :LspPeekDefinition<cr>
    nnoremap <leader>ca :LspCodeAction<cr>
    nnoremap <leader>ch :LspHover<cr>
    nnoremap <leader>cf :LspDocumentFormat<cr>
    nnoremap <leader>cc :pclose<cr>
else
    "status line
    function! GitBranch()
      return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    endfunction

    function! StatuslineGit()
      let l:branchname = GitBranch()
      return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
    endfunction

    set statusline=
    set statusline+=%#PmenuSel#
    set statusline+=%{StatuslineGit()}
    set statusline+=%#LineNr#
    set statusline+=\ %f
    set statusline+=%m
    set statusline+=%=
    set statusline+=%#CursorColumn#
    set statusline+=\ %y
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\[%{&fileformat}\]
    set statusline+=\ %p%%
    set statusline+=\ %l:%c
    set statusline+=
endif

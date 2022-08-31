-- General settings
vim.o.backspace = "indent,eol,start" --sane backspace behaviour
vim.o.number = true --show line number
vim.o.relativenumber = true --show line number relative to current
vim.o.wildmenu = true --show menu for options in command mode
vim.o.wildignorecase = true --ignore case for wildmenu in command mode
vim.o.errorbells = false --no error bells
vim.o.showcmd = true --show commands as they are typed
vim.o.splitbelow = true --default split below
vim.o.splitright = true --default split right
vim.o.paste = false --just in case set paste is activated by default
vim.o.laststatus = 2 --Always show statusline
vim.o.ignorecase = true --ignore case on search
vim.o.smartcase = true --but do not ignore it if I ask specifically for uppercase
vim.o.history = 1000 --undo levels
vim.o.autoread = true --refresh file if it changes on disc
vim.o.confirm = true --ask me if I try to leave the editor with an unsaved modified file in a buffer
vim.o.swapfile = false --don't create swapfiles
vim.o.pastetoggle = '<F7>'
vim.o.mousemodel = "popup_setpos" --move mouse to click point
vim.o.smartindent = true --do smart autoindenting when changing lines
vim.o.expandtab = true --change tab to spaces
vim.o.smarttab = true --insert correct amount of spaces in begging of line
vim.o.tabstop = 4 --number of spaces for a tab
vim.o.shiftwidth = 4 --number of spaces for autoindent
vim.o.hidden = true --hides unsaved files open in buffers instead of closing them, undo possible
vim.o.title = true --set title of window to title of file
vim.o.ttimeoutlen = 0 --timeout time for Esc to pass to normal mode -> instantaneous
vim.o.hlsearch = false --do not highlight searched-for phrases
vim.o.incsearch = true --but do highlight-as-I-type the search string
vim.o.gdefault = true --this makes search/replace global by default"
vim.o.undofile = true --save undos after file closes
vim.cmd [[ set undodir=$HOME/.local/share/nvim/undo ]] --where to save undo histories
vim.o.undolevels = 1000 --how many undos
vim.o.undoreload = 10000 --number of lines to save for undo
vim.o.foldenable = false --all folds should be open when opening a file
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 10 --start editing with all folds open when opening a new buffer
vim.o.foldnestmax = 10 --maximum nested folds
vim.o.cursorline = true --show cursorline
vim.o.signcolumn = 'yes' --always show signcolumn
vim.o.scrollback = 100000 --max lines for terminal scrollback
vim.cmd [[ set kp= "keywordprg, how will 'K' react (default is man) ]]
vim.cmd [[ set path+=** "search down into subfolders, provides tab completion for all related tasks ]]
vim.cmd [[ set formatoptions+=j "when joining lines join comments ]]
vim.cmd [[ set tags=./tags;/ "use only local tags ]]
vim.cmd [[ set wildignore+=.pyc,.swp "ignore certain filetypes in wildmenu ]]
vim.cmd [[ set kp= "keywordprg, how will 'K' react (default is man) ]]
vim.cmd [[ set path+=** "search down into subfolders, provides tab completion for all related tasks ]]
vim.cmd [[ hi Folded ctermbg=016 ]]
vim.cmd [[ runtime! ftplugin/man.vim "man pages in vim ]]

-- Colors
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd [[ colorscheme gruvbox ]]
vim.cmd [[ highlight Normal     ctermbg=NONE guibg=NONE ]]
vim.cmd [[ highlight LineNr     ctermbg=NONE guibg=NONE ]]
vim.cmd [[ highlight SignColumn ctermbg=NONE guibg=NONE ]]

-- Mapleader
vim.g.mapleader = " " --mapleader

-- Abbreviations for common typos
vim.cmd [[
    cnoreabbrev   Q    q
    cnoreabbrev   W    w
    cnoreabbrev   Wq   wq
    cnoreabbrev   wQ   wq
    cnoreabbrev   WQ   wq
    cnoreabbrev   Qa   qa
]]

-- Moving between splits
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, desc = 'Move to upper window' })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>j', { noremap = true, desc = 'Move to lower window' })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>j', { noremap = true, desc = 'Move to right window' })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>j', { noremap = true, desc = 'Move to left window' })

--Terminal
vim.cmd [[
    :tnoremap <C-w>h <C-\><C-n><C-w>h
    :tnoremap <C-w>j <C-\><C-n><C-w>j
    :tnoremap <C-w>k <C-\><C-n><C-w>k
    :tnoremap <C-w>l <C-\><C-n><C-w>l
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
    :tnoremap <C-w><S-n> <C-\><C-n>
    :tnoremap <expr> <C-w>" '<C-\><C-N>"'.nr2char(getchar()).'pi'
    nnoremap <leader>ss :split \| :terminal<CR>
    nnoremap <leader>sS :vsplit \| :terminal<CR>
    nnoremap <leader>S  :terminal<CR>
    if executable("zsh")
        set shell=zsh
    endif
]]
vim.cmd [[ autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no ]]
vim.cmd [[ autocmd TermOpen * startinsert ]]

--Change current dir to current file pwd
vim.cmd [[
    nnoremap <leader>gc :cd %:p:h<CR>:pwd<CR>
]]

--Search, copy, paste
vim.cmd [[
    "Basically you press * or # to search for the current selection
    vnoremap <silent> * y/<C-R>"<CR>

    " Copy to system clipboard
    nnoremap <leader>y "+y
    vnoremap <leader>y "+y

    " Paste from system clipboard
    nnoremap <leader>p "+p
]]

--Latex flavor
vim.cmd [[
    "Recognizing latex files
    let g:tex_flavor='latex'
]]

--Running stuff
vim.cmd [[
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
]]

--Resize
vim.api.nvim_set_keymap('n', '<S-Up>', ':resize +2<CR>', { noremap = true, desc = 'Resize window up' })
vim.api.nvim_set_keymap('n', '<S-Down>', ':resize -2<CR>', { noremap = true, desc = 'Resize window down' })
vim.api.nvim_set_keymap('n', '<S-Right>', ':vertical resize +2<CR>', { noremap = true, desc = 'Resize window up' })
vim.api.nvim_set_keymap('n', '<S-Left>', ':vertical resize -2<CR>', { noremap = true, desc = 'Resize window left' })

--Language
vim.cmd [[
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
]]

-- General settings
vim.o.backspace = "indent,eol,start"        -- sane backspace behaviour
vim.o.number = true                         -- show line number
vim.o.relativenumber = false                -- show line number relative to current
vim.o.wildmenu = true                       -- show menu for options in command mode
vim.o.wildignorecase = true                 -- ignore case for wildmenu in command mode
vim.o.errorbells = false                    -- no error bells
vim.o.showcmd = false                       -- do not show commands as they are typed
vim.o.showmode = false                      -- do not show insert mode in command line
vim.o.splitbelow = true                     -- default split below
vim.o.splitright = true                     -- default split right
vim.o.paste = false                         -- just in case set paste is activated by default
vim.o.laststatus = 2                        -- show statusline in every window
vim.o.ignorecase = true                     -- ignore case on search
vim.o.smartcase = true                      -- but do not ignore it if I ask specifically for uppercase
vim.o.history = 1000                        -- undo levels
vim.o.autoread = true                       -- refresh file if it changes on disc
vim.o.confirm = true                        -- ask me if I try to leave the editor with an unsaved modified file in a buffer
vim.o.swapfile = false                      -- don't create swapfiles
vim.o.mousemodel = "popup_setpos"           -- move mouse to click point
vim.o.smartindent = true                    -- do smart autoindenting when changing lines
vim.o.expandtab = false                     -- do not change tab to spaces
vim.o.smarttab = true                       -- insert correct amount of spaces in begging of line
vim.o.tabstop = 4                           -- number of spaces for a tab
vim.o.shiftwidth = 4                        -- number of spaces for autoindent
vim.o.hidden = true                         -- hides unsaved files open in buffers instead of closing them, undo possible
vim.o.title = true                          -- set title of window to title of file
vim.o.ttimeoutlen = 0                       -- timeout time in ms for Esc to pass to normal mode -> instantaneous
vim.o.timeoutlen = 500                      -- timeout time in ms for key code mapping to execute
vim.o.hlsearch = false                      -- do not highlight searched-for phrases
vim.o.incsearch = true                      -- but do highlight-as-I-type the search string
vim.o.gdefault = true                       -- this makes search/replace global by default"
vim.o.undofile = true                       -- save undos after file closes
vim.o.undolevels = 1000                     -- how many undos
vim.o.undoreload = 10000                    -- number of lines to save for undo
vim.o.foldenable = false                    -- all folds should be open when opening a file
vim.o.foldmethod = 'indent'                 -- fold stuff based on indentation level
vim.o.foldlevelstart = 10                   -- start editing with all folds open when opening a new buffer
vim.o.foldnestmax = 10                      -- maximum nested folds
vim.o.cursorline = true                     -- show cursorline
vim.o.signcolumn = 'yes'                    -- always show signcolumn
vim.o.scrollback = 100000                   -- max lines for terminal scrollback
vim.o.breakindent = true                    -- maintain indentation when breaking long lines
vim.g.mapleader = " "                       -- mapleader
vim.g.tex_flavor = 'latex'                  -- latex flavor
vim.g.do_filetype_lua = 1                   -- let lua handle filetypes and fall back to filetype.vim if it fails
vim.o.completeopt = 'menu,menuone,noselect' -- autocompletion options
vim.o.termguicolors = true                  -- show all my terminal colors please
vim.o.background = 'dark'                   -- always on dark background
vim.o.wrap = false                          -- set nowrap by default
vim.cmd [[ set fillchars+=eob:\ ]]          -- remove ~ tilde as character for lines after buffer end and leave empty
vim.cmd [[ set shortmess=I ]]               -- disable intro message
vim.cmd [[ set kp= "keywordprg, how will 'K' react (default is man) ]]
vim.cmd [[ set path+=** "search down into subfolders, provides tab completion for all related tasks ]]
vim.cmd [[ set formatoptions+=j "when joining lines join comments ]]
vim.cmd [[ set tags=./tags;/ "use only local tags ]]
vim.cmd [[ set wildignore+=.pyc,.swp "ignore certain filetypes in wildmenu ]]
vim.cmd [[ set kp= "keywordprg, how will 'K' react (default is man) ]]
vim.cmd [[ set path+=** "search down into subfolders, provides tab completion for all related tasks ]]
vim.cmd [[ set undodir=$HOME/.local/share/nvim/undo ]] --where to save undo histories
vim.cmd [[ runtime! ftplugin/man.vim "man pages in vim ]]
vim.cmd [[ set listchars=tab:▷\ ,eol:⏎,trail:·,lead:·,extends:»,precedes:«,nbsp:○ ]]
vim.o.list = false -- do not show listchars

-- Colorscheme
if vim.g.colors_name == nil then
    vim.cmd [[ colorscheme habamax ]]
end

-- Abbreviations for common typos
vim.cmd [[
    cnoreabbrev   Q    q
    cnoreabbrev   W    w
    cnoreabbrev   Wq   wq
    cnoreabbrev   wQ   wq
    cnoreabbrev   WQ   wq
    cnoreabbrev   Qa   qa
]]

--Terminal
vim.keymap.set('n', '<leader>Sj', ':split | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer horizontal below' })
vim.keymap.set('n', '<leader>Sl', ':vsplit | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer vertical right' })
vim.keymap.set('n', '<leader>Ss', ':terminal<CR>', { noremap = true, desc = 'New terminal buffer' })
vim.keymap.set('n', '<leader>Sk', ':above split | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer horizontal above' })
vim.keymap.set('n', '<leader>Sh', ':aboveleft vsplit | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer vertical left' })
vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h',
    { noremap = true, desc = 'Move to left window from terminal' })
vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j',
    { noremap = true, desc = 'Move to lower window from terminal' })
vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k',
    { noremap = true, desc = 'Move to upper window from terminal' })
vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l',
    { noremap = true, desc = 'Move to right window from terminal' })
vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>',
    { noremap = true, desc = 'Switch from terminal mode to normal mode' })
vim.cmd [[tnoremap <expr> <C-W>" '<C-\><C-N>"'.nr2char(getchar()).'pi']]
vim.cmd [[ autocmd TermOpen * setlocal nonumber norelativenumber nocursorcolumn signcolumn=no ]]
if vim.fn.executable("zsh") > 0 then
    vim.o.shell = "zsh"
elseif vim.fn.executable("bash") > 0 then
    vim.o.shell = "bash"
end

--Change current dir to current file pwd
vim.keymap.set('n', '<leader>cc', ':cd %:p:h<CR>:pwd<CR>',
    { noremap = true, desc = 'Change dir to current file pwd' })

--Search, copy, paste
local tmux_copy_mode_toggle = function()
    -- function to toggle all options taking place on the screen when trying to copy/paste from tmux
    -- especially handy for remote sessions
    if vim.o.number then
        vim.o.signcolumn = "no"
        vim.o.number = false
        vim.o.relativenumber = false
        vim.cmd [[ IBLDisable ]]
    else
        vim.o.signcolumn = "yes"
        vim.o.number = true
        vim.o.relativenumber = false
    end
end

vim.keymap.set('v', '<silent> *', 'y/<C-R>"<CR>', { noremap = true, desc = 'Search current selection' })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, desc = 'Copy to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, desc = 'Copy selection to system clipboard' })
vim.keymap.set('n', '<leader>sc', tmux_copy_mode_toggle, { noremap = true, desc = 'Set to paste mode for tmux' })

--Language
vim.keymap.set('n', '<leader>lg', '<cmd>set keymap=greek_utf-8<CR>',
    { noremap = true, desc = 'Change language greek' })
vim.keymap.set('n', '<leader>le', '<cmd>set keymap&<CR>', { noremap = true, desc = 'Change language english' })
vim.keymap.set('n', '<leader>lcg', '<cmd>setlocal spell spelllang=el<CR>',
    { noremap = true, desc = 'Set spelling greek' })
vim.keymap.set('n', '<leader>lce', '<cmd>setlocal spell spelllang=en<CR>',
    { noremap = true, desc = 'Set spelling english' })
vim.keymap.set('n', '<leader>lcf', '<cmd>setlocal spell spelllang=fr<CR>',
    { noremap = true, desc = 'Set spelling french' })
vim.keymap.set('n', '<leader>ll', '<cmd>set nospell<CR>', { noremap = true, desc = 'Set no spelling' })
vim.keymap.set('!', ';a', 'à', { desc = 'insert special character à' })
vim.keymap.set('!', ';z', 'â', { desc = 'insert special character â' })
vim.keymap.set('!', ';b', 'ä', { desc = 'insert special character ä' })
vim.keymap.set('!', ';c', 'ç', { desc = 'insert special character ç' })
vim.keymap.set('!', ';w', 'ê', { desc = 'insert special character ê' })
vim.keymap.set('!', ';e', 'é', { desc = 'insert special character é' })
vim.keymap.set('!', ';f', 'ë', { desc = 'insert special character ë' })
vim.keymap.set('!', ';r', 'è', { desc = 'insert special character è' })
vim.keymap.set('!', ';i', 'î', { desc = 'insert special character î' })
vim.keymap.set('!', ';j', 'ï', { desc = 'insert special character ï' })
vim.keymap.set('!', ';o', 'ô', { desc = 'insert special character ô' })
vim.keymap.set('!', ';p', 'ö', { desc = 'insert special character ö' })
vim.keymap.set('!', ';t', 'ù', { desc = 'insert special character ù' })
vim.keymap.set('!', ';u', 'û', { desc = 'insert special character û' })
vim.keymap.set('!', ';v', 'ü', { desc = 'insert special character ü' })
vim.keymap.set('i', ';q', '«»<Esc>i', { desc = 'insert special character «»' })

-- Navigation
vim.keymap.set('n', '<leader>b', '<cmd>b#<CR>', { noremap = true, desc = 'Go to last buffer' })

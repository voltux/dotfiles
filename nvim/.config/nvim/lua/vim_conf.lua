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
vim.o.laststatus = 3 --Always show statusline in single statusline mode
vim.o.ignorecase = true --ignore case on search
vim.o.smartcase = true --but do not ignore it if I ask specifically for uppercase
vim.o.history = 1000 --undo levels
vim.o.autoread = true --refresh file if it changes on disc
vim.o.confirm = true --ask me if I try to leave the editor with an unsaved modified file in a buffer
vim.o.swapfile = false --don't create swapfiles
vim.o.pastetoggle = '<F4>'
vim.o.mousemodel = "popup_setpos" --move mouse to click point
vim.o.smartindent = true --do smart autoindenting when changing lines
vim.o.expandtab = true --change tab to spaces
vim.o.smarttab = true --insert correct amount of spaces in begging of line
vim.o.tabstop = 4 --number of spaces for a tab
vim.o.shiftwidth = 4 --number of spaces for autoindent
vim.o.hidden = true --hides unsaved files open in buffers instead of closing them, undo possible
vim.o.title = true --set title of window to title of file
vim.o.ttimeoutlen = 0 --timeout time in ms for Esc to pass to normal mode -> instantaneous
vim.o.timeoutlen = 500 --timeout time in ms for key code mapping to execute
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
vim.cmd [[ runtime! ftplugin/man.vim "man pages in vim ]]
vim.g.mapleader = " " --mapleader
vim.g.tex_flavor = 'latex' --latex flavor
vim.g.do_filetype_lua = 1 --let lua handle filetypes and fall back to filetype.vim if it fails
vim.wo.fillchars = 'eob: ' --remove ~ tilde as character for lines after buffer end and leave empty

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
vim.api.nvim_set_keymap('n', '<leader>Sj', ':split | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer horizontal below' })
vim.api.nvim_set_keymap('n', '<leader>Sl', ':vsplit | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer vertical right' })
vim.api.nvim_set_keymap('n', '<leader>Ss', ':terminal<CR>', { noremap = true, desc = 'New terminal buffer' })
vim.api.nvim_set_keymap('n', '<leader>Sk', ':above split | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer horizontal above' })
vim.api.nvim_set_keymap('n', '<leader>Sh', ':aboveleft vsplit | :terminal<CR>',
    { noremap = true, desc = 'New terminal buffer vertical left' })
vim.api.nvim_set_keymap('t', '<C-w>h', '<C-\\><C-n><C-w>h',
    { noremap = true, desc = 'Move to left window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w>j', '<C-\\><C-n><C-w>j',
    { noremap = true, desc = 'Move to lower window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w>k', '<C-\\><C-n><C-w>k',
    { noremap = true, desc = 'Move to upper window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w>l', '<C-\\><C-n><C-w>l',
    { noremap = true, desc = 'Move to right window from terminal' })
vim.api.nvim_set_keymap('t', '<C-Space>', '<C-\\><C-n>',
    { noremap = true, desc = 'Switch from terminal mode to normal mode' })
vim.cmd [[tnoremap <expr> <C-W>" '<C-\><C-N>"'.nr2char(getchar()).'pi']]
vim.cmd [[ autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no ]]
vim.cmd [[ autocmd TermOpen * startinsert ]]
if vim.fn.executable("zsh") > 0 then
    vim.o.shell = "zsh"
elseif vim.fn.executable("bash") > 0 then
    vim.o.shell = "bash"
end

--Change current dir to current file pwd
vim.api.nvim_set_keymap('n', '<leader>cc', ':cd %:p:h<CR>:pwd<CR>',
    { noremap = true, desc = 'Change dir to current file pwd' })

--Search, copy, paste
local tmux_copy_mode_toggle = function()
    -- function to toggle all options taking place on the screen when trying to copy/paste from tmux
    -- especially handy for remote sessions
    if vim.o.number then
        vim.o.signcolumn = "no"
        vim.o.number = false
        vim.o.relativenumber = false
        vim.cmd [[ IndentBlanklineDisable ]]
    else
        vim.o.signcolumn = "yes"
        vim.o.number = true
        vim.o.relativenumber = true
        vim.cmd [[ IndentBlanklineEnable ]]
    end
end

vim.api.nvim_set_keymap('v', '<silent> *', 'y/<C-R>"<CR>', { noremap = true, desc = 'Search current selection' })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, desc = 'Copy to system clipboard' })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, desc = 'Copy selection to system clipboard' })
vim.keymap.set('n', '<leader>sc', tmux_copy_mode_toggle, { noremap = true, desc = 'Set to paste mode for tmux' })

--Resize
vim.api.nvim_set_keymap('n', '<M-j>', ':resize +2<CR>', { noremap = true, desc = 'Resize window up' })
vim.api.nvim_set_keymap('n', '<M-k>', ':resize -2<CR>', { noremap = true, desc = 'Resize window down' })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true, desc = 'Resize window up' })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, desc = 'Resize window left' })

--Language
vim.api.nvim_set_keymap('n', '<leader>lg', ':set keymap=greek_utf-8<CR>',
    { noremap = true, desc = 'Change language greek' })
vim.api.nvim_set_keymap('n', '<leader>le', ':set keymap&<CR>', { noremap = true, desc = 'Change language english' })
vim.api.nvim_set_keymap('n', '<leader>lcg', ':setlocal spell spelllang=el<CR>',
    { noremap = true, desc = 'Set spelling greek' })
vim.api.nvim_set_keymap('n', '<leader>lce', ':setlocal spell spelllang=en<CR>',
    { noremap = true, desc = 'Set spelling english' })
vim.api.nvim_set_keymap('n', '<leader>lcf', ':setlocal spell spelllang=fr<CR>',
    { noremap = true, desc = 'Set spelling french' })
vim.api.nvim_set_keymap('n', '<leader>ll', ':set nospell<CR>', { noremap = true, desc = 'Set no spelling' })
vim.api.nvim_set_keymap('!', ';a', 'à', { desc = 'insert special character à' })
vim.api.nvim_set_keymap('!', ';z', 'â', { desc = 'insert special character â' })
vim.api.nvim_set_keymap('!', ';b', 'ä', { desc = 'insert special character ä' })
vim.api.nvim_set_keymap('!', ';c', 'ç', { desc = 'insert special character ç' })
vim.api.nvim_set_keymap('!', ';w', 'ê', { desc = 'insert special character ê' })
vim.api.nvim_set_keymap('!', ';e', 'é', { desc = 'insert special character é' })
vim.api.nvim_set_keymap('!', ';f', 'ë', { desc = 'insert special character ë' })
vim.api.nvim_set_keymap('!', ';r', 'è', { desc = 'insert special character è' })
vim.api.nvim_set_keymap('!', ';i', 'î', { desc = 'insert special character î' })
vim.api.nvim_set_keymap('!', ';j', 'ï', { desc = 'insert special character ï' })
vim.api.nvim_set_keymap('!', ';o', 'ô', { desc = 'insert special character ô' })
vim.api.nvim_set_keymap('!', ';p', 'ö', { desc = 'insert special character ö' })
vim.api.nvim_set_keymap('!', ';t', 'ù', { desc = 'insert special character ù' })
vim.api.nvim_set_keymap('!', ';u', 'û', { desc = 'insert special character û' })
vim.api.nvim_set_keymap('!', ';v', 'ü', { desc = 'insert special character ü' })
vim.api.nvim_set_keymap('i', ';q', '«»<Esc>i', { desc = 'insert special character «»' })

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
vim.o.pastetoggle = '<F4>'
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

-- Moving between splits
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, desc = 'Move to upper window' })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>j', { noremap = true, desc = 'Move to lower window' })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>j', { noremap = true, desc = 'Move to right window' })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>j', { noremap = true, desc = 'Move to left window' })

--Terminal
vim.api.nvim_set_keymap('n', '<leader>ss', ':split | :terminal<CR>', { noremap = true, desc = 'New terminal horizontal' })
vim.api.nvim_set_keymap('n', '<leader>sS', ':vsplit | :terminal<CR>', { noremap = true, desc = 'New terminal vertical' })
vim.api.nvim_set_keymap('n', '<leader>S', ':terminal<CR>', { noremap = true, desc = 'New terminal window' })
vim.api.nvim_set_keymap('t', '<C-w>h', '<C-\\><C-n><C-w>h',
    { noremap = true, desc = 'Move to left window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w>j', '<C-\\><C-n><C-w>j',
    { noremap = true, desc = 'Move to lower window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w>k', '<C-\\><C-n><C-w>k',
    { noremap = true, desc = 'Move to upper window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w>l', '<C-\\><C-n><C-w>l',
    { noremap = true, desc = 'Move to right window from terminal' })
vim.api.nvim_set_keymap('t', '<C-w><S-n>', '<C-\\><C-n>',
    { noremap = true, desc = 'Switch from terminal mode to normal mode' })
vim.api.nvim_set_keymap('t', '<expr> <C-w>"', '\'<C-\\><C-N>"\'.nr2char(getchar()).\'pi\'',
    { noremap = true, desc = 'Paste from vim buffer in terminal mode' })
vim.cmd [[ autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no ]]
vim.cmd [[ autocmd TermOpen * startinsert ]]
if vim.fn.executable("zsh") then
    vim.o.shell = "zsh"
end

--Change current dir to current file pwd
vim.api.nvim_set_keymap('n', '<leader>gc ', ':cd %:p:h<CR>:pwd<CR>',
    { noremap = true, desc = 'Change current dir to current file pwd' })

--Search, copy, paste
vim.api.nvim_set_keymap('v', '<silent> *', 'y/<C-R>"<CR>', { noremap = true, desc = 'Search current selection' })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, desc = 'Copy to system clipboard' })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, desc = 'Copy selection to system clipboard' })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, desc = 'Paste from system clipboard' })

--Resize
vim.api.nvim_set_keymap('n', '<S-Up>', ':resize +2<CR>', { noremap = true, desc = 'Resize window up' })
vim.api.nvim_set_keymap('n', '<S-Down>', ':resize -2<CR>', { noremap = true, desc = 'Resize window down' })
vim.api.nvim_set_keymap('n', '<S-Right>', ':vertical resize +2<CR>', { noremap = true, desc = 'Resize window up' })
vim.api.nvim_set_keymap('n', '<S-Left>', ':vertical resize -2<CR>', { noremap = true, desc = 'Resize window left' })

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

--Gui
vim.cmd [[
    if exists('g:neovide')
        set guifont=Monaco\ for\ Powerline:h9
        let g:neovide_fullscreen=v:true
    endif
]]

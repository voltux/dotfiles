-- verify if packer is installed, else try to install it
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.api.nvim_set_keymap('n', '<leader>pu', '<cmd>PackerSync<cr>', { noremap = true, desc = 'Packer synchronize plugins' })

-- plugins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- package manager
    use 'kyazdani42/nvim-tree.lua' -- file explorer
    use 'kyazdani42/nvim-web-devicons' -- filetype icons
    use 'mbbill/undotree' -- multilevel undo explorer
    use 'christoomey/vim-tmux-navigator' -- easily move from between vim windows and tmux panes
    use 'jpalardy/vim-slime' -- send text to terminal
    use 'chentoast/marks.nvim' -- better marks support
    use "tversteeg/registers.nvim" -- registers explorer
    use 'tpope/vim-eunuch' -- add common shell commands to vim command mode
    use 'tpope/vim-unimpaired' -- mappings to move in all kinds of vim lists
    use 'tpope/vim-repeat' -- enhance the . operator for more complex tasks
    use 'kylechui/nvim-surround' -- surround text objects with opening/closing symbols
    use 'wellle/targets.vim' -- extend default text objects
    use 'ntpeters/vim-better-whitespace' -- handle trailing whitespace
    use 'mg979/vim-visual-multi' -- multiple cursors
    use 'junegunn/vim-easy-align' -- easily align text
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- status line (bottom)
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' } -- buffer line (top)
    use 'kana/vim-textobj-user' -- extend default text objects
    use { 'kana/vim-textobj-line', requires = { 'kana/vim-textobj-user' } } -- extend default text objects
    use { 'kana/vim-textobj-entire', requires = { 'kana/vim-textobj-user' } } -- extend default text objects
    use { 'Julian/vim-textobj-variable-segment', requires = { 'kana/vim-textobj-user' } } -- extend default text objects
    use { 'michaeljsmith/vim-indent-object', requires = { 'kana/vim-textobj-user' } } -- extend default text objects
    use 'ellisonleao/gruvbox.nvim' -- colorscheme
    use 'p00f/nvim-ts-rainbow' -- change color on (), []... for better readability when on treesitter aware syntax
    use 'luochen1990/rainbow' -- change color on (), []... for better readability on any filetype
    use 'hrsh7th/cmp-nvim-lsp' -- autocompletion (lsp based)
    use 'hrsh7th/cmp-buffer' -- autocompletion (buffer based)
    use 'hrsh7th/cmp-path' -- autocompletion (filepath based)
    use 'hrsh7th/cmp-cmdline' -- autocompletion (command based)
    use 'hrsh7th/nvim-cmp' -- autocompletion engine
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- autocompletion on lsp function/class signature
    use 'hrsh7th/cmp-nvim-lua' -- autocompletion (lua)
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- autocompletion (luasnip snippets)
    use 'rcarriga/cmp-dap' -- autocompletion (debugger)
    use 'tpope/vim-fugitive' -- git handler
    use 'honza/vim-snippets' -- rich snippet collection
    use 'lewis6991/gitsigns.nvim' -- git modifications explorer/handler
    use 'tpope/vim-rhubarb' -- open current git project on github
    use { "benfowler/telescope-luasnip.nvim", requires = { 'L3MON4D3/LuaSnip' } } -- telescope extension for luasnip snippets
    use { 'nvim-telescope/telescope-ui-select.nvim' } -- telescope extension to use telescope as selection ui instead of vim command line
    use { 'nvim-telescope/telescope-file-browser.nvim' } -- telescope extension file browser
    use { 'nvim-telescope/telescope-project.nvim' } -- telescope extension project finder
    use 'plasticboy/vim-markdown' -- markdown filetype enhancements
    use 'mattn/emmet-vim' -- html easy text generation
    use 'neovimhaskell/haskell-vim' -- haskell filetype enhancements
    use 'amiorin/vim-textile' -- textile filetype enhancements
    use 'tommcdo/vim-exchange' -- exchange mode for vim to swap texts between two text objects
    use 'fatih/vim-go' -- go filetype enhancements, commands and project handling
    use 'nvim-lua/plenary.nvim' -- lua module for asynchronous programming (dependancy lib)
    use { 'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim' } -- org mode but for vimmers :)
    use { 'nvim-neorg/neorg-telescope' } -- neorg integration with telescope
    use 'nvim-telescope/telescope.nvim' -- fuzzy finding anything anywhere
    use 'nvim-treesitter/nvim-treesitter' -- enhanced syntax by treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- extend default text objects with treesitter syntax awareness
    use 'neovim/nvim-lspconfig' -- easily config neovim lsp
    use 'williamboman/nvim-lsp-installer' -- easily install/handle lsp servers directly from neovim
    use 'lukas-reineke/indent-blankline.nvim' -- indent lines
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- nice view for git diff
    use 'windwp/nvim-autopairs' -- autoclose pairs, (), []...
    use 'numToStr/Comment.nvim' -- syntax aware commenting
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end } -- embed neovim on the browser
    use { 'mfussenegger/nvim-dap' } -- debugger engine
    use { 'mfussenegger/nvim-dap-python' } -- dap python debugger
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } } -- dap ui
    use { 'folke/trouble.nvim' } -- a pretty list for diagnostics
    use { 'akinsho/toggleterm.nvim', tag = '*' } -- neovim terminal handler
    use { 'folke/which-key.nvim' } -- show available keymaps + description as you type them
    use { 'Pocco81/true-zen.nvim' } -- zen mode, enhanced window zooming
    use { 'folke/twilight.nvim' } -- dim interactive portions of code you are editing
    use { 'rcarriga/nvim-notify' } -- notification system
    use { 'simrat39/symbols-outline.nvim' } -- minimap
    use { 'folke/neodev.nvim' } -- init.lua syntax awareness and completion
    use { 'JoosepAlviste/nvim-ts-context-commentstring' } -- set commentstring option based on the cursor location in the file.
    use { 'lewis6991/impatient.nvim' } -- caching init to improve starting time
    use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' } -- markdown preview plugin based on deno
    use { 'nat-418/boole.nvim' } -- enhance C-A, C-X
    use { 'vifm/vifm.vim' } -- vifm file manager inside neovim
    use { 'folke/zen-mode.nvim' } -- zen mode, enhanced window zooming, neorg presentation friendly

    if packer_bootstrap then
        require('packer').sync()
    end
end)

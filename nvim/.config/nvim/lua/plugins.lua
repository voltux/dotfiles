-- verify if packer is installed, else try to install it automatically
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
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'mbbill/undotree'
    use 'christoomey/vim-tmux-navigator'
    use 'jpalardy/vim-slime'
    use 'chentoast/marks.nvim'
    use "tversteeg/registers.nvim"
    use 'tpope/vim-eunuch'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use 'kylechui/nvim-surround'
    use 'wellle/targets.vim'
    use 'ntpeters/vim-better-whitespace'
    use 'mg979/vim-visual-multi'
    use 'junegunn/vim-easy-align'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use 'kana/vim-textobj-user'
    use { 'kana/vim-textobj-line', requires = { 'kana/vim-textobj-user' } }
    use { 'kana/vim-textobj-entire', requires = { 'kana/vim-textobj-user' } }
    use { 'Julian/vim-textobj-variable-segment', requires = { 'kana/vim-textobj-user' } }
    use { 'michaeljsmith/vim-indent-object', requires = { 'kana/vim-textobj-user' } }
    use 'ellisonleao/gruvbox.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'luochen1990/rainbow'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lua'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rcarriga/cmp-dap'
    use 'tpope/vim-fugitive'
    use 'rafamadriz/friendly-snippets'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-rhubarb'
    use { "benfowler/telescope-luasnip.nvim", requires = { 'L3MON4D3/LuaSnip' } }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-project.nvim' }
    use 'plasticboy/vim-markdown'
    use 'mattn/emmet-vim'
    use 'neovimhaskell/haskell-vim'
    use 'amiorin/vim-textile'
    use 'tommcdo/vim-exchange'
    use 'fatih/vim-go'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-neorg/neorg-telescope' }
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    use { 'mfussenegger/nvim-dap' }
    use { 'mfussenegger/nvim-dap-python' }
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use { 'folke/trouble.nvim' }
    use { "akinsho/toggleterm.nvim", tag = '*' }
    use { "folke/which-key.nvim" }
    use { "Pocco81/true-zen.nvim" }
    use { "folke/twilight.nvim" }
    use { "rcarriga/nvim-notify" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "simrat39/symbols-outline.nvim" }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

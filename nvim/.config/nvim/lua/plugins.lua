local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy_setup_table = {
    {
        -- file explorer
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        event = 'VeryLazy',
        config = function() require('nvim-tree_conf') end,
    },
    {
        -- filetype icons
        'nvim-tree/nvim-web-devicons',
        lazy = true,
        config = function() require('nvim-web-devicons_conf') end,
    },
    {
        -- multilevel undo explorer
        'mbbill/undotree',
        event = 'VeryLazy',
        config = function() require('undotree_conf') end
    },
    {
        -- send text to terminal
        'jpalardy/vim-slime',
        event = 'VeryLazy',
        config = function() require('vim-slime_conf') end
    },
    {
        -- better marks support
        'chentoast/marks.nvim',
        event = 'VeryLazy',
        config = function() require('marks').setup() end
    },
    {
        -- registers explorer
        'tversteeg/registers.nvim',
        event = 'VeryLazy',
    },
    {
        -- add common shell commands to vim command mode
        'tpope/vim-eunuch',
        event = 'VeryLazy',
    },
    {
        -- mappings to move in all kinds of vim lists
        'tpope/vim-unimpaired',
        event = 'VeryLazy',
    },
    {
        -- enhance the . operator for more complex tasks
        'tpope/vim-repeat',
        event = 'VeryLazy',
    },
    {
        -- detect tabstop/shiftwidth
        'tpope/vim-sleuth'
    },
    {
        -- surround text objects with opening/closing symbols
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = function() require('nvim-surround').setup {} end
    },
    {
        -- extend default text objects
        'wellle/targets.vim'
    },
    {
        -- handle trailing whitespace
        'ntpeters/vim-better-whitespace',
        event = 'VeryLazy',
        config = function() require('vim-better-whitespace_conf') end
    },
    {
        -- multiple cursors
        'mg979/vim-visual-multi',
        event = 'VeryLazy',
    },
    {
        -- easily align text
        'junegunn/vim-easy-align',
        event = 'VeryLazy',
        config = function() require('vim-easy-align_conf') end
    },
    {
        -- status line (bottom)
        'nvim-lualine/lualine.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine_conf') end
    },
    {
        -- buffer line (top)
        'akinsho/bufferline.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('bufferline_conf') end
    },
    {
        -- colorscheme
        'ellisonleao/gruvbox.nvim',
        config = function() require('gruvbox_conf') end
    },
    {
        -- change color on (), []... for better readability when on treesitter aware syntax
        'HiPhish/nvim-ts-rainbow2',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
        config = function() require('nvim-ts-rainbow_conf') end
    },
    {
        -- change color on (), []... for better readability on any filetype
        'luochen1990/rainbow',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
    },
    {
        -- autocompletion (lsp based)
        'hrsh7th/cmp-nvim-lsp',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- autocompletion (buffer based)
        'hrsh7th/cmp-buffer',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- autocompletion (filepath based)
        'hrsh7th/cmp-path',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- autocompletion (command based)
        'hrsh7th/cmp-cmdline',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- autocompletion engine
        'hrsh7th/nvim-cmp',
        config = function() require('cmp_conf') end,
        event = 'VeryLazy',
    },
    {
        -- autocompletion on lsp function/class signature
        'hrsh7th/cmp-nvim-lsp-signature-help',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- autocompletion (lua)
        'hrsh7th/cmp-nvim-lua',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- snippet engine
        "L3MON4D3/LuaSnip",
        config = function() require('luasnip_conf') end,
        version = "1.*",
        dependencies = { 'hrsh7th/nvim-cmp', 'rafamadriz/friendly-snippets', 'honza/vim-snippets' },
        event = 'VeryLazy',
    },
    {
        -- autocompletion (luasnip snippets)
        'saadparwaiz1/cmp_luasnip',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- git handler
        'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end,
        event = 'VeryLazy',
    },
    {
        -- rich snippet collection
        'honza/vim-snippets',
        event = 'VeryLazy',
    },
    {
        -- rich snippet collection
        'rafamadriz/friendly-snippets',
        event = 'VeryLazy',
    },
    {
        -- git modifications explorer/handler
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function() require('gitsigns_conf') end
    },
    {
        -- open current git project on github
        'tpope/vim-rhubarb',
        event = 'VeryLazy',
    },
    {
        -- telescope extension for luasnip snippets
        'benfowler/telescope-luasnip.nvim',
        dependencies = { 'L3MON4D3/LuaSnip', 'nvim-telescope/telescope.nvim' },
        event = 'VeryLazy',
    },
    {
        -- telescope extension file browser
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        event = 'VeryLazy',
    },
    {
        -- telescope extension project finder
        'nvim-telescope/telescope-project.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        event = 'VeryLazy',
    },
    {
        -- markdown filetype enhancements
        'plasticboy/vim-markdown',
        ft = 'markdown',
    },
    {
        -- html easy text generation
        'mattn/emmet-vim',
        ft = 'html',
    },
    {
        -- haskell filetype enhancements
        'neovimhaskell/haskell-vim',
        ft = 'haskell',
    },
    {
        -- exchange mode for vim to swap texts between two text objects
        'tommcdo/vim-exchange',
        event = 'VeryLazy',
    },
    {
        -- go filetype enhancements, commands and project handling
        'fatih/vim-go',
        ft = 'go',
        config = function() require('vim-go_conf') end
    },
    {
        -- lua module for asynchronous programming (dependancy lib)
        'nvim-lua/plenary.nvim',
        lazy = true,
    },
    {
        -- org mode but for vimmers :)
        'nvim-neorg/neorg',
        cmd = 'Neorg sync-parsers',
        dependencies = 'nvim-lua/plenary.nvim',
        ft = 'norg',
        tag = '0.0.18',
        config = function() require('neorg_conf') end
    },
    {
        -- neorg integration with telescope
        'nvim-neorg/neorg-telescope',
        event = 'VeryLazy',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-neorg/neorg' },
    },
    {
        -- fuzzy finding anything anywhere
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        config = function() require('telescope_conf') end
    },
    {
        -- enhanced syntax by treesitter
        'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter_conf') end
    },
    {
        -- extend default text objects with treesitter syntax awareness
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    {
        -- easily config neovim lsp
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
        event = 'VeryLazy',
        config = function() require('lsp_conf') end
    },
    {
        -- easily install/update lsp servers directly from neovim
        'williamboman/mason.nvim',
        event = 'VeryLazy',
        config = function() require('mason_conf') end
    },
    {
        -- bridge between mason and nvim-lspconfig
        'williamboman/mason-lspconfig',
        event = 'VeryLazy',
        config = function() require('mason-lspconfig').setup {} end
    },
    {
        -- indent lines
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent-blankline_conf') end
    },
    {
        -- nice view for git diff
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = 'VeryLazy',
        config = function() require('diffview_conf') end
    },
    {
        -- autoclose pairs (), [], etc
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        config = function() require('ultimate-autopair').setup({}) end,
    },
    {
        -- syntax aware commenting
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function() require('Comment').setup() end
    },
    {
        -- embed neovim on the browser
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end,
        config = function() require('firenvim_conf') end
    },
    {
        -- debugger engine
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        config = function() require('dap_conf') end
    },
    {
        -- dap python debugger
        'mfussenegger/nvim-dap-python',
        event = 'VeryLazy',
        config = function() require('dap-python_conf') end
    },
    {
        -- dap ui
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        event = 'VeryLazy',
        config = function() require('dap-ui_conf') end,
    },
    {
        -- autocompletion (debugger)
        'rcarriga/cmp-dap',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
    },
    {
        -- a pretty list for diagnostics
        'folke/trouble.nvim',
        event = 'VeryLazy',
        config = function() require('trouble_conf') end
    },
    {
        -- neovim terminal handler
        'akinsho/toggleterm.nvim',
        dependencies = 'jpalardy/vim-slime',
        event = 'VeryLazy',
        config = function() require('toggleterm_conf') end,
    },
    {
        -- show available keymaps + description as you type them
        'folke/which-key.nvim',
        event = 'VeryLazy',
        config = function() require('which-key_conf') end
    },
    {
        -- zen mode, enhanced window zooming
        'Pocco81/true-zen.nvim',
        event = 'VeryLazy',
        config = function() require('true-zen_conf') end
    },
    {
        -- dim interactive portions of code you are editing
        'folke/twilight.nvim',
        event = 'VeryLazy',
        config = function() require('twilight_conf') end
    },
    {
        -- minimap
        'stevearc/aerial.nvim',
        event = 'VeryLazy',
        config = function() require('aerial_conf') end
    },
    {
        -- init.lua syntax awareness and completion
        'folke/neodev.nvim',
        event = 'VeryLazy',
        config = function()
            require('neodev').setup({
                library = { plugins = { 'nvim-dap-ui' }, types = true },
            })
        end
    },
    {
        -- set commentstring option based on the cursor location in the file.
        'JoosepAlviste/nvim-ts-context-commentstring',
        lazy = true,
    },
    {
        -- caching init to improve starting time
        'lewis6991/impatient.nvim'
    },
    {
        -- markdown preview plugin based on deno
        'toppair/peek.nvim',
        build = 'deno task --quiet build:fast',
        event = 'VeryLazy',
        config = function() require('peek_conf') end
    },
    {
        -- enhance C-A, C-X
        'nat-418/boole.nvim',
        event = 'VeryLazy',
        config = function() require('boole_conf') end
    },
    {
        -- vifm file manager inside neovim
        'vifm/vifm.vim',
        event = 'VeryLazy',
        config = function() require('vifm_conf') end
    },
    {
        -- zen mode, enhanced window zooming, neorg presentation friendly
        'folke/zen-mode.nvim',
        event = 'VeryLazy',
        config = function() require('zen_mode_conf') end
    },
    {
        -- show a lightbulb when code actions are available
        'kosayoda/nvim-lightbulb',
        event = 'VeryLazy',
        config = function() require('nvim-lightbulb').setup({ autocmd = { enabled = true } }) end,
    },
    {
        -- lsp progress eye candy
        'j-hui/fidget.nvim',
        event = 'VeryLazy',
        config = function() require('fidget').setup {} end
    },
    {
        -- make your code rain or play game of life :p
        'eandrju/cellular-automaton.nvim',
        event = 'VeryLazy',
    },
    {
        -- manage annotations
        'danymat/neogen',
        config = function() require('neogen_conf') end,
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    {
        -- remove cursorline and cursorcolumn from incactive buffers
        'tummetott/reticle.nvim',
        event = 'VeryLazy',
        config = function() require('reticle_conf') end
    },
    {
        -- auto activate/deactivate hlsearch when in/out of search
        'asiryk/auto-hlsearch.nvim',
        event = 'VeryLazy',
        config = function() require('auto-hlsearch').setup() end
    },
    {
        -- helm chart syntax highlighter
        'towolf/vim-helm',
        ft = { 'yaml', 'helm' },
    },
    {
        -- telescope extension to change current directory
        'zane-/cder.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        config = function() require('telescope').load_extension('cder') end,
    },
    {
        -- improve default vim.ui interfaces
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        config = function() require('dressing').setup() end,
    },
    {
        -- ui components
        'MunifTanjim/nui.nvim',
        lazy = true
    },
    {
        -- in text colorizer
        'NvChad/nvim-colorizer.lua',
        event = 'VeryLazy',
        config = function() require 'colorizer'.setup { filetypes = { '*', } } end,
    },
    {
        -- play some blackjack in neovim
        'alanfortlink/blackjack.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        -- split smart and move between splits
        'mrjones2014/smart-splits.nvim',
        config = function() require('smart-splits_conf') end,
    },
    {
        -- add custom textobjects
        "chrisgrieser/nvim-various-textobjs",
        event = 'VeryLazy',
        config = function() require("various-textobjs").setup({ useDefaultKeymaps = true }) end,
    },
    {
        "debugloop/telescope-undo.nvim",
        event = 'VeryLazy',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
        end,
    },
    {
        -- file explorer to edit filesystem like a normal buffer, vim-vinegar like
        'stevearc/oil.nvim',
        config = function() require('oil_conf') end,
    }
}

vim.api.nvim_set_keymap('n', '<leader>pl', '<Cmd>Lazy<CR>', { noremap = true, desc = 'Lazy Open' })

-- load plugins
return require('lazy').setup(lazy_setup_table)

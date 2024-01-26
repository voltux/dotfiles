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

local plugins = {
    {
        -- file explorer
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('nvim-tree_conf') end,
    },
    {
        -- filetype icons
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons_conf') end,
        lazy = true,
    },
    {
        -- multilevel undo explorer
        'mbbill/undotree',
        config = function() require('undotree_conf') end,
        event = "VeryLazy"
    },
    {
        -- send text to terminal
        'jpalardy/vim-slime',
        config = function() require('vim-slime_conf') end,
    },
    {
        -- better marks support
        'chentoast/marks.nvim',
        config = function() require('marks').setup() end,
        event = "VeryLazy"
    },
    {
        -- add common shell commands to vim command mode
        'tpope/vim-eunuch',
    },
    {
        -- mappings to move in all kinds of vim lists
        'tpope/vim-unimpaired',
    },
    {
        -- enhance the . operator for more complex tasks
        'tpope/vim-repeat',
    },
    {
        -- detect tabstop/shiftwidth
        'tpope/vim-sleuth',
    },
    {
        -- surround text objects with opening/closing symbols
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup {} end,
        event = "VeryLazy"
    },
    {
        -- extend default text objects
        'wellle/targets.vim',
        event = "VeryLazy"
    },
    {
        -- handle trailing whitespace
        'ntpeters/vim-better-whitespace',
        config = function() require('vim-better-whitespace_conf') end,
        event = "VeryLazy"
    },
    {
        -- multiple cursors
        'mg979/vim-visual-multi',
        event = "VeryLazy"
    },
    {
        -- easily align text
        'junegunn/vim-easy-align',
        config = function() require('vim-easy-align_conf') end,
        event = "VeryLazy"
    },
    {
        -- status line (bottom)
        'nvim-lualine/lualine.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine_conf') end,
    },
    {
        -- buffer line (top)
        'akinsho/bufferline.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('bufferline_conf') end,
    },
    {
        -- colorscheme
        'ellisonleao/gruvbox.nvim',
        config = function() require('gruvbox_conf') end,
    },
    {
        -- change color on (), []... for better readability when on treesitter aware syntax
        'HiPhish/nvim-ts-rainbow2',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
        config = function() require('nvim-ts-rainbow_conf') end,
        event = "VeryLazy"
    },
    {
        -- change color on (), []... for better readability on any filetype
        'luochen1990/rainbow',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
        event = "VeryLazy"
    },
    {
        -- autocompletion (lsp based)
        'hrsh7th/cmp-nvim-lsp',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        -- autocompletion (buffer based)
        'hrsh7th/cmp-buffer',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        -- autocompletion (filepath based)
        'hrsh7th/cmp-path',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        -- autocompletion (command based)
        'hrsh7th/cmp-cmdline',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        -- autocompletion engine
        'hrsh7th/nvim-cmp',
        config = function() require('cmp_conf') end,
        lazy = true
    },
    {
        -- autocompletion on lsp function/class signature
        'hrsh7th/cmp-nvim-lsp-signature-help',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        -- autocompletion (lua)
        'hrsh7th/cmp-nvim-lua',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        -- snippet engine
        "L3MON4D3/LuaSnip",
        config = function() require('luasnip_conf') end,
        version = "1.*",
        dependencies = { 'hrsh7th/nvim-cmp', 'rafamadriz/friendly-snippets', 'honza/vim-snippets' },
        lazy = true
    },
    {
        -- autocompletion (luasnip snippets)
        'saadparwaiz1/cmp_luasnip',
        dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip", 'honza/vim-snippets', 'rafamadriz/friendly-snippets' },
    },
    {
        -- git handler
        'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end,
        event = "VeryLazy"
    },
    {
        -- rich snippet collection
        'honza/vim-snippets',
        lazy = true
    },
    {
        -- rich snippet collection
        'rafamadriz/friendly-snippets',
        lazy = true
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
        event = "VeryLazy"
    },
    {
        -- telescope extension for luasnip snippets
        'benfowler/telescope-luasnip.nvim',
        dependencies = { 'L3MON4D3/LuaSnip', 'nvim-telescope/telescope.nvim' },
    },
    {
        -- telescope extension file browser
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
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
        event = "VeryLazy"
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
        config = function() require('neorg_conf') end,
    },
    {
        -- fuzzy finding anything anywhere
        'nvim-telescope/telescope.nvim',
        config = function() require('telescope_conf') end,
        lazy = true
    },
    {
        -- enhanced syntax by treesitter
        'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter_conf') end,
        lazy = true
    },
    {
        -- extend default text objects with treesitter syntax awareness
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    {
        -- easily config neovim lsp
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'glepnir/lspsaga.nvim' },
        config = function() require('lsp_conf') end,
    },
    {
        -- easily install/update lsp servers directly from neovim
        'williamboman/mason.nvim',
        config = function() require('mason_conf') end,
        lazy = true
    },
    {
        -- bridge between mason and nvim-lspconfig
        'williamboman/mason-lspconfig',
        dependencies = { "williamboman/mason.nvim" },
        config = function() require('mason-lspconfig').setup {} end
    },
    {
        -- indent lines
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent-blankline_conf') end,
    },
    {
        -- nice view for git diff
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('diffview_conf') end,
    },
    {
        -- autoclose pairs (), [], etc
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup({}) end,
    },
    {
        -- syntax aware commenting
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        -- embed neovim on the browser
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end,
        config = function() require('firenvim_conf') end,
    },
    {
        -- debugger engine
        'mfussenegger/nvim-dap',
        config = function() require('dap_conf') end,
        lazy = true
    },
    {
        -- dap python debugger
        'mfussenegger/nvim-dap-python',
        dependencies = { "mfussenegger/nvim-dap" },
        config = function() require('dap-python_conf') end
    },
    {
        -- dap ui
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function() require('dap-ui_conf') end,
    },
    {
        -- autocompletion (debugger)
        "rcarriga/cmp-dap",
        dependencies = { "hrsh7th/nvim-cmp", "mfussenegger/nvim-dap" },
    },
    {
        -- a pretty list for diagnostics
        'folke/trouble.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function() require('trouble_conf') end
    },
    {
        -- neovim terminal handler
        'akinsho/toggleterm.nvim',
        dependencies = 'jpalardy/vim-slime',
        config = function() require('toggleterm_conf') end,
        event = "VeryLazy"
    },
    {
        -- show available keymaps + description as you type them
        'folke/which-key.nvim',
        config = function() require('which-key_conf') end,
        event = "VeryLazy"
    },
    {
        -- zen mode, enhanced window zooming
        'Pocco81/true-zen.nvim',
        config = function() require('true-zen_conf') end,
        event = "VeryLazy"
    },
    {
        -- dim interactive portions of code you are editing
        'folke/twilight.nvim',
        config = function() require('twilight_conf') end,
        event = "VeryLazy"
    },
    {
        -- init.lua syntax awareness and completion
        'folke/neodev.nvim',
        ft = "lua",
        config = function()
            require('neodev').setup({
                library = { plugins = { 'nvim-dap-ui' }, types = true },
            })
        end,
    },
    {
        -- set commentstring option based on the cursor location in the file.
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy'
    },
    {
        -- caching init to improve starting time
        'lewis6991/impatient.nvim'
    },
    {
        -- markdown preview plugin based on deno
        'toppair/peek.nvim',
        build = 'deno task --quiet build:fast',
        ft = "markdown",
        config = function() require('peek_conf') end,
    },
    {
        -- enhance C-A, C-X
        'nat-418/boole.nvim',
        config = function() require('boole_conf') end,
        event = "VeryLazy"
    },
    {
        -- vifm file manager inside neovim
        'vifm/vifm.vim',
        config = function() require('vifm_conf') end,
        event = "VeryLazy"
    },
    {
        -- zen mode, enhanced window zooming, neorg presentation friendly
        'folke/zen-mode.nvim',
        config = function() require('zen_mode_conf') end,
        event = "VeryLazy"
    },
    {
        -- lsp progress eye candy
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup {} end,
        tag = 'legacy',
        event = "VeryLazy"
    },
    {
        -- make your code rain or play game of life :p
        'eandrju/cellular-automaton.nvim',
        event = "VeryLazy"
    },
    {
        -- manage annotations
        'danymat/neogen',
        config = function() require('neogen_conf') end,
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = "VeryLazy"
    },
    {
        -- remove cursorline and cursorcolumn from incactive buffers
        'tummetott/reticle.nvim',
        config = function() require('reticle_conf') end,
        event = "VeryLazy"
    },
    {
        -- auto activate/deactivate hlsearch when in/out of search
        'asiryk/auto-hlsearch.nvim',
        config = function() require('auto-hlsearch').setup() end,
        event = "VeryLazy"
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
        config = function() require('telescope').load_extension('cder') end,
    },
    {
        -- improve default vim.ui interfaces
        'stevearc/dressing.nvim',
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
        config = function() require('colorizer_conf') end,
        event = "VeryLazy"
    },
    {
        -- play some blackjack in neovim
        'alanfortlink/blackjack.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = "VeryLazy"
    },
    {
        -- split smart and move between splits
        'mrjones2014/smart-splits.nvim',
        config = function() require('smart-splits_conf') end,
        event = "VeryLazy"
    },
    {
        -- add custom textobjects
        "chrisgrieser/nvim-various-textobjs",
        config = function() require("various-textobjs").setup({ useDefaultKeymaps = true }) end,
        event = "VeryLazy"
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        lazy = true
    },
    {
        -- file explorer to edit filesystem like a normal buffer, vim-vinegar like
        'stevearc/oil.nvim',
        config = function() require('oil_conf') end,
        event = "VeryLazy"
    },
    {
        -- open files in the parent nvim session when invoking neovim from a child terminal
        'willothy/flatten.nvim',
        config = true,
        lazy = false,
        priority = 1001,
    },
    {
        -- ui for lsp features
        "glepnir/lspsaga.nvim",
        config = function() require("lspsaga_conf") end,
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
        lazy = true
    },
    {
        -- create gitignore files automatically
        "wintermute-cell/gitignore.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        event = "VeryLazy"
    },
    {
        -- move blocks respecting indentation
        'fedepujol/move.nvim',
        config = function() require("move_conf") end,
        event = "VeryLazy"
    },
    {
        -- create nice tables
        "dhruvasagar/vim-table-mode",
        event = "VeryLazy",
        config = function() require("table-mode_conf") end,
    },
    {
        -- search emojis by name in telescope
        "xiyaowong/telescope-emoji.nvim",
        event = "VeryLazy",
    },
    {
        -- project management
        "ahmedkhalf/project.nvim",
        config = function() require("project_nvim").setup {} end,
        event = "VeryLazy",
    },
    {
        -- change pickers on the fly for telescope (ex. include/ignore hidden files from search)
        "Theo-Steiner/togglescope",
        event = "VeryLazy",
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("todo-comment_conf") end,
        event = "VeryLazy",
    },
    {
        -- Database explorer
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function() require("dadbod_conf").setup() end,
        cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    },
    {
        -- markdown preview
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        -- search nerd font glyphs
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
        config = function() require("nerdy_conf") end,
        event = "VeryLazy",
    },

}

local opts = {
    ui = {
        border = "rounded",
        icons = {
            lazy = "鈴 ",
            loaded = "",
            not_loaded = "",
        },
    },
}

vim.keymap.set('n', '<leader>pl', '<Cmd>Lazy<CR>', { noremap = true, desc = 'Lazy Open' })

-- load plugins
return require('lazy').setup(plugins, opts)

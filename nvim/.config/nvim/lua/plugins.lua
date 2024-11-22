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
        version = "*",
    },
    {
        -- filetype icons
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons_conf') end,
        version = "*",
    },
    {
        -- multilevel undo explorer
        'mbbill/undotree',
        config = function() require('undotree_conf') end,
        version = "*",
    },
    {
        -- send text to terminal
        'jpalardy/vim-slime',
        config = function() require('vim-slime_conf') end,
        version = "*",
    },
    {
        -- better marks support
        'chentoast/marks.nvim',
        config = function() require('marks').setup() end,
        version = "*",
    },
    {
        -- add common shell commands to vim command mode
        'tpope/vim-eunuch',
        version = "*",
    },
    {
        -- mappings to move in all kinds of vim lists
        'tpope/vim-unimpaired',
        version = "*",
    },
    {
        -- enhance the . operator for more complex tasks
        'tpope/vim-repeat',
        version = "*",
    },
    {
        -- detect tabstop/shiftwidth
        'tpope/vim-sleuth',
        version = "*",
    },
    {
        -- surround text objects with opening/closing symbols
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup {} end,
        version = "*",
    },
    {
        -- extend default text objects
        'wellle/targets.vim',
        version = "*",
    },
    {
        -- handle trailing whitespace
        'ntpeters/vim-better-whitespace',
        config = function() require('vim-better-whitespace_conf') end,
        version = "*",
    },
    {
        -- multiple cursors
        'mg979/vim-visual-multi',
        version = "*",
    },
    {
        -- easily align text
        'junegunn/vim-easy-align',
        config = function() require('vim-easy-align_conf') end,
        version = "*",
    },
    {
        -- status line (bottom)
        'nvim-lualine/lualine.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine_conf') end,
        version = "*",
    },
    {
        -- buffer line (top)
        'akinsho/bufferline.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('bufferline_conf') end,
        version = "*",
    },
    {
        -- colorscheme
        'ellisonleao/gruvbox.nvim',
        config = function() require('gruvbox_conf') end,
        version = "*",
    },
    {
        -- change color on (), []... for better readability when on treesitter aware syntax
        'HiPhish/rainbow-delimiters.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
        config = function() require('rainbow-delimiters_conf') end,
        version = "*",
    },
    {
        -- change color on (), []... for better readability on any filetype
        'luochen1990/rainbow',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
        version = "*",
    },
    {
        -- autocompletion engine
        'hrsh7th/nvim-cmp',
        config = function() require('cmp_conf') end,
        version = "*",
    },
    {
        -- autocompletion (lsp based)
        'hrsh7th/cmp-nvim-lsp',
        dependencies = 'hrsh7th/nvim-cmp',
        version = "*",
    },
    {
        -- autocompletion (buffer based)
        'hrsh7th/cmp-buffer',
        dependencies = 'hrsh7th/nvim-cmp',
        version = "*",
    },
    {
        -- autocompletion (filepath based)
        'hrsh7th/cmp-path',
        dependencies = 'hrsh7th/nvim-cmp',
        version = "*",
    },
    {
        -- autocompletion (command based)
        'hrsh7th/cmp-cmdline',
        dependencies = 'hrsh7th/nvim-cmp',
        version = "*",
    },
    {
        -- autocompletion on lsp function/class signature
        'hrsh7th/cmp-nvim-lsp-signature-help',
        dependencies = 'hrsh7th/nvim-cmp',
        version = "*",
    },
    {
        -- autocompletion (lua)
        'hrsh7th/cmp-nvim-lua',
        dependencies = 'hrsh7th/nvim-cmp',
        version = "*",
    },
    {
        -- snippet engine
        "L3MON4D3/LuaSnip",
        config = function() require('luasnip_conf') end,
        version = "1.*",
        dependencies = { 'hrsh7th/nvim-cmp', 'rafamadriz/friendly-snippets', 'honza/vim-snippets' },
        version = "*",
    },
    {
        -- autocompletion (luasnip snippets)
        'saadparwaiz1/cmp_luasnip',
        dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip", 'honza/vim-snippets', 'rafamadriz/friendly-snippets' },
        version = "*",
    },
    {
        -- git handler
        'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end,
        version = "*",
    },
    {
        -- rich snippet collection
        'honza/vim-snippets',
        version = "*",
    },
    {
        -- rich snippet collection
        'rafamadriz/friendly-snippets',
        version = "*",
    },
    {
        -- git modifications explorer/handler
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function() require('gitsigns_conf') end,
        version = "*",
    },
    {
        -- open current git project on github
        'tpope/vim-rhubarb',
        version = "*",
    },
    {
        -- telescope extension for luasnip snippets
        'benfowler/telescope-luasnip.nvim',
        dependencies = { 'L3MON4D3/LuaSnip', 'nvim-telescope/telescope.nvim' },
        version = "*",
    },
    {
        -- telescope extension file browser
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        version = "*",
    },
    {
        -- html easy text generation
        'mattn/emmet-vim',
        ft = 'html',
        version = "*",
    },
    {
        -- haskell filetype enhancements
        'neovimhaskell/haskell-vim',
        ft = 'haskell',
        version = "*",
    },
    {
        -- exchange mode for vim to swap texts between two text objects
        'tommcdo/vim-exchange',
        version = "*",
    },
    {
        -- lua module for asynchronous programming (dependancy lib)
        'nvim-lua/plenary.nvim',
        version = "*",
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true,   -- This automatically runs `require("luarocks-nvim").setup()`
        version = "*",
    },
    {
        -- org mode but for vimmers :)
        'nvim-neorg/neorg',
        cmd = 'Neorg sync-parsers',
        dependencies = { 'luarocks.nvim', 'nvim-neorg/neorg-telescope' },
        ft = 'norg',
        config = function() require('neorg_conf') end,
        version = "*",
    },
    {
        'nvim-neorg/neorg-telescope',
        dependencies = { 'nvim-neorg/neorg', 'nvim-telescope/telescope.nvim' },
        version = "*",
    },
    {
        -- fuzzy finding anything anywhere
        'nvim-telescope/telescope.nvim',
        config = function() require('telescope_conf') end,
        version = "*",
    },
    {
        -- enhanced syntax by treesitter
        'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter_conf') end,
        version = "*",
    },
    {
        -- extend default text objects with treesitter syntax awareness
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        version = "*",
    },
    {
        -- easily config neovim lsp
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'glepnir/lspsaga.nvim' },
        config = function() require('lsp_conf') end,
        version = "*",
    },
    {
        -- easily install/update lsp servers directly from neovim
        'williamboman/mason.nvim',
        config = function() require('mason_conf') end,
        version = "*",
    },
    {
        -- bridge between mason and nvim-lspconfig
        'williamboman/mason-lspconfig',
        dependencies = { "williamboman/mason.nvim" },
        config = function() require('mason-lspconfig').setup {} end,
        version = "*",
    },
    {
        -- indent lines
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent-blankline_conf') end,
        version = "*",
    },
    {
        -- nice view for git diff
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('diffview_conf') end,
        version = "*",
    },
    {
        -- autoclose pairs (), [], etc
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup({}) end,
        version = "*",
    },
    {
        -- syntax aware commenting
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
        event = { "BufReadPre", "BufNewFile" },
        version = "*",
    },
    {
        -- embed neovim on the browser
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end,
        config = function() require('firenvim_conf') end,
        version = "*",
    },
    {
        -- debugger engine
        'mfussenegger/nvim-dap',
        config = function() require('dap_conf') end,
        version = "*",
    },
    {
        -- dap python debugger
        'mfussenegger/nvim-dap-python',
        dependencies = { "mfussenegger/nvim-dap" },
        config = function() require('dap-python_conf') end,
        version = "*",
    },
    {
        -- dap ui
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio" },
        config = function() require('dap-ui_conf') end,
        version = "*",
    },
    {
        -- autocompletion (debugger)
        "rcarriga/cmp-dap",
        dependencies = { "hrsh7th/nvim-cmp", "mfussenegger/nvim-dap" },
        version = "*",
    },
    {
        -- a pretty list for diagnostics
        'folke/trouble.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function() require('trouble_conf') end,
        version = "*",
    },
    {
        -- neovim terminal handler
        'akinsho/toggleterm.nvim',
        dependencies = 'jpalardy/vim-slime',
        config = function() require('toggleterm_conf') end,
        version = "*",
    },
    {
        -- show available keymaps + description as you type them
        'folke/which-key.nvim',
        config = function() require('which-key_conf') end,
        version = "*",
    },
    {
        -- zen mode, enhanced window zooming
        'Pocco81/true-zen.nvim',
        config = function() require('true-zen_conf') end,
        version = "*",
    },
    {
        -- dim interactive portions of code you are editing
        'folke/twilight.nvim',
        config = function() require('twilight_conf') end,
        version = "*",
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
        version = "*",
    },
    {
        -- set commentstring option based on the cursor location in the file.
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        version = "*",
    },
    {
        -- caching init to improve starting time
        'lewis6991/impatient.nvim',
        version = "*",
    },
    {
        -- enhance C-A, C-X
        'nat-418/boole.nvim',
        config = function() require('boole_conf') end,
        version = "*",
    },
    {
        -- vifm file manager inside neovim
        'vifm/vifm.vim',
        config = function() require('vifm_conf') end,
        version = "*",
    },
    {
        -- zen mode, enhanced window zooming, neorg presentation friendly
        'folke/zen-mode.nvim',
        config = function() require('zen_mode_conf') end,
        version = "*",
    },
    {
        -- lsp progress eye candy
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup {} end,
        tag = 'legacy',
        version = "*",
    },
    {
        -- make your code rain or play game of life :p
        'eandrju/cellular-automaton.nvim',
        version = "*",
    },
    {
        -- manage annotations
        'danymat/neogen',
        config = function() require('neogen_conf') end,
        dependencies = 'nvim-treesitter/nvim-treesitter',
        version = "*",
    },
    {
        -- remove cursorline and cursorcolumn from incactive buffers
        'tummetott/reticle.nvim',
        config = function() require('reticle_conf') end,
        version = "*",
    },
    {
        -- auto activate/deactivate hlsearch when in/out of search
        'asiryk/auto-hlsearch.nvim',
        config = function() require('auto-hlsearch').setup() end,
        version = "*",
    },
    {
        -- helm chart syntax highlighter
        'towolf/vim-helm',
        ft = { 'yaml', 'helm' },
        version = "*",
    },
    {
        -- telescope extension to change current directory
        'zane-/cder.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        config = function() require('telescope').load_extension('cder') end,
        version = "*",
    },
    {
        -- improve default vim.ui interfaces
        'stevearc/dressing.nvim',
        config = function() require('dressing').setup() end,
        version = "*",
    },
    {
        -- ui components
        'MunifTanjim/nui.nvim',
        version = "*",
    },
    {
        -- in text colorizer
        'NvChad/nvim-colorizer.lua',
        config = function() require('colorizer_conf') end,
        version = "*",
    },
    {
        -- play some blackjack in neovim
        'alanfortlink/blackjack.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        version = "*",
    },
    {
        -- split smart and move between splits
        'mrjones2014/smart-splits.nvim',
        config = function() require('smart-splits_conf') end,
        version = "*",
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        version = "*",
    },
    {
        -- file explorer to edit filesystem like a normal buffer, vim-vinegar like
        'stevearc/oil.nvim',
        config = function() require('oil_conf') end,
        version = "*",
    },
    {
        -- open files in the parent nvim session when invoking neovim from a child terminal
        'willothy/flatten.nvim',
        config = true,
        version = "*",
    },
    {
        -- ui for lsp features
        "glepnir/lspsaga.nvim",
        config = function() require("lspsaga_conf") end,
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
        version = "*",
    },
    {
        -- create gitignore files automatically
        "wintermute-cell/gitignore.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        version = "*",
    },
    {
        -- move blocks respecting indentation
        'fedepujol/move.nvim',
        config = function() require("move_conf") end,
        version = "*",
    },
    {
        -- create nice tables
        "dhruvasagar/vim-table-mode",
        config = function() require("table-mode_conf") end,
        version = "*",
    },
    {
        -- search emojis by name in telescope
        "xiyaowong/telescope-emoji.nvim",
        version = "*",
    },
    {
        -- project management
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                show_hidden = true
            }
        end,
        version = "*",
    },
    {
        -- change pickers on the fly for telescope (ex. include/ignore hidden files from search)
        "Theo-Steiner/togglescope",
        version = "*",
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("todo-comment_conf") end,
        version = "*",
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
        version = "*",
    },
    {
        -- markdown preview
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        version = "*",
    },
    {
        -- search nerd font glyphs
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim', 'nvim-telescope/telescope.nvim', },
        cmd = 'Nerdy',
        config = function() require("nerdy_conf") end,
        version = "*",
    },
    {
        -- stop unused lsp servers to save resources
        "zeioth/garbage-day.nvim",
        dependencies = "neovim/nvim-lspconfig",
        version = "*",
    },
    {
        -- provide prompts to IA models served via ollama
        "David-Kunz/gen.nvim",
        config = function() require('gen_conf') end or nil,
        version = "*",
    },
    {
        -- suite to write music sheets charts with lilypond
        'martineausimon/nvim-lilypond-suite',
        config = function()
            require('nvls').setup({
                -- edit config here (see "Customize default settings" in wiki)
            })
        end,
        version = "*",
    },
    {
        -- render markdown nicely
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ft = "markdown",
        config = function() require('render_markdown_conf') end,
        version = "*",
    },
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function() require('conform_conf') end,
        version = "*",
    },
    {
        'nvim-pack/nvim-spectre',
        config = function() require('spectre_conf') end,
        dependencies = { "nvim-lua/plenary.nvim" },
        version = "*",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true
    }

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

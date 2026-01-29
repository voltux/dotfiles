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
        version = "v1.13.0"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
    },
    {
        -- filetype icons
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons_conf') end,
    },
    {
        -- multilevel undo explorer
        'mbbill/undotree',
        config = function() require('undotree_conf') end,
    },
    {
        -- better marks support
        'chentoast/marks.nvim',
        config = function() require('marks').setup() end,
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
    },
    {
        -- extend default text objects
        'wellle/targets.vim',
    },
    {
        -- handle trailing whitespace
        'ntpeters/vim-better-whitespace',
        config = function() require('vim-better-whitespace_conf') end,
    },
    {
        -- multiple cursors
        'mg979/vim-visual-multi',
    },
    {
        -- easily align text
        'junegunn/vim-easy-align',
        config = function() require('vim-easy-align_conf') end,
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
        'HiPhish/rainbow-delimiters.nvim',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
        config = function() require('rainbow-delimiters_conf') end,
    },
    {
        -- change color on (), []... for better readability on any filetype
        'luochen1990/rainbow',
        dependencies = { 'ellisonleao/gruvbox.nvim', opt = true },
    },
    {
        -- snippet engine
        "L3MON4D3/LuaSnip",
        config = function() require('luasnip_conf') end,
        version = "1.*",
        dependencies = { 'hrsh7th/nvim-cmp', 'rafamadriz/friendly-snippets' },
    },
    {
        -- autocompletion (luasnip snippets)
        'saadparwaiz1/cmp_luasnip',
        dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip", 'rafamadriz/friendly-snippets' },
    },
    {
        -- git handler
        'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end,
    },
    {
        -- rich snippet collection
        'rafamadriz/friendly-snippets',
    },
    {
        -- git modifications explorer/handler
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function() require('gitsigns_conf') end,
    },
    {
        -- open current git project on github
        'tpope/vim-rhubarb',
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
    },
    {
        -- lua module for asynchronous programming (dependancy lib)
        'nvim-lua/plenary.nvim',
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true,   -- This automatically runs `require("luarocks-nvim").setup()`
    },
    {
        -- org mode but for vimmers :)
        'nvim-neorg/neorg',
        cmd = 'Neorg sync-parsers',
        dependencies = { 'luarocks.nvim', 'nvim-neorg/lua-utils.nvim', 'pysan3/pathlib.nvim' },
        ft = 'norg',
        version = '*',
        config = function() require('neorg_conf') end,
    },
    {
        'nvim-neorg/neorg-telescope',
        dependencies = { 'nvim-neorg/neorg', 'nvim-telescope/telescope.nvim' },
    },
    {
        -- fuzzy finding anything anywhere
        'nvim-telescope/telescope.nvim',
        config = function() require('telescope_conf') end,
    },
    {
        -- enhanced syntax by treesitter
        'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter_conf') end,
    },
    {
        -- extend default text objects with treesitter syntax awareness
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    {
        -- easily config neovim lsp
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'nvimdev/lspsaga.nvim' },
        config = function() require('lsp_conf') end,
    },
    {
        -- easily install/update lsp servers directly from neovim
        'williamboman/mason.nvim',
        config = function() require('mason_conf') end,
    },
    {
        -- bridge between mason and nvim-lspconfig
        'williamboman/mason-lspconfig',
        dependencies = { "williamboman/mason.nvim" },
        config = function() require('mason-lspconfig').setup({ ensure_installed = {}, automatic_enable = false }) end,
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
    },
    {
        -- dap python debugger
        'mfussenegger/nvim-dap-python',
        dependencies = { "mfussenegger/nvim-dap" },
        config = function() require('dap-python_conf') end,
    },
    {
        -- dap ui
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio" },
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
        config = function() require('trouble_conf') end,
    },
    {
        -- neovim terminal handler
        'akinsho/toggleterm.nvim',
        config = function() require('toggleterm_conf') end,
    },
    {
        -- show available keymaps + description as you type them
        'folke/which-key.nvim',
        config = function() require('which-key_conf') end,
    },
    {
        -- zen mode, enhanced window zooming
        'Pocco81/true-zen.nvim',
        config = function() require('true-zen_conf') end,
    },
    {
        -- dim interactive portions of code you are editing
        'folke/twilight.nvim',
        config = function() require('twilight_conf') end,
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
        event = 'VeryLazy',
    },
    {
        -- caching init to improve starting time
        'lewis6991/impatient.nvim',
    },
    {
        -- vifm file manager inside neovim
        'vifm/vifm.vim',
        config = function() require('vifm_conf') end,
    },
    {
        -- zen mode, enhanced window zooming, neorg presentation friendly
        'folke/zen-mode.nvim',
        config = function() require('zen_mode_conf') end,
    },
    {
        -- lsp progress eye candy
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup {} end,
        tag = 'legacy',
    },
    {
        -- make your code rain or play game of life :p
        'eandrju/cellular-automaton.nvim',
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
        config = function() require('reticle_conf') end,
    },
    {
        -- auto activate/deactivate hlsearch when in/out of search
        'asiryk/auto-hlsearch.nvim',
        config = function() require('auto-hlsearch').setup() end,
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
    },
    {
        -- in text colorizer
        'NvChad/nvim-colorizer.lua',
        config = function() require('colorizer_conf') end,
    },
    {
        -- play some blackjack in neovim
        'alanfortlink/blackjack.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        -- split smart and move between splits
        'mrjones2014/smart-splits.nvim',
        config = function() require('smart-splits_conf') end,
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    },
    {
        -- file explorer to edit filesystem like a normal buffer, vim-vinegar like
        'stevearc/oil.nvim',
        config = function() require('oil_conf') end,
    },
    {
        -- open files in the parent nvim session when invoking neovim from a child terminal
        'willothy/flatten.nvim',
        config = true,
    },
    {
        -- ui for lsp features
        "nvimdev/lspsaga.nvim",
        config = function() require("lspsaga_conf") end,
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    },
    {
        -- create gitignore files automatically
        "wintermute-cell/gitignore.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    {
        -- create nice tables
        "dhruvasagar/vim-table-mode",
        config = function() require("table-mode_conf") end,
    },
    {
        -- search emojis by name in telescope
        "xiyaowong/telescope-emoji.nvim",
    },
    {
        -- project management
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                show_hidden = true
            }
        end,
    },
    {
        -- change pickers on the fly for telescope (ex. include/ignore hidden files from search)
        "Theo-Steiner/togglescope",
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("todo-comment_conf") end,
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
        dependencies = { 'stevearc/dressing.nvim', 'nvim-telescope/telescope.nvim', },
        config = function() require("nerdy_conf") end,
    },
    {
        -- stop unused lsp servers to save resources
        "zeioth/garbage-day.nvim",
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        -- provide prompts to IA models served via ollama
        "David-Kunz/gen.nvim",
        config = function() require('gen_conf') end or nil,
    },
    {
        -- suite to write music sheets charts with lilypond
        'martineausimon/nvim-lilypond-suite',
        config = function()
            require('nvls').setup({
                -- edit config here (see "Customize default settings" in wiki)
            })
        end,
    },
    {
        -- formatter integration
        'stevearc/conform.nvim',
        opts = {},
        config = function() require('conform_conf') end,
    },
    {
        -- search panel
        'nvim-pack/nvim-spectre',
        config = function() require('spectre_conf') end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        -- git integration
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function() require('neogit_conf') end,
    },
    {
        -- swagger http server to preview
        "vinnymeller/swagger-preview.nvim",
        cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
        build = "npm i",
        config = true,
    },
    {
        -- AI integration
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/mcphub.nvim",
        },
        config = function() require('codecompanion_conf') end,
    },
    {
        -- AI integration
        "yetone/avante.nvim",
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = function()
            -- conditionally use the correct build system for the current OS
            if vim.fn.has("win32") == 1 then
                return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            else
                return "make"
            end
        end,
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            'saghen/blink.cmp',              -- autocompletion
            "stevearc/dressing.nvim",        -- for input provider dressing
            "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            "OXY2DEV/markview.nvim",         -- markdown preview
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
        },
        config = function() require('avante_conf') end,
    },
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        dependencies = { "nvim-orgmode/org-bullets.nvim" },
        config = function() require('orgmode_conf') end,
    },
    {
        -- dap python debugger
        'leoluz/nvim-dap-go',
        dependencies = { "leoluz/nvim-dap-go" },
        config = function() require('dap-go_conf') end,
    },
    {
        "rmagatti/auto-session",
        lazy = false,
        opts = {
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        },
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        config = function() require('blink_cmp_conf') end,
    },
    {
        '0xferrous/ansi.nvim',
        config = function()
            require('ansi').setup({
                auto_enable = false,           -- Auto-enable for configured filetypes
                filetypes = { 'log', 'ansi' }, -- Filetypes to auto-enable
            })
        end
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        branch = "main",
        config = function() require('markview_conf') end,
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
    rocks = {
        enabled = false
    }
}

vim.keymap.set('n', '<leader>pl', '<Cmd>Lazy<CR>', { noremap = true, desc = 'Lazy Open' })

-- load plugins
return require('lazy').setup(plugins, opts)

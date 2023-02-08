local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy_setup_table = {
    { 'kyazdani42/nvim-tree.lua',
        config = function() require('nvim-tree_conf') end
    }, -- file explorer
    { 'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-web-devicons_conf') end
    }, -- filetype icons
    { 'mbbill/undotree',
        config = function() require('undotree_conf') end
    }, -- multilevel undo explorer
    { 'jpalardy/vim-slime',
        config = function() require('vim-slime_conf') end
    }, -- send text to terminal
    { 'chentoast/marks.nvim',
        config = function() require('marks').setup() end
    }, -- better marks support
    { 'tversteeg/registers.nvim' }, -- registers explorer
    { 'tpope/vim-eunuch' }, -- add common shell commands to vim command mode
    { 'tpope/vim-unimpaired' }, -- mappings to move in all kinds of vim lists
    { 'tpope/vim-repeat' }, -- enhance the . operator for more complex tasks
    { 'tpope/vim-sleuth' }, -- detect tabstop/shiftwidth
    { 'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup {} end
    }, -- surround text objects with opening/closing symbols
    { 'wellle/targets.vim' }, -- extend default text objects
    { 'ntpeters/vim-better-whitespace',
        config = function() require('vim-better-whitespace_conf') end
    }, -- handle trailing whitespace
    { 'mg979/vim-visual-multi' }, -- multiple cursors
    { 'junegunn/vim-easy-align',
        config = function() require('vim-easy-align_conf') end
    }, -- easily align text
    { 'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine_conf') end
    }, -- status line (bottom)
    { 'akinsho/bufferline.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function() require('bufferline_conf') end
    }, -- buffer line (top)
    { 'kana/vim-textobj-user' }, -- extend default text objects
    { 'kana/vim-textobj-line',
        dependencies = { 'kana/vim-textobj-user' }
    }, -- extend default text objects
    { 'kana/vim-textobj-entire',
        dependencies = { 'kana/vim-textobj-user' }
    }, -- extend default text objects
    { 'Julian/vim-textobj-variable-segment',
        dependencies = { 'kana/vim-textobj-user' }
    }, -- extend default text objects
    { 'michaeljsmith/vim-indent-object',
        dependencies = { 'kana/vim-textobj-user' }
    }, -- extend default text objects
    { 'ellisonleao/gruvbox.nvim',
        config = function() require('gruvbox_conf') end
    }, -- colorscheme
    { 'p00f/nvim-ts-rainbow',
        config = function() require('nvim-ts-rainbow_conf') end
    }, -- change color on (), []... for better readability when on treesitter aware syntax
    { 'luochen1990/rainbow' }, -- change color on (), []... for better readability on any filetype
    { 'hrsh7th/cmp-nvim-lsp' }, -- autocompletion (lsp based)
    { 'hrsh7th/cmp-buffer' }, -- autocompletion (buffer based)
    { 'hrsh7th/cmp-path' }, -- autocompletion (filepath based)
    { 'hrsh7th/cmp-cmdline' }, -- autocompletion (command based)
    { 'hrsh7th/nvim-cmp',
        dependencies = { 'L3MON4D3/LuaSnip' },
        config = function() require('cmp_conf') end
    }, -- autocompletion engine
    { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- autocompletion on lsp function/class signature
    { 'hrsh7th/cmp-nvim-lua' }, -- autocompletion (lua)
    { 'L3MON4D3/LuaSnip',
        config = function() require('luasnip_conf') end
    }, -- snippet engine
    { 'saadparwaiz1/cmp_luasnip' }, -- autocompletion (luasnip snippets)
    { 'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end
    }, -- git handler
    { 'honza/vim-snippets' }, -- rich snippet collection
    { 'rafamadriz/friendly-snippets' }, -- rich snippet collection
    { 'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns_conf') end
    }, -- git modifications explorer/handler
    { 'tpope/vim-rhubarb' }, -- open current git project on github
    { 'benfowler/telescope-luasnip.nvim',
        dependencies = { 'L3MON4D3/LuaSnip' }
    }, -- telescope extension for luasnip snippets
    { 'nvim-telescope/telescope-ui-select.nvim' }, -- telescope extension to use telescope as selection ui instead of vim command line
    { 'nvim-telescope/telescope-file-browser.nvim' }, -- telescope extension file browser
    { 'nvim-telescope/telescope-project.nvim' }, -- telescope extension project finder
    { 'plasticboy/vim-markdown' }, -- markdown filetype enhancements
    { 'mattn/emmet-vim' }, -- html easy text generation
    { 'neovimhaskell/haskell-vim' }, -- haskell filetype enhancements
    { 'amiorin/vim-textile' }, -- textile filetype enhancements
    { 'tommcdo/vim-exchange' }, -- exchange mode for vim to swap texts between two text objects
    { 'fatih/vim-go',
        config = function() require('vim-go_conf') end
    }, -- go filetype enhancements, commands and project handling
    { 'nvim-lua/plenary.nvim' }, -- lua module for asynchronous programming (dependancy lib)
    { 'nvim-neorg/neorg',
        dependencies = 'nvim-lua/plenary.nvim',
        ft = 'norg',
        tag = '0.0.18',
        config = function() require('neorg_conf') end
    }, -- org mode but for vimmers :)
    { 'nvim-neorg/neorg-telescope' }, -- neorg integration with telescope
    { 'nvim-telescope/telescope.nvim',
        config = function() require('telescope_conf') end
    }, -- fuzzy finding anything anywhere
    { 'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter_conf') end
    }, -- enhanced syntax by treesitter
    { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = 'nvim-treesitter/nvim-treesitter' }, -- extend default text objects with treesitter syntax awareness
    { 'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
        config = function() require('lsp_conf') end
    }, -- easily config neovim lsp
    { 'williamboman/mason.nvim',
        config = function() require('mason').setup {} end
    }, -- easily install/update lsp servers directly from neovim
    { 'williamboman/mason-lspconfig',
        config = function() require('mason-lspconfig').setup {} end
    }, -- bridge between mason and nvim-lspconfig
    { 'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent-blankline_conf') end
    }, -- indent lines
    { 'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('diffview_conf') end
    }, -- nice view for git diff
    { 'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }, -- autoclose pairs, (), []...
    { 'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }, -- syntax aware commenting
    { 'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end,
        config = function() require('firenvim_conf') end
    }, -- embed neovim on the browser
    { 'mfussenegger/nvim-dap',
        config = function() require('dap_conf') end
    }, -- debugger engine
    { 'mfussenegger/nvim-dap-python',
        config = function() require('dap-python_conf') end
    }, -- dap python debugger
    { 'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function() require('dap-ui_conf') end
    }, -- dap ui
    { 'rcarriga/cmp-dap' }, -- autocompletion (debugger)
    { 'folke/trouble.nvim',
        config = function() require('trouble_conf') end
    }, -- a pretty list for diagnostics
    { 'akinsho/toggleterm.nvim',
        config = function() require('toggleterm_conf') end
    }, -- neovim terminal handler
    { 'folke/which-key.nvim',
        config = function() require('which-key_conf') end
    }, -- show available keymaps + description as you type them
    { 'Pocco81/true-zen.nvim',
        config = function() require('true-zen_conf') end
    }, -- zen mode, enhanced window zooming
    { 'folke/twilight.nvim',
        config = function() require('twilight_conf') end
    }, -- dim interactive portions of code you are editing
    { 'stevearc/aerial.nvim',
        config = function() require('aerial_conf') end
    }, -- minimap
    { 'folke/neodev.nvim',
        config = function()
            require('neodev').setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    }, -- init.lua syntax awareness and completion
    { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- set commentstring option based on the cursor location in the file.
    { 'lewis6991/impatient.nvim' }, -- caching init to improve starting time
    { 'toppair/peek.nvim',
        build = 'deno task --quiet build:fast',
        config = function() require('peek_conf') end
    }, -- markdown preview plugin based on deno
    { 'nat-418/boole.nvim',
        config = function() require('boole_conf') end
    }, -- enhance C-A, C-X
    { 'vifm/vifm.vim',
        config = function() require('vifm_conf') end
    }, -- vifm file manager inside neovim
    { 'folke/zen-mode.nvim',
        config = function() require('zen_mode_conf') end
    }, -- zen mode, enhanced window zooming, neorg presentation friendly
    { 'kosayoda/nvim-lightbulb' },
    { 'j-hui/fidget.nvim',
        config = function() require('fidget').setup {} end
    }, -- lsp progress eye candy
    { 'eandrju/cellular-automaton.nvim' }, -- make your code rain or play game of life :p
    {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        dependencies = "nvim-treesitter/nvim-treesitter",
    }, -- manage annotations

}

-- plugins
return require('lazy').setup(lazy_setup_table)

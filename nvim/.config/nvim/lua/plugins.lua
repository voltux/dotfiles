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
        dependencies = 'nvim-tree/nvim-web-devicons',
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
        config = function() require('undotree_conf') end
    },
    {
        -- send text to terminal
        'jpalardy/vim-slime',
        lazy = true,
        config = function() require('vim-slime_conf') end
    },
    {
        -- better marks support
        'chentoast/marks.nvim',
        config = function() require('marks').setup() end
    },
    {
        -- registers explorer
        'tversteeg/registers.nvim'
    },
    {
        -- add common shell commands to vim command mode
        'tpope/vim-eunuch'
    },
    {
        -- mappings to move in all kinds of vim lists
        'tpope/vim-unimpaired'
    },
    {
        -- enhance the . operator for more complex tasks
        'tpope/vim-repeat'
    },
    {
        -- detect tabstop/shiftwidth
        'tpope/vim-sleuth'
    },
    {
        -- surround text objects with opening/closing symbols
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup {} end
    },
    {
        -- extend default text objects
        'wellle/targets.vim'
    },
    {
        -- handle trailing whitespace
        'ntpeters/vim-better-whitespace',
        config = function() require('vim-better-whitespace_conf') end
    },
    {
        -- multiple cursors
        'mg979/vim-visual-multi'
    },
    {
        -- easily align text
        'junegunn/vim-easy-align',
        config = function() require('vim-easy-align_conf') end
    },
    {
        -- status line (bottom)
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine_conf') end
    },
    {
        -- buffer line (top)
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require('bufferline_conf') end
    },
    {
        -- extend default text objects
        'kana/vim-textobj-user'
    },
    {
        -- extend default text objects
        'kana/vim-textobj-line',
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        -- extend default text objects
        'kana/vim-textobj-entire',
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        -- extend default text objects
        'Julian/vim-textobj-variable-segment',
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        -- extend default text objects
        'michaeljsmith/vim-indent-object',
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        -- colorscheme
        'ellisonleao/gruvbox.nvim',
        config = function() require('gruvbox_conf') end
    },
    {
        -- change color on (), []... for better readability when on treesitter aware syntax
        'p00f/nvim-ts-rainbow',
        config = function() require('nvim-ts-rainbow_conf') end
    },
    {
        'luochen1990/rainbow'
    }, -- change color on (), []... for better readability on any filetype
    {
        'hrsh7th/cmp-nvim-lsp'
    }, -- autocompletion (lsp based)
    {
        'hrsh7th/cmp-buffer'
    }, -- autocompletion (buffer based)
    {
        'hrsh7th/cmp-path'
    }, -- autocompletion (filepath based)
    {
        -- autocompletion (command based)
        'hrsh7th/cmp-cmdline'
    },
    {
        -- autocompletion engine
        'hrsh7th/nvim-cmp',
        dependencies = { 'L3MON4D3/LuaSnip' },
        config = function() require('cmp_conf') end
    },
    {
        -- autocompletion on lsp function/class signature
        'hrsh7th/cmp-nvim-lsp-signature-help'
    },
    {
        -- autocompletion (lua)
        'hrsh7th/cmp-nvim-lua'
    },
    {
        -- snippet engine
        'L3MON4D3/LuaSnip',
        config = function() require('luasnip_conf') end
    },
    {
        -- autocompletion (luasnip snippets)
        'saadparwaiz1/cmp_luasnip'
    },
    {
        -- git handler
        'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end
    },
    {
        -- rich snippet collection
        'honza/vim-snippets'
    },
    {
        -- rich snippet collection
        'rafamadriz/friendly-snippets'
    },
    {
        -- git modifications explorer/handler
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns_conf') end
    },
    {
        -- open current git project on github
        'tpope/vim-rhubarb'
    },
    {
        -- telescope extension for luasnip snippets
        'benfowler/telescope-luasnip.nvim',
        dependencies = { 'L3MON4D3/LuaSnip' }
    },
    {
        -- telescope extension to use telescope as selection ui instead of vim command line
        'nvim-telescope/telescope-ui-select.nvim'
    },
    {
        -- telescope extension file browser
        'nvim-telescope/telescope-file-browser.nvim'
    },
    {
        -- telescope extension project finder
        'nvim-telescope/telescope-project.nvim'
    },
    {
        -- markdown filetype enhancements
        'plasticboy/vim-markdown'
    },
    {
        -- html easy text generation
        'mattn/emmet-vim'
    },
    {
        -- haskell filetype enhancements
        'neovimhaskell/haskell-vim',
        ft = 'haskell',
    },
    {
        -- exchange mode for vim to swap texts between two text objects
        'tommcdo/vim-exchange'
    },
    {
        -- go filetype enhancements, commands and project handling
        'fatih/vim-go',
        ft = 'go',
        config = function() require('vim-go_conf') end
    },
    {
        -- lua module for asynchronous programming (dependancy lib)
        'nvim-lua/plenary.nvim'
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
        'nvim-neorg/neorg-telescope'
    },
    {
        -- fuzzy finding anything anywhere
        'nvim-telescope/telescope.nvim',
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
        lazy = true,
    },
    {
        -- easily config neovim lsp
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
        config = function() require('lsp_conf') end
    },
    {
        -- easily install/update lsp servers directly from neovim
        'williamboman/mason.nvim',
        config = function() require('mason_conf') end
    },
    {
        -- bridge between mason and nvim-lspconfig
        'williamboman/mason-lspconfig',
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
        config = function() require('diffview_conf') end
    },
    {
        -- autoclose pairs, (), []...
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    },
    {
        -- syntax aware commenting
        'numToStr/Comment.nvim',
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
        config = function() require('dap_conf') end
    },
    {
        -- dap python debugger
        'mfussenegger/nvim-dap-python',
        config = function() require('dap-python_conf') end
    },
    {
        -- dap ui
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function() require('dap-ui_conf') end
    },
    {
        -- autocompletion (debugger)
        'rcarriga/cmp-dap'
    },
    {
        -- a pretty list for diagnostics
        'folke/trouble.nvim',
        config = function() require('trouble_conf') end
    },
    {
        -- neovim terminal handler
        'akinsho/toggleterm.nvim',
        dependencies = 'jpalardy/vim-slime',
        config = function() require('toggleterm_conf') end,
    },
    {
        -- show available keymaps + description as you type them
        'folke/which-key.nvim',
        config = function() require('which-key_conf') end
    },
    {
        -- zen mode, enhanced window zooming
        'Pocco81/true-zen.nvim',
        config = function() require('true-zen_conf') end
    },
    {
        -- dim interactive portions of code you are editing
        'folke/twilight.nvim',
        config = function() require('twilight_conf') end
    },
    {
        -- minimap
        'stevearc/aerial.nvim',
        config = function() require('aerial_conf') end
    },
    {
        -- init.lua syntax awareness and completion
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup({
                library = { plugins = { 'nvim-dap-ui' }, types = true },
            })
        end
    },
    {
        -- set commentstring option based on the cursor location in the file.
        'JoosepAlviste/nvim-ts-context-commentstring'
    },
    {
        -- caching init to improve starting time
        'lewis6991/impatient.nvim'
    },
    {
        -- markdown preview plugin based on deno
        'toppair/peek.nvim',
        build = 'deno task --quiet build:fast',
        config = function() require('peek_conf') end
    },
    {
        -- enhance C-A, C-X
        'nat-418/boole.nvim',
        config = function() require('boole_conf') end
    },
    {
        -- vifm file manager inside neovim
        'vifm/vifm.vim',
        config = function() require('vifm_conf') end
    },
    {
        -- zen mode, enhanced window zooming, neorg presentation friendly
        'folke/zen-mode.nvim',
        config = function() require('zen_mode_conf') end
    },
    {
        -- show a lightbulb when code actions are available
        'kosayoda/nvim-lightbulb'
    },
    {
        -- lsp progress eye candy
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup {} end
    },
    {
        -- make your code rain or play game of life :p
        'eandrju/cellular-automaton.nvim'
    },
    {
        -- manage annotations
        'danymat/neogen',
        config = function()
            require('neogen').setup {}
        end,
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    {
        -- remove cursorline and cursorcolumn from incactive buffers
        'tummetott/reticle.nvim',
        config = function() require('reticle').setup {} end
    },
    {
        -- auto activate/deactivate hlsearch when in/out of search
        'asiryk/auto-hlsearch.nvim',
        config = function() require('auto-hlsearch').setup() end
    }
}

vim.api.nvim_set_keymap('n', '<leader>pl', '<Cmd>Lazy<CR>', { noremap = true, desc = 'Lazy Open' })

-- load plugins
return require('lazy').setup(lazy_setup_table)

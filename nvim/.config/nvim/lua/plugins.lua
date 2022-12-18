-- verify if packer is installed, else try to install it
local ensure_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.api.nvim_set_keymap('n', '<leader>pu', '<cmd>PackerSync<cr>', { noremap = true, desc = 'Packer synchronize plugins' })

-- plugins
return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' } -- package manager
    use { 'kyazdani42/nvim-tree.lua',
        config = function() require('nvim-tree_conf') end
    } -- file explorer
    use { 'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-web-devicons_conf') end
    } -- filetype icons
    use { 'mbbill/undotree',
        config = function() require('undotree_conf') end
    } -- multilevel undo explorer
    use { 'christoomey/vim-tmux-navigator' } -- easily move from between vim windows and tmux panes
    use { 'jpalardy/vim-slime',
        config = function() require('vim-slime_conf') end
    } -- send text to terminal
    use { 'chentoast/marks.nvim',
        config = function() require('marks').setup() end
    } -- better marks support
    use { 'tversteeg/registers.nvim' } -- registers explorer
    use { 'tpope/vim-eunuch' } -- add common shell commands to vim command mode
    use { 'tpope/vim-unimpaired' } -- mappings to move in all kinds of vim lists
    use { 'tpope/vim-repeat' } -- enhance the . operator for more complex tasks
    use { 'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup {} end
    } -- surround text objects with opening/closing symbols
    use { 'wellle/targets.vim' } -- extend default text objects
    use { 'ntpeters/vim-better-whitespace',
        config = function() require('vim-better-whitespace_conf') end
    } -- handle trailing whitespace
    use { 'mg979/vim-visual-multi' } -- multiple cursors
    use { 'junegunn/vim-easy-align',
        config = function() require('vim-easy-align_conf') end
    } -- easily align text
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine_conf') end
    } -- status line (bottom)
    use { 'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('bufferline_conf') end
    } -- buffer line (top)
    use { 'kana/vim-textobj-user' } -- extend default text objects
    use { 'kana/vim-textobj-line',
        requires = { 'kana/vim-textobj-user' }
    } -- extend default text objects
    use { 'kana/vim-textobj-entire',
        requires = { 'kana/vim-textobj-user' }
    } -- extend default text objects
    use { 'Julian/vim-textobj-variable-segment',
        requires = { 'kana/vim-textobj-user' }
    } -- extend default text objects
    use { 'michaeljsmith/vim-indent-object',
        requires = { 'kana/vim-textobj-user' }
    } -- extend default text objects
    use { 'ellisonleao/gruvbox.nvim',
        config = function() require('gruvbox_conf') end
    } -- colorscheme
    use { 'p00f/nvim-ts-rainbow',
        config = function() require('nvim-ts-rainbow_conf') end
    } -- change color on (), []... for better readability when on treesitter aware syntax
    use { 'luochen1990/rainbow' } -- change color on (), []... for better readability on any filetype
    use { 'hrsh7th/cmp-nvim-lsp' } -- autocompletion (lsp based)
    use { 'hrsh7th/cmp-buffer' } -- autocompletion (buffer based)
    use { 'hrsh7th/cmp-path' } -- autocompletion (filepath based)
    use { 'hrsh7th/cmp-cmdline' } -- autocompletion (command based)
    use { 'hrsh7th/nvim-cmp',
        requires = { 'L3MON4D3/LuaSnip' },
        config = function() require('cmp_conf') end
    } -- autocompletion engine
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' } -- autocompletion on lsp function/class signature
    use { 'hrsh7th/cmp-nvim-lua' } -- autocompletion (lua)
    use { 'L3MON4D3/LuaSnip',
        config = function() require('luasnip_conf') end
    } -- snippet engine
    use { 'saadparwaiz1/cmp_luasnip' } -- autocompletion (luasnip snippets)
    use { 'tpope/vim-fugitive',
        config = function() require('fugitive_conf') end
    } -- git handler
    use { 'honza/vim-snippets' } -- rich snippet collection
    use { 'rafamadriz/friendly-snippets' } -- rich snippet collection
    use { 'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns_conf') end
    } -- git modifications explorer/handler
    use { 'tpope/vim-rhubarb' } -- open current git project on github
    use { 'benfowler/telescope-luasnip.nvim',
        requires = { 'L3MON4D3/LuaSnip' }
    } -- telescope extension for luasnip snippets
    use { 'nvim-telescope/telescope-ui-select.nvim' } -- telescope extension to use telescope as selection ui instead of vim command line
    use { 'nvim-telescope/telescope-file-browser.nvim' } -- telescope extension file browser
    use { 'nvim-telescope/telescope-project.nvim' } -- telescope extension project finder
    use { 'plasticboy/vim-markdown' } -- markdown filetype enhancements
    use { 'mattn/emmet-vim' } -- html easy text generation
    use { 'neovimhaskell/haskell-vim' } -- haskell filetype enhancements
    use { 'amiorin/vim-textile' } -- textile filetype enhancements
    use { 'tommcdo/vim-exchange' } -- exchange mode for vim to swap texts between two text objects
    use { 'fatih/vim-go',
        config = function() require('vim-go_conf') end
    } -- go filetype enhancements, commands and project handling
    use { 'nvim-lua/plenary.nvim' } -- lua module for asynchronous programming (dependancy lib)
    use { 'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim',
        ft = 'norg',
        config = function() require('neorg_conf') end
    } -- org mode but for vimmers :)
    use { 'nvim-neorg/neorg-telescope' } -- neorg integration with telescope
    use { 'nvim-telescope/telescope.nvim',
        config = function() require('telescope_conf') end
    } -- fuzzy finding anything anywhere
    use { 'nvim-treesitter/nvim-treesitter',
        config = function() require('treesitter_conf') end
    } -- enhanced syntax by treesitter
    use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = 'nvim-treesitter/nvim-treesitter' } -- extend default text objects with treesitter syntax awareness
    use { 'neovim/nvim-lspconfig',
        requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
        config = function() require('lsp_conf') end
    } -- easily config neovim lsp
    use { 'williamboman/mason.nvim',
        config = function() require('mason').setup {} end
    } -- easily install/update lsp servers directly from neovim
    use { 'williamboman/mason-lspconfig',
        config = function() require('mason-lspconfig').setup {} end
    } -- bridge between mason and nvim-lspconfig
    use { 'lukas-reineke/indent-blankline.nvim',
        config = function() require('indent-blankline_conf') end
    } -- indent lines
    use { 'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('diffview_conf') end
    } -- nice view for git diff
    use { 'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    } -- autoclose pairs, (), []...
    use { 'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    } -- syntax aware commenting
    use { 'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = function() require('firenvim_conf') end
    } -- embed neovim on the browser
    use { 'mfussenegger/nvim-dap',
        config = function() require('dap_conf') end
    } -- debugger engine
    use { 'mfussenegger/nvim-dap-python',
        config = function() require('dap-python_conf') end
    } -- dap python debugger
    use { 'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' },
        config = function() require('dap-ui_conf') end
    } -- dap ui
    use { 'rcarriga/cmp-dap' } -- autocompletion (debugger)
    use { 'folke/trouble.nvim',
        config = function() require('trouble_conf') end
    } -- a pretty list for diagnostics
    use { 'akinsho/toggleterm.nvim',
        tag = '*',
        config = function() require('toggleterm_conf') end
    } -- neovim terminal handler
    use { 'folke/which-key.nvim',
        config = function() require('which-key_conf') end
    } -- show available keymaps + description as you type them
    use { 'Pocco81/true-zen.nvim',
        config = function() require('true-zen_conf') end
    } -- zen mode, enhanced window zooming
    use { 'folke/twilight.nvim',
        config = function() require('twilight_conf') end
    } -- dim interactive portions of code you are editing
    use { 'stevearc/aerial.nvim',
        config = function() require('aerial_conf') end
    } -- minimap
    use { 'folke/neodev.nvim',
        config = function() require('neodev').setup({}) end
    } -- init.lua syntax awareness and completion
    use { 'JoosepAlviste/nvim-ts-context-commentstring' } -- set commentstring option based on the cursor location in the file.
    use { 'lewis6991/impatient.nvim' } -- caching init to improve starting time
    use { 'toppair/peek.nvim',
        run = 'deno task --quiet build:fast',
        config = function() require('peek_conf') end
    } -- markdown preview plugin based on deno
    use { 'nat-418/boole.nvim',
        config = function() require('boole_conf') end
    } -- enhance C-A, C-X
    use { 'vifm/vifm.vim',
        config = function() require('vifm_conf') end
    } -- vifm file manager inside neovim
    use { 'folke/zen-mode.nvim',
        config = function() require('zen_mode_conf') end
    } -- zen mode, enhanced window zooming, neorg presentation friendly
    use { 'kosayoda/nvim-lightbulb' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

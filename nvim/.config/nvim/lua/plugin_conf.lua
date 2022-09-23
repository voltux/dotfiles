--setup needed functions
local setkm = vim.api.nvim_set_keymap

--Treesitter
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
    ensure_installed = { 'org' },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
                ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
                ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                ["ab"] = { query = "@block.outer", desc = "Select outer part of a block" },
                ["ib"] = { query = "@block.inner", desc = "Select inner part of a block" },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v',
                ['@function.outer'] = 'V',
                ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = true,
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
}

--Telescope
require('telescope_conf')

-- cmp
local cmp = require('cmp')
local luasnip = require('luasnip')
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' }
    }, {
        { name = 'buffer' },
    })
})

-- cmp configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        {
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        },
        {
            { name = 'buffer' },
        }
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

--Nvim-autopairs
require("nvim-autopairs").setup {}

--Comment
require('Comment').setup()

--Whitespace
vim.cmd [[ highlight ExtraWhitespace ctermbg=78 ]]
setkm('n', '<leader>wh', ':StripWhitespace<CR>', { noremap = true, desc = 'Strip whitespace' })
setkm('n', '<leader>wt', ':ToggleWhitespace<CR>', { noremap = true, desc = 'Strip whitespace' })
vim.g.better_whitespace_enabled = 0
vim.g.strip_whitespace_on_save = 0

--Undotree
setkm('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, desc = 'Undotree Toggle' })

--Slime
vim.g.slime_target           = "tmux"
vim.g.slime_default_config   = '{"socket_name": "default", "target_pane": "1"}'
vim.g.slime_dont_ask_default = 1
vim.g.slime_python_ipython   = 0

--Rainbow brackets
vim.g.rainbow_active = 1

--Easy align
setkm('n', 'ga', '<Plug>(EasyAlign)', { noremap = true, desc = 'EasyAlign activate' })
setkm('v', 'ga', '<Plug>(EasyAlign)', { noremap = true, desc = 'EasyAlign activate' })

--IndentBlankLine
setkm('n', '<leader>i', ':IndentBlanklineToggle<CR>', { noremap = true, desc = 'IndentBlankLine Toggle' })

--Web dev icons
require 'nvim-web-devicons'.setup {
    default = true;
}

--Nvim tree
require("nvim-tree").setup()
setkm('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, desc = 'Toggle NvimTree file explorer' })

--Luasnip
require("luasnip.loaders.from_vscode").lazy_load()
setkm('i', '<silent><expr> <Tab>', 'luasnip#expand_or_jumpable() ? \'<Plug>luasnip-expand-or-jump\' : \'<Tab>\' ', {})
setkm('i', '<silent> <S-Tab>', '<cmd>lua require\'luasnip\'.jump(-1)<Cr>', { noremap = true })
setkm('s', '<silent> <Tab>', '<cmd>lua require(\'luasnip\').jump(1)<Cr>', { noremap = true })
setkm('s', '<silent> <S-Tab>', '<cmd>lua require\'luasnip\'.jump(-1)<Cr>', { noremap = true })
setkm('i', '<silent><expr> <C-E>', 'luasnip#choice_active() ? \'<Plug>luasnip-next-choice\' : \'<C-E>\'', {})
setkm('i', '<silent><expr> <C-E>', 'luasnip#choice_active() ? \'<Plug>luasnip-next-choice\' : \'<C-E>\'', {})

--lualine
require('lualine').setup {
    options = {
        theme = 'gruvbox'
    }
}

--bufferline
require('bufferline').setup()

--dap
setkm('n', '<F9>', '<Cmd>lua require"dap".continue()<CR>', { noremap = true })
setkm('n', '<F5>', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
setkm('n', '<F6>', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    { noremap = true })
setkm('n', '<F7>', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
    { noremap = true })
setkm('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true })
setkm('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true })
setkm('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true })

--dap python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

--dap ui
require("dapui").setup()
setkm('n', '<F8>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })

--firenvim
local localSettingsFirenvim = {
    [".*"] = {
        cmdline = 'neovim',
        takeover = 'never'
    }
}
vim.g.firenvim_config = {
    localSettings = localSettingsFirenvim
}

-- gruvbox colorscheme
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    overrides = {
        SignColumn = { bg = 'NONE' },
        LineNr = { bg = 'NONE' },
        Normal = { bg = 'NONE' }
    },
})
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

-- neorg
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.integrations.telescope"] = {}, -- Enable the telescope module
    }
}
local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<leader>fnl", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)

-- trouble
setkm("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
setkm("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
setkm("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
setkm("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
setkm("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
setkm("n", "<leader>xu", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- toggleterm
require('toggleterm').setup {}
setkm("n", "<leader>sf", "<cmd>ToggleTerm direction=float<cr>",
    { silent = true, noremap = true, desc = 'Toggle floating terminal without showing it on a buffer' })
setkm("n", "<leader>sv", "<cmd>ToggleTerm direction=vertical size=120<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal without showing it on a buffer' })
setkm("n", "<leader>sh", "<cmd>ToggleTerm direction=horizontal size=40<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal without showing it on a buffer' })
setkm("n", "<leader>st", "<cmd>ToggleTerm<cr>",
    { silent = true, noremap = true, desc = 'Toggle terminal without showing it on a buffer' })

-- neovide (gui)
if vim.fn.exists('g:neovide') then
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
    })
    vim.o.background = 'dark'
    vim.cmd("colorscheme gruvbox")
    vim.o.guifont = "Monaco_for_Powerline:h9"
end

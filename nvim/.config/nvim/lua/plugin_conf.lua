--setup needed functions
local setkm = vim.api.nvim_set_keymap

--Treesitter
require('orgmode').setup_ts_grammar()
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
require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "venv/.*" }
    }
}

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
        { name = 'nvim_lsp_signature_help' }
    }, {
        { name = 'buffer' },
    },
        {
            { name = 'orgmode' }
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

--Orgmode
require('orgmode').setup {}

--Nvim-autopairs
require("nvim-autopairs").setup {}

--Comment
require('Comment').setup()

--Whitespace
vim.cmd [[ highlight ExtraWhitespace ctermbg=78 ]]
setkm('n', '<leader>w', ':StripWhitespace<CR>', { noremap = true, desc = 'Strip whitespace' })

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

--Telescope
setkm('n', '<leader>f%', ':Telescope oldfiles<CR>', { noremap = true, desc = 'Telescope find recently open files' })
setkm('n', '<leader>f/', ':Telescope search_history<CR>', { noremap = true, desc = 'Telescope find in search history' })
setkm('n', '<leader>fG', ':Telescope git_status<CR>', { noremap = true, desc = 'Telescope find modified git files' })
setkm('n', '<leader>fa', ':Telescope live_grep<CR>', { noremap = true, desc = 'Telescope find pattern in all files' })
setkm('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, desc = 'Telescope find buffer' })
setkm('n', '<leader>f:', ':Telescope commands<CR>', { noremap = true, desc = 'Telescope find nvim command' })
setkm('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, desc = 'Telescope find diagnostic' })
setkm('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = 'Telescope find file' })
setkm('n', '<leader>fg', ':Telescope git_files<CR>', { noremap = true, desc = 'Telescope find git files' })
setkm('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, desc = 'Telescope find help tags' })
setkm('n', '<leader>fi', ':Telescope current_buffer_fuzzy_find<CR>',
    { noremap = true, desc = 'Telescope find in current buffer' })
setkm('n', '<leader>fj', ':Telescope jumplist<CR>', { noremap = true, desc = 'Telescope find in jumplist' })
setkm('n', '<leader>fk', ':Telescope keymaps<CR>', { noremap = true, desc = 'Telescope find keymap' })
setkm('n', '<leader>fl', ':Telescope loclist<CR>', { noremap = true, desc = 'Telescope find in location list' })
setkm('n', '<leader>f\'', ':Telescope marks<CR>', { noremap = true, desc = 'Telescope find marks' })
setkm('n', '<leader>fo', ':Telescope vim_options<CR>', { noremap = true, desc = 'Telescope find vim option' })
setkm('n', '<leader>fq', ':Telescope quickfix<CR>', { noremap = true, desc = 'Telescope find in quickfix list' })
setkm('n', '<leader>f"', ':Telescope registers<CR>', { noremap = true, desc = 'Telescope find in registers' })
setkm('n', '<leader>fw', ':Telescope grep_string<CR>', { noremap = true, desc = 'Telescope find string in path' })
setkm('n', '<leader>ft', ':Telescope tags<CR>', { noremap = true, desc = 'Telescope find tag' })
setkm('n', '<leader>fu', ':Telescope lsp_references<CR>', { noremap = true, desc = 'Telescope find lsp reference' })
setkm('n', '<leader>f<', ':Telescope lsp_incoming_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who am I calling' })
setkm('n', '<leader>f>', ':Telescope lsp_outgoing_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who is calling me' })
setkm('n', '<leader>f$', ':Telescope lsp_document_symbols<CR>',
    { noremap = true, desc = 'Telescope find in document functions, variables, expressions...' })
setkm('n', '<leader>f^', ':Telescope lsp_workspace_symbols<CR>',
    { noremap = true, desc = 'Telescope find in workspace functions, variables, expressions...' })
setkm('n', '<leader>fD', ':Telescope lsp_definitions<CR>', { noremap = true, desc = 'Telescope find definition' })
setkm('n', '<leader>fI', ':Telescope lsp_implementations<CR>', { noremap = true, desc = 'Telescope find implementation' })
setkm('n', '<leader>ft', ':Telescope lsp_type_definitions<CR>',
    { noremap = true, desc = 'Telescope find type definition' })
setkm('n', '<leader>fv', ':Telescope treesitter<CR>', { noremap = true, desc = 'Telescope find treesitter symbol' })
setkm('n', '<leader>fc', ':Telescope git_commits<CR>', { noremap = true, desc = 'Telescope find in commits' })
setkm('n', '<leader>fT', ':Telescope git_branches<CR>', { noremap = true, desc = 'Telescope find in branches' })
setkm('n', '<leader>fs', ':Telescope git_status<CR>', { noremap = true, desc = 'Telescope find modified git files' })
setkm('n', '<leader>fS', ':Telescope git_stash<CR>', { noremap = true, desc = 'Telescope find git stash' })
setkm('n', '<leader>fB', ':Telescope git_bcommits<CR>',
    { noremap = true, desc = 'Telescope find current buffer commit history' })
setkm('n', '<leader>fz', ':Telescope spell_suggest<CR>',
    { noremap = true, desc = 'Telescope find spelling suggestions for current word under cursor' })

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
vim.cmd("colorscheme gruvbox")
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

--Treesitter
require 'nvim-treesitter.configs'.setup {
    modules = {},
    ensure_installed = {},
    sync_install = false,
    ignore_install = {},
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
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
    context_commentstring = {
        enable = true
    }
}

vim.g.skip_ts_context_commentstring_module = true

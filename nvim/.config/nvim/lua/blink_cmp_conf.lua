require("blink.cmp").setup({
    enabled = function()
        -- Disable for some filetypes
        return not vim.tbl_contains({ "markdown", "neo-tree", "NvimTree" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
    end,
    fuzzy = {
        -- exact matches are always prioritized
        sorts = {
            "exact",
            "score",
            "sort_text",
        },
    },
    signature = {
        enabled = true,
        window = {
            border = "rounded",
        },
    },
    completion = {
        keyword = {
            range = "prefix",
        },
        list = {
            max_items = 500,
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
        documentation = {
            window = { border = "rounded" },
            auto_show = true,
            auto_show_delay_ms = 200,
            treesitter_highlighting = true,
        },
        menu = {
            border = "rounded",
            draw = {
                columns = {
                    { "label",     "label_description", gap = 2 },
                    { "kind_icon", "kind",              "source_name", gap = 1 },
                },
            },
        },
    },
    cmdline = {
        completion = {
            menu = {
                -- show the menu only when writing commands
                auto_show = function(_)
                    return vim.fn.getcmdtype() == ":" or vim.fn.getcmdtype() == "@"
                end,
            },
            ghost_text = {
                enabled = function()
                    return vim.fn.getcmdtype() == ":"
                end,
            },
        },
        keymap = {
            ["<Tab>"] = { "show", "accept" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },

        },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    keymap = {
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-q>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_and_accept()
                end
            end,
            "snippet_forward",
            "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
})

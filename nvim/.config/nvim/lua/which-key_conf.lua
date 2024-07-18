local wk = require('which-key')
wk.add({
    { "<leader>f", group = "find",               mode = "n" },
    { "<leader>c", group = "code",               mode = "n" },
    { "<leader>l", group = "language",           mode = "n" },
    { "<leader>c", group = "check spelling",     mode = "n" },
    { "<leader>s", group = "shell (toggleterm)", mode = "n" },
    { "<leader>S", group = "shell (native)",     mode = "n" },
    { "<leader>w", group = "whitespace",         mode = "n" },
    { "<leader>x", group = "trouble",            mode = "n" },
    { "<leader>g", group = "git",                mode = "n" },
    { "<leader>p", group = "plugin",             mode = "n" },
    { "<leader>t", group = "table mode",         mode = "n" },
    { "<leader>o", group = "Neorg",              mode = "n" },
})
wk.setup {
    win = {
        border = "single"
    },
    disable = {
        filetypes = { 'TelescopePrompt', 'dashboard' }
    },
    triggers = { "<auto>", mode = "n" }
}

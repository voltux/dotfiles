local wk = require('which-key')
wk.add({
    { "<leader>f", group = "find" },
    { "<leader>c", group = "code" },
    { "<leader>l", group = "language" },
    { "<leader>c", group = "check spelling" },
    { "<leader>s", group = "shell (toggleterm)" },
    { "<leader>S", group = "shell (native)" },
    { "<leader>w", group = "whitespace" },
    { "<leader>x", group = "trouble" },
    { "<leader>g", group = "git" },
    { "<leader>p", group = "plugin" },
    { "<leader>t", group = "table mode" },
    { "<leader>o", group = "Neorg" },
})
wk.setup {
    win = {
        border = "single"
    },
    disable = {
        filetypes = { 'TelescopePrompt', 'dashboard' }
    },
}

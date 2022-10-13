require("symbols-outline").setup{}
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>SymbolsOutline<cr>",
    { silent = true, noremap = true, desc = 'Toggle symbols outline' })

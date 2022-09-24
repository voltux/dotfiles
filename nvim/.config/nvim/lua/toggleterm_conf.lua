require('toggleterm').setup {}
vim.api.nvim_set_keymap("n", "<leader>sf", "<cmd>ToggleTerm direction=float<cr>",
    { silent = true, noremap = true, desc = 'Toggle floating terminal' })
vim.api.nvim_set_keymap("n", "<leader>sv", "<cmd>ToggleTerm direction=vertical size=120<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal' })
vim.api.nvim_set_keymap("n", "<leader>sh", "<cmd>ToggleTerm direction=horizontal size=40<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal' })
vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>ToggleTerm<cr>",
    { silent = true, noremap = true, desc = 'Toggle last terminal' })

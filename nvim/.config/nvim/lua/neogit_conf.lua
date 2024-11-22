require('neogit').setup({})
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>",
    { noremap = true, silent = true, desc = 'Toggle Neogit' })

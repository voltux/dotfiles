require('neogit').setup({
    integrations = {
        diffview = true
    }
})
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>",
    { noremap = true, silent = true, desc = 'Toggle Neogit' })

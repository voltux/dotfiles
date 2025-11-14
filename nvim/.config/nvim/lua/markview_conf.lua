require('markview').setup({
    preview = {
        filetypes = { "markdown", "Avante" },
        ignore_buftypes = {},
    },
    max_length = 99999,
})

vim.keymap.set('n', '<leader>pr', '<cmd>Markview toggle<CR>', { noremap = true, desc = 'Markview markdown preview toggle' })

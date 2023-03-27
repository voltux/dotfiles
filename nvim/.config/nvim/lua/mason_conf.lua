vim.keymap.set('n', '<leader>pm', '<Cmd>Mason<CR>', { noremap = true, desc = 'Mason Open'})
require('mason').setup ({
    ui = {
        border = "rounded"
    }
})

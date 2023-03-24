vim.api.nvim_set_keymap('n', '<leader>pm', '<Cmd>Mason<CR>', { noremap = true, desc = 'Mason Open'})
require('mason').setup ({
    ui = {
        border = "single"
    }
})

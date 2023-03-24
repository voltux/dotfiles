local pk = require('peek')
pk.setup {
    theme = 'light'
}

local function peek_toggle()
    if pk.is_open() then
        pk.close()
    else
        pk.open()
    end
end

vim.api.nvim_create_user_command('PeekToggle', peek_toggle, { desc = 'Toggle peek markdown preview' })
vim.keymap.set('n', '<leader>cm', '<cmd>PeekToggle<cr>',
    { noremap = true, silent = true, desc = "Toggle peek markdown preview" })

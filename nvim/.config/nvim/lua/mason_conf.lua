vim.keymap.set('n', '<leader>pm', '<Cmd>Mason<CR>', { noremap = true, desc = 'Mason Open' })
require('mason').setup({
    ui = {
        border = "rounded",
        icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
        },
    },
})

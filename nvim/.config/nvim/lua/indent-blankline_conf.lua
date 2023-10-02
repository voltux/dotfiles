require('ibl').setup {
    enabled = false,
    exclude = { filetypes = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'NvimTree', 'norg' } },
    whitespace = {
        remove_blankline_trail = false,
    },
}
vim.keymap.set('n', '<leader>pi', '<cmd>IBLToggle<CR>', { noremap = true, desc = 'IndentBlankLine Toggle' })

vim.api.nvim_set_keymap('n', '<leader>pi', ':IndentBlanklineToggle<CR>',
    { noremap = true, desc = 'IndentBlankLine Toggle' })
require('indent_blankline').setup {
    filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'NvimTree'},
}
vim.g.indent_blankline_enabled = false

vim.api.nvim_set_keymap('n', '<leader>pi', ':IndentBlanklineToggle<CR>',
    { noremap = true, desc = 'IndentBlankLine Toggle' })
require('indent_blankline').setup {
    filetype_exclude = { 'dashboard' }
}

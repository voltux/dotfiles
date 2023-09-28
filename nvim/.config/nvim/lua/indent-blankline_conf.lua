require('ibl').setup {
    enabled = false,
    filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'NvimTree', 'norg' },
    show_current_context = true,
    whitespace = {
        remove_blankline_trail = false,
    },
}
vim.keymap.set('n', '<leader>pi', ':IBLToggle<CR>', { noremap = true, desc = 'IndentBlankLine Toggle' })

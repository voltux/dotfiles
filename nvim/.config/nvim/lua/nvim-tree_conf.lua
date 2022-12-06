require("nvim-tree").setup()
require('nvim-tree.view').View.winopts.signcolumn = 'no'
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, desc = 'NvimTree Toggle' })

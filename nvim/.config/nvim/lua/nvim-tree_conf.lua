require("nvim-tree").setup {
  view = {
    adaptive_size = true,
  }
}
require('nvim-tree.view').View.winopts.signcolumn = 'no'
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', { noremap = true, desc = 'NvimTree Toggle' })

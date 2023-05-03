vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup {
  hijack_netrw = true,
  view = {
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    }
  }
}
require('nvim-tree.view').View.winopts.signcolumn = 'no'
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', { noremap = true, desc = 'NvimTree Toggle' })

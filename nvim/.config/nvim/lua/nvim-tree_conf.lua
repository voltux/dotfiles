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

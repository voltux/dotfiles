require("nvim-tree").setup {
  hijack_netrw = true,
  view = {
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  sync_root_with_cwd = true,
}

require('nvim-tree.view').View.winopts.signcolumn = 'no'
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', { noremap = true, desc = 'NvimTree Toggle' })
vim.g.nvim_tree_respect_buf_cwd = 1

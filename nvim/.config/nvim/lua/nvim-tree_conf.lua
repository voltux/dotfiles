require("nvim-tree").setup {
  hijack_netrw = true,
  view = {
    adaptive_size = true,
    signcolumn = 'no',
  },
  renderer = {
    indent_markers = {
      enable = true,
    }
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  sync_root_with_cwd = true,
}

vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', { noremap = true, desc = 'NvimTree Toggle' })

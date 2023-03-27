require('lualine').setup {
  options = {
    theme = 'gruvbox',
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  extensions = {
    'fugitive',
    'quickfix',
    'nvim-tree',
    'nvim-dap-ui',
    'toggleterm'
  }
}

require('lualine').setup {
  options = {
    theme = 'codedark',
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

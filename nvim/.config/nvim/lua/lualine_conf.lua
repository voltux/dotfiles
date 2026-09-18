local theme = require('theme')

require('lualine').setup {
  options = {
    -- a function, not a table: lualine re-evaluates it on ColorScheme and on
    -- OptionSet background, so the bar follows the dark/light switch
    theme = function() return theme.lualine_theme() end,
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

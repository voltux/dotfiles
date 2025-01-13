local colors = {
  red      = '#fb4934',
  aqua     = '#8ec07c',
  purple   = '#d3869b',
  green    = '#b8bb26',
  blue     = '#83a598',
  orange   = '#fe8019',
  gray     = '#a89984',
  darkgray = '#282828',
  yellow   = "#d79921",
}
local gruvbox = {
  normal = {
    a = { bg = colors.yellow, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.yellow },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
  insert = {
    a = { bg = colors.green, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.green },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
  visual = {
    a = { bg = colors.purple, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.purple },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
  replace = {
    a = { bg = colors.red, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.red },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
  command = {
    a = { bg = colors.blue, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.blue },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
  terminal = {
    a = { bg = colors.green, fg = colors.darkgray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.green },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.gray },
    c = { bg = colors.darkgray, fg = colors.gray }
  },
}

require('lualine').setup {
  options = {
    theme = gruvbox,
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

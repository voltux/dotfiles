local colors = require("gruvbox.palette").get_base_colors(vim.o.background, "hard")
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {
    dark0 = "#1d2021"
  },
  overrides = {
    SignColumn = { bg = 'NONE' },
    LineNr = { bg = 'NONE' },
    Error = { bg = 'NONE' },
    ErrorMsg = { bg = 'NONE', fg = '#fb4934' },
    NormalFloat = { fg = colors.fg1, bg = colors.bg0 },
  },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

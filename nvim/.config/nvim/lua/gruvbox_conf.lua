local color_palette = require("gruvbox").palette
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,    -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {
    dark0 = "#1d2021"
  },
  overrides = {
    SignColumn = { bg = 'NONE' },
    LineNr = { bg = 'NONE' },
    Error = { bg = 'NONE' },
    ErrorMsg = { bg = 'NONE', fg = '#fb4934' },
    NormalFloat = { fg = color_palette.fg1, bg = color_palette.bg0 },
    -- nvim-ts-rainbow2 colors
    TSRainbowRed = { fg = color_palette.neutral_red },
    TSRainbowYellow = { fg = color_palette.yellow },
    TSRainbowBlue = { fg = color_palette.blue },
    TSRainbowOrange = { fg = color_palette.orange },
    TSRainbowGreen = { fg = color_palette.green },
    TSRainbowViolet = { fg = color_palette.purple },
    TSRainbowCyan = { fg = color_palette.aqua },

    -- oil
    OilDir = { fg = color_palette.blue }
  },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

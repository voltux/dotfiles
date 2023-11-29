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
  invert_intend_guides = true,
  inverse = true,    -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {
    dark0 = "#1d2021"
  },
  overrides = {
    SignColumn = { bg = 'NONE' },
    LineNr = { bg = 'NONE' },
    Error = { bg = 'NONE' },
    ErrorMsg = { bg = 'NONE', fg = color_palette.neutral_red },
    NormalFloat = { bg = color_palette.dark0 },
    FloatBorder = { fg = color_palette.faded_yellow },
    -- nvim-ts-rainbow2 colors
    TSRainbowRed = { fg = color_palette.faded_red },
    TSRainbowYellow = { fg = color_palette.faded_yellow },
    TSRainbowBlue = { fg = color_palette.faded_blue },
    TSRainbowOrange = { fg = color_palette.faded_orange },
    TSRainbowGreen = { fg = color_palette.faded_green },
    TSRainbowViolet = { fg = color_palette.faded_purple },
    TSRainbowCyan = { fg = color_palette.faded_aqua },
    -- telescope
    TelescopePromptBorder = { fg = color_palette.faded_blue },
    TelescopePromptTitle = { bg = color_palette.faded_blue, fg = color_palette.dark0 },
    TelescopeResultsBorder = { fg = color_palette.faded_yellow },
    TelescopeResultsTitle = { bg = color_palette.faded_yellow, fg = color_palette.dark0 },
    TelescopePreviewBorder = { fg = color_palette.faded_aqua },
    TelescopePreviewTitle = { bg = color_palette.faded_aqua, fg = color_palette.dark0 },
    -- oil
    OilDir = { fg = color_palette.blue },
    IncSearch = { bg = 'NONE', fg = color_palette.neutral_yellow },
    Search = { bg = 'NONE', fg = color_palette.faded_aqua },
  },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

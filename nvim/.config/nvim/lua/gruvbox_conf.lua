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
    FloatBorder = { fg = color_palette.neutral_yellow },
    -- nvim-ts-rainbow2 colors
    TSRainbowRed = { fg = color_palette.bright_red },
    TSRainbowYellow = { fg = color_palette.bright_yellow },
    TSRainbowBlue = { fg = color_palette.bright_blue },
    TSRainbowOrange = { fg = color_palette.bright_orange },
    TSRainbowGreen = { fg = color_palette.bright_green },
    TSRainbowViolet = { fg = color_palette.bright_purple },
    TSRainbowCyan = { fg = color_palette.bright_aqua },
    -- telescope
    TelescopePromptBorder = { fg = color_palette.neutral_green },
    TelescopePromptTitle = { fg = color_palette.neutral_green },
    TelescopeResultsBorder = { fg = color_palette.neutral_yellow },
    TelescopeResultsTitle = { fg = color_palette.neutral_yellow },
    TelescopePreviewBorder = { fg = color_palette.neutral_blue },
    TelescopePreviewTitle = { fg = color_palette.neutral_blue },
    TelescopePromptPrefix = { fg = color_palette.neutral_green },
    TelescopeResultsOperator = { fg = color_palette.neutral_yellow },
    -- oil
    OilDir = { fg = color_palette.blue },
    IncSearch = { bg = 'NONE', fg = color_palette.neutral_yellow },
    Search = { bg = 'NONE', fg = color_palette.neutral_aqua },
    -- markdown
    ["@markup.heading.1.markdown"] = { bg = "NONE", fg = color_palette.neutral_green, bold = true },
    ["@markup.heading.2.markdown"] = { bg = "NONE", fg = color_palette.neutral_yellow, bold = true },
    ["@markup.heading.3.markdown"] = { bg = "NONE", fg = color_palette.neutral_aqua, bold = true },
    ["@markup.heading.4.markdown"] = { bg = "NONE", fg = color_palette.neutral_purple, bold = true },
    ["@markup.heading.5.markdown"] = { bg = "NONE", fg = color_palette.neutral_blue, bold = true },
    ["@markup.heading.6.markdown"] = { bg = "NONE", fg = color_palette.neutral_orange, bold = true },
    -- neorg
    ["@neorg.headings.1.title"] = { bg = "NONE", fg = color_palette.neutral_green, bold = true },
    ["@neorg.headings.2.title"] = { bg = "NONE", fg = color_palette.neutral_yellow, bold = true },
    ["@neorg.headings.3.title"] = { bg = "NONE", fg = color_palette.neutral_aqua, bold = true },
    ["@neorg.headings.4.title"] = { bg = "NONE", fg = color_palette.neutral_purple, bold = true },
    ["@neorg.headings.5.title"] = { bg = "NONE", fg = color_palette.neutral_blue, bold = true },
    ["@neorg.headings.6.title"] = { bg = "NONE", fg = color_palette.neutral_orange, bold = true },
    ["@neorg.headings.1.prefix"] = { bg = "NONE", fg = color_palette.neutral_green, bold = true },
    ["@neorg.headings.2.prefix"] = { bg = "NONE", fg = color_palette.neutral_yellow, bold = true },
    ["@neorg.headings.3.prefix"] = { bg = "NONE", fg = color_palette.neutral_aqua, bold = true },
    ["@neorg.headings.4.prefix"] = { bg = "NONE", fg = color_palette.neutral_purple, bold = true },
    ["@neorg.headings.5.prefix"] = { bg = "NONE", fg = color_palette.neutral_blue, bold = true },
    ["@neorg.headings.6.prefix"] = { bg = "NONE", fg = color_palette.neutral_orange, bold = true },
    -- which-key
    WhichKeyGroup = { bg = "NONE", fg = color_palette.bright_blue, bold = true },
    WhichKeyDesc = { bg = "NONE", fg = color_palette.bright_orange, bold = false },
    -- bufferline
    BufferLineGroupLabel = { link = "BufferLineBackground" },
    BufferLineBufferSelected = { fg = color_palette.bright_yellow, italic = false, bold = true},
    BufferLineDuplicate = { link = "BufferLineBackground" },
    BufferLineDuplicateVisible = { link = "BufferLineBackground" },
    BufferLineDuplicateSelected = { link = "BufferLineBufferSelected" },
  },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

-- Color palette

-- dark0_hard = "#1d2021",
-- dark0 = "#282828",
-- dark0_soft = "#32302f",
-- dark1 = "#3c3836",
-- dark2 = "#504945",
-- dark3 = "#665c54",
-- dark4 = "#7c6f64",
-- light0_hard = "#f9f5d7",
-- light0 = "#fbf1c7",
-- light0_soft = "#f2e5bc",
-- light1 = "#ebdbb2",
-- light2 = "#d5c4a1",
-- light3 = "#bdae93",
-- light4 = "#a89984",
-- bright_red = "#fb4934",
-- bright_green = "#b8bb26",
-- bright_yellow = "#fabd2f",
-- bright_blue = "#83a598",
-- bright_purple = "#d3869b",
-- bright_aqua = "#8ec07c",
-- bright_orange = "#fe8019",
-- neutral_red = "#cc241d",
-- neutral_green = "#98971a",
-- neutral_yellow = "#d79921",
-- neutral_blue = "#458588",
-- neutral_purple = "#b16286",
-- neutral_aqua = "#689d6a",
-- neutral_orange = "#d65d0e",
-- faded_red = "#9d0006",
-- faded_green = "#79740e",
-- faded_yellow = "#b57614",
-- faded_blue = "#076678",
-- faded_purple = "#8f3f71",
-- faded_aqua = "#427b58",
-- faded_orange = "#af3a03",
-- dark_red_hard = "#792329",
-- dark_red = "#722529",
-- dark_red_soft = "#7b2c2f",
-- light_red_hard = "#fc9690",
-- light_red = "#fc9487",
-- light_red_soft = "#f78b7f",
-- dark_green_hard = "#5a633a",
-- dark_green = "#62693e",
-- dark_green_soft = "#686d43",
-- light_green_hard = "#d3d6a5",
-- light_green = "#d5d39b",
-- light_green_soft = "#cecb94",
-- dark_aqua_hard = "#3e4934",
-- dark_aqua = "#49503b",
-- dark_aqua_soft = "#525742",
-- light_aqua_hard = "#e6e9c1",
-- light_aqua = "#e8e5b5",
-- light_aqua_soft = "#e1dbac",
-- gray = "#928374",

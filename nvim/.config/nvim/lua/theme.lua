-- Single source of truth for every gruvbox colour used in this config.
--
-- Nothing else hardcodes a hex: gruvbox_conf.lua and lualine_conf.lua both ask
-- this module, so flipping 'background' repaints the editor and the statusline
-- consistently.
--
-- Which background is used is decided in this order:
--   1. whatever the terminal reports -- neovim queries it with OSC 11 on
--      startup, which is why vim_conf.lua no longer sets 'background' itself
--      (setting it would mark it user-set and disable the detection).
--   2. an explicit :ThemeDark / :ThemeLight / :ThemeToggle, for the session.
--      :ThemeAuto goes back to what the terminal asked for.

local M = {}

-- Our single palette tweak. gruvbox's own dark0 is "#282828"; with
-- contrast = "hard" the editor background is dark0_hard, which is already this
-- value, so this mostly pins floats and light-mode text to the same black.
M.palette_overrides = { dark0 = "#1d2021" }

M.contrast = "hard"

local function palette()
  return vim.tbl_extend("force", require("gruvbox").palette, M.palette_overrides)
end

--------------------------------------------------------------------------- --
-- Editor colours
--------------------------------------------------------------------------- --

--- Resolve the editor palette for a background.
---
--- The `dark` column is exactly the set of hexes this config used before it
--- became switchable. The `light` column is each one's gruvbox counterpart:
--- bright_* -> faded_*, dark_* -> light_*, while neutral_* is shared by both
--- backgrounds (upstream gruvbox does the very same swap).
---@param bg string|nil "dark" or "light"; defaults to the current background
function M.colors(bg)
  bg = bg or vim.o.background
  local p = palette()

  -- mid-tone accents: readable on either background, so they never change
  local shared = {
    neutral_red    = p.neutral_red,
    neutral_green  = p.neutral_green,
    neutral_yellow = p.neutral_yellow,
    neutral_blue   = p.neutral_blue,
    neutral_purple = p.neutral_purple,
    neutral_aqua   = p.neutral_aqua,
    neutral_orange = p.neutral_orange,
    gray           = p.gray,
    diff_text      = p.neutral_blue,
  }

  local variant = {
    dark = {
      bg0         = p.dark0_hard,      -- editor / selected-buffer background
      bg_float    = "#282828",         -- floats, one step off bg0 (gruvbox's
                                       -- stock dark0, which palette_overrides
                                       -- replaces, so it cannot be read from p)
      fg_dim      = p.dark4,           -- barely-there foreground (Search, Pmenu thumb)
      red         = p.bright_red,
      green       = p.bright_green,
      yellow      = p.bright_yellow,
      blue        = p.bright_blue,
      purple      = p.bright_purple,
      aqua        = p.bright_aqua,
      orange      = p.bright_orange,
      diff_add    = p.dark_aqua_hard,
      diff_delete = p.dark_red_hard,
    },
    light = {
      bg0         = p.light0_hard,
      bg_float    = p.light0,          -- likewise one step off bg0
      fg_dim      = p.light4,
      red         = p.faded_red,
      green       = p.faded_green,
      yellow      = p.faded_yellow,
      blue        = p.faded_blue,
      purple      = p.faded_purple,
      aqua        = p.faded_aqua,
      orange      = p.faded_orange,
      diff_add    = p.light_aqua_hard,
      diff_delete = p.light_red_hard,
    },
  }

  return vim.tbl_extend("error", shared, variant[bg] or variant.dark)
end

--------------------------------------------------------------------------- --
-- Statusline colours
--------------------------------------------------------------------------- --

-- Dark keeps the bright_* accents it always had, light uses their faded_*
-- counterparts -- the same swap M.colors() makes for the editor. In both, the
-- text on the coloured mode block is the bar's own background colour.
local statusline = {
  dark = {
    red = "#fb4934", green = "#b8bb26", yellow = "#d79921", blue = "#83a598",
    purple = "#d3869b", aqua = "#8ec07c", orange = "#fe8019",
    bar       = "#282828", -- background of sections b and c
    muted     = "#a89984", -- text of section c
    on_accent = "#282828", -- text on the coloured mode block (section a)
  },
  light = {
    red = "#9d0006", green = "#79740e", yellow = "#b57614", blue = "#076678",
    purple = "#8f3f71", aqua = "#427b58", orange = "#af3a03",
    bar       = "#fbf1c7",
    muted     = "#7c6f64",
    on_accent = "#fbf1c7",
  },
}

--- Build the lualine theme table for a background.
--- Pass this as a *function* to lualine's `options.theme` so that lualine
--- rebuilds it on its own ColorScheme / OptionSet background autocommands.
---@param bg string|nil "dark" or "light"; defaults to the current background
function M.lualine_theme(bg)
  local c = statusline[bg or vim.o.background] or statusline.dark

  local function mode(accent)
    return {
      a = { bg = accent, fg = c.on_accent, gui = 'bold' },
      b = { bg = c.bar, fg = accent },
      c = { bg = c.bar, fg = c.muted },
    }
  end

  return {
    normal   = mode(c.yellow),
    insert   = mode(c.green),
    visual   = mode(c.purple),
    replace  = mode(c.red),
    command  = mode(c.blue),
    terminal = mode(c.green),
    inactive = {
      a = { bg = c.bar, fg = c.muted, gui = 'bold' },
      b = { bg = c.bar, fg = c.muted },
      c = { bg = c.bar, fg = c.muted },
    },
  }
end

--------------------------------------------------------------------------- --
-- gruvbox options
--------------------------------------------------------------------------- --

--- The full gruvbox setup table for a background. Every highlight override is
--- expressed through M.colors(), so the same list serves dark and light.
---@param bg string|nil "dark" or "light"; defaults to the current background
function M.gruvbox_opts(bg)
  local c = M.colors(bg)

  return {
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
    inverse = true,          -- invert background for search, diffs, statuslines and errors
    contrast = M.contrast,   -- can be "hard", "soft" or empty string
    palette_overrides = M.palette_overrides,
    overrides = {
      WinSeparator = { link = "GruvboxYellowBold" },
      SignColumn = { bg = 'NONE' },
      LineNr = { bg = 'NONE' },
      Error = { bg = 'NONE' },
      ErrorMsg = { bg = 'NONE', fg = c.neutral_red },
      NormalFloat = { bg = c.bg_float },
      FloatBorder = { fg = c.neutral_yellow },
      DiffText = { bg = c.diff_text },
      DiffAdd = { bg = c.diff_add },
      DiffDelete = { bg = c.diff_delete },
      -- nvim-ts-rainbow2 colors
      TSRainbowRed = { fg = c.red },
      TSRainbowYellow = { fg = c.yellow },
      TSRainbowBlue = { fg = c.blue },
      TSRainbowOrange = { fg = c.orange },
      TSRainbowGreen = { fg = c.green },
      TSRainbowViolet = { fg = c.purple },
      TSRainbowCyan = { fg = c.aqua },
      -- telescope
      TelescopePromptBorder = { fg = c.neutral_green },
      TelescopePromptTitle = { fg = c.neutral_green },
      TelescopeResultsBorder = { fg = c.neutral_yellow },
      TelescopeResultsTitle = { fg = c.neutral_yellow },
      TelescopePreviewBorder = { fg = c.neutral_blue },
      TelescopePreviewTitle = { fg = c.neutral_blue },
      TelescopePromptPrefix = { fg = c.neutral_green },
      TelescopeResultsOperator = { fg = c.neutral_yellow },
      TelescopeSelection = { fg = c.bg_float, bg = c.blue, bold = true },
      TelescopeMatching = { link = "GruvboxOrangeBold" },
      -- oil
      OilDir = { link = "GruvboxBlueBold" }, -- was color_palette.blue, which is not a gruvbox palette key
      IncSearch = { bg = 'NONE', fg = c.neutral_yellow },
      Search = { bg = 'NONE', fg = c.fg_dim },
      -- neotree
      NeoTreeDirectoryIcon = { link = "GruvboxBlue" },
      NeoTreeDirectoryName = { link = "GruvboxBlueBold" },
      -- blink
      BlinkCmpMenu = { link = "NormalFloat" },
      BlinkCmpMenuBorder = { link = "FloatBorder" },
      BlinkCmpLabelMatch = { link = "GruvboxOrangeBold" },
      PmenuThumb = { bg = c.fg_dim }, -- was color_palette.neutral_grey, which is not a gruvbox palette key
      PmenuSel = { link = "TelescopeSelection" },
      PmenuMatch = { link = "TelescopeMatching" },
      -- markdown
      ["@markup.heading.1.markdown"] = { bg = "NONE", fg = c.neutral_green, bold = true },
      ["@markup.heading.2.markdown"] = { bg = "NONE", fg = c.neutral_yellow, bold = true },
      ["@markup.heading.3.markdown"] = { bg = "NONE", fg = c.neutral_aqua, bold = true },
      ["@markup.heading.4.markdown"] = { bg = "NONE", fg = c.neutral_purple, bold = true },
      ["@markup.heading.5.markdown"] = { bg = "NONE", fg = c.neutral_blue, bold = true },
      ["@markup.heading.6.markdown"] = { bg = "NONE", fg = c.neutral_orange, bold = true },
      -- which-key
      WhichKeyGroup = { bg = "NONE", fg = c.blue, bold = true },
      WhichKeyDesc = { bg = "NONE", fg = c.green, bold = false },
      WhichKey = { bg = "NONE", fg = c.orange, bold = true },
      -- bufferline
      BufferLineGroupLabel = { link = "BufferLineBackground" },
      BufferLineBufferSelected = { fg = c.neutral_yellow, bg = c.bg0, bold = true },
      BufferLineDuplicate = { link = "BufferLineBackground" },
      BufferLineDuplicateVisible = { link = "BufferLineBackground" },
      BufferLineDuplicateSelected = { link = "BufferLineBufferSelected" },
      -- NvimTree
      Directory = { link = "GruvboxBlueBold" },
    },
    dim_inactive = false,
    transparent_mode = false,
  }
end

--------------------------------------------------------------------------- --
-- Switching
--------------------------------------------------------------------------- --

-- What the terminal asked for, so that :ThemeAuto can go back to it.
M.terminal_background = vim.o.background

-- Background gruvbox was last built for. Repainting runs `hi clear`, which also
-- drops highlight groups owned by plugins, so we never repaint unless the
-- background really changed.
M.painted = nil

-- Most plugins listen to ColorScheme and repaint themselves. These three do not
-- do it completely, so each gets an explicit nudge after a switch.
local function repaint_plugins()
  -- bufferline's ColorScheme handler only restores the groups currently on
  -- screen, so re-run its whole config
  if package.loaded['bufferline_conf'] then
    package.loaded['bufferline_conf'] = nil
    pcall(require, 'bufferline_conf')
  end
  -- indent-blankline builds @ibl.* once, at setup
  if package.loaded['indent-blankline_conf'] then
    package.loaded['indent-blankline_conf'] = nil
    pcall(require, 'indent-blankline_conf')
  end
  -- nvim-web-devicons registers its ColorScheme autocmd inside setup(), which
  -- races with lazy loading, so its 600+ icon colours are sometimes not
  -- restored. refresh() rebuilds them unconditionally.
  if package.loaded['nvim-web-devicons'] then
    pcall(function() require('nvim-web-devicons').refresh() end)
  end
end

--- Rebuild and re-apply gruvbox for the current 'background'.
--- lualine repaints itself: it holds a function as its theme.
function M.apply()
  if M.painted == vim.o.background then
    return
  end
  local switching = M.painted ~= nil
  M.painted = vim.o.background

  require("gruvbox").setup(M.gruvbox_opts())
  vim.cmd.colorscheme("gruvbox")

  if switching then
    repaint_plugins()
  end
end

function M.set(bg)
  if vim.o.background == bg then
    M.apply() -- already there: just repaint
  else
    vim.o.background = bg -- fires OptionSet, which calls M.apply()
  end
end

function M.toggle()
  M.set(vim.o.background == "dark" and "light" or "dark")
end

function M.setup()
  local group = vim.api.nvim_create_augroup("ThemeBackground", { clear = true })

  vim.api.nvim_create_autocmd("OptionSet", {
    group = group,
    pattern = "background",
    callback = function() M.apply() end,
    desc = "Repaint gruvbox when the background flips",
  })

  -- neovim's OSC 11 answer can land after the plugins have been configured
  vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    once = true,
    callback = function()
      M.terminal_background = vim.o.background
      M.apply()
    end,
    desc = "Adopt the background the terminal reported",
  })

  vim.api.nvim_create_user_command("ThemeDark", function() M.set("dark") end,
    { desc = "Switch to the dark theme" })
  vim.api.nvim_create_user_command("ThemeLight", function() M.set("light") end,
    { desc = "Switch to the light theme" })
  vim.api.nvim_create_user_command("ThemeToggle", function() M.toggle() end,
    { desc = "Toggle between the dark and light theme" })
  vim.api.nvim_create_user_command("ThemeAuto", function() M.set(M.terminal_background) end,
    { desc = "Follow the terminal theme again" })

  vim.keymap.set('n', '<leader>Tt', M.toggle, { noremap = true, desc = 'Toggle dark/light theme' })
  vim.keymap.set('n', '<leader>Td', function() M.set("dark") end, { noremap = true, desc = 'Dark theme' })
  vim.keymap.set('n', '<leader>Tl', function() M.set("light") end, { noremap = true, desc = 'Light theme' })
  vim.keymap.set('n', '<leader>Ta', function() M.set(M.terminal_background) end,
    { noremap = true, desc = 'Follow terminal theme' })
end

return M

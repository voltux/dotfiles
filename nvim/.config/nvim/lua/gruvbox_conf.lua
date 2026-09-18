-- The colours themselves live in theme.lua so that the statusline can share
-- them and so that the whole set can be resolved for either background.
local theme = require('theme')

vim.o.laststatus = 3 -- show only one statusline

-- Registers :ThemeDark / :ThemeLight / :ThemeToggle / :ThemeAuto, their
-- <leader>T mappings, and the autocommands that repaint when 'background'
-- changes -- including the change neovim makes after asking the terminal.
theme.setup()

-- Configures gruvbox and runs `colorscheme gruvbox`. Kept here instead of in
-- vim_conf.lua because the plugin needs to be configured before the call.
theme.apply()

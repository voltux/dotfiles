require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    overrides = {
        SignColumn = { bg = 'NONE' },
        LineNr = { bg = 'NONE' },
        Error = { bg = 'NONE' },
        ErrorMsg = { bg = 'NONE', fg = '#fb4934' },
    },
})
vim.cmd [[ colorscheme gruvbox ]] --keeping it here instead of vim_conf.lua because the plugin needs to be configured before the call

if vim.fn.exists('g:neovide') > 0 then
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
    vim.g.neovide_hide_mouse_when_typing = true
    vim.o.background = 'dark'
    vim.o.guifont = "JetBrainsMono_Nerd_Font_Mono:h9" -- text below applies for VimScript
    vim.cmd("colorscheme gruvbox")
end

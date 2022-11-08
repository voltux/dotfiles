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
    })
    vim.o.background = 'dark'
    vim.cmd("colorscheme gruvbox")
    vim.o.guifont = "Monaco_for_Powerline:h9"
end

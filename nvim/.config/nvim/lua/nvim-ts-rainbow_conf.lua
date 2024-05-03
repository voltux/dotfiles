require("nvim-treesitter.configs").setup {
    rainbow = {
        hlgroups = {
            'TSRainbowYellow',
            'TSRainbowCyan',
            'TSRainbowOrange',
            'TSRainbowViolet',
            'TSRainbowRed',
            'TSRainbowBlue',
            'TSRainbowGreen',
        },
    }
}
vim.g.rainbow_active = 1

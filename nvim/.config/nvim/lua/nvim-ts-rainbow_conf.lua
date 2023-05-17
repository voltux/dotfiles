require("nvim-treesitter.configs").setup {
    rainbow = {
        hlgroups = {
            'TSRainbowBlue',
            'TSRainbowOrange',
            'TSRainbowCyan',
            'TSRainbowYellow',
            'TSRainbowViolet',
            'TSRainbowGreen',
            'TSRainbowRed',
        },
    }
}
vim.g.rainbow_active = 1

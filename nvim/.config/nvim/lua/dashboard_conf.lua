local db = require('dashboard')
db.custom_header = {
    '',
    '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
}
db.custom_center = {
    { icon = '   ',
        desc = 'New file                                ',
        action = 'DashboardNewFile',
        shortcut = 'SPC d n ' },
    { icon = '   ',
        desc = 'Recently opened files                   ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC f % ' },
    { icon = '  ',
        desc = 'Find File                               ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC f f' },
    { icon = '   ',
        desc = 'Find in Git Files                       ',
        shortcut = 'SPC f g',
        action = 'Telescope git_files' },
    { icon = '  ',
        desc = 'File Browser                            ',
        action = 'Telescope file_browser',
        shortcut = 'SPC f F' },
    { icon = '  ',
        desc = 'Find word                               ',
        action = 'Telescope live_grep',
        shortcut = 'SPC f w' },
}
vim.api.nvim_set_keymap("n", "<leader>dn", "<cmd>DashboardNewFile<cr>", { silent = true, noremap = true, desc = 'Dashboard new file' })
vim.api.nvim_set_keymap("n", "<leader>dl", "<cmd>SessionLoad<cr>", { silent = true, noremap = true, desc = 'Dashboard load session' })
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>SessionSave<cr>", { silent = true, noremap = true, desc = 'Dashboard save session' })

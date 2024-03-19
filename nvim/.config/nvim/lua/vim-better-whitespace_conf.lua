vim.g.better_whitespace_filetypes_blacklist = {'dashboard'}
vim.cmd [[ highlight ExtraWhitespace ctermbg=78 ]]
vim.keymap.set('n', '<leader>pw', '<cmd>StripWhitespace<CR>', { noremap = true, desc = 'Strip whitespace' })
vim.keymap.set('n', '<leader>pW', '<cmd>ToggleWhitespace<CR>', { noremap = true, desc = 'Toggle whitespace' })
vim.g.better_whitespace_enabled = 0
vim.g.strip_whitespace_on_save = 0

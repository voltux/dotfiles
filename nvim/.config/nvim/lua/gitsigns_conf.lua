require('gitsigns').setup()
vim.api.nvim_set_keymap('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { noremap = true, desc = 'Gitsigns go to next hunk' })
vim.api.nvim_set_keymap('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { noremap = true, desc = 'Gitsigns go to previous hunk' })

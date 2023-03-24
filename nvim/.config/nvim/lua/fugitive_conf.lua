vim.keymap.set('n', '<leader>gs', '<cmd>G<cr>', { noremap = true, desc = 'git status' })
vim.keymap.set('n', '<leader>gp', '<cmd>G pull<cr>', { noremap = true, desc = 'git pull' })
vim.keymap.set('n', '<leader>gP', '<cmd>G push<cr>', { noremap = true, desc = 'git push' })
vim.keymap.set('n', '<leader>gf', '<cmd>G push --force-with-lease<cr>',
    { noremap = true, desc = 'git push --force-with-lease' })
vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>', { noremap = true, desc = 'git blame' })
vim.keymap.set('n', '<leader>gl', '<cmd>0GcLog<cr>', { noremap = true, desc = 'git log' })

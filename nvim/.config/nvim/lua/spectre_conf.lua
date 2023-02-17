vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua require("spectre").open()<CR>',
  { noremap = true, desc = 'Spectre open search and replace' })
vim.api.nvim_set_keymap('n', '<leader>rw', 'require("spectre").open_visual({select_word=true})<CR>',
  { noremap = true, desc = 'Spectre open visual search and replace word' })
vim.api.nvim_set_keymap('v', '<leader>rr', '<cmd>lua require("spectre").open_visual()<CR>',
  { noremap = true, desc = 'Spectre open visual search and replace' })
vim.api.nvim_set_keymap('n', '<leader>rf', '<cmd>lua require("spectre").open_file_search()<cr>',
  { noremap = true, desc = 'Spectre open search and replace in file' })

require 'colorizer'.setup { filetypes = { '*', } }
vim.keymap.set('n', '<leader>pc', '<cmd>ColorizerToggle<CR>', { noremap = true, desc = 'Colorizer Toggle' })

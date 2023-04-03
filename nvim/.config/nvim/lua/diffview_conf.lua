vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { noremap = true, desc = 'Open diffView' })

require("diffview").setup()

require("dapui").setup()
vim.keymap.set('n', '<F8>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })

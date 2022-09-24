require("dapui").setup()
vim.api.nvim_set_keymap('n', '<F8>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })

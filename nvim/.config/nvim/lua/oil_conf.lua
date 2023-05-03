vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "Oil open current directory" })
require('oil').setup()

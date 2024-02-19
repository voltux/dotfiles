vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "Oil open current directory" })
require('oil').setup({
    default_file_explorer = false,
})

vim.keymap.set("n", "<leader>fO", require("oil").open, { desc = "Oil open current directory" })
require('oil').setup({
    default_file_explorer = false,
})

vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { noremap = true, desc = 'Telescope find TODO' })
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

require('todo-comments').setup()

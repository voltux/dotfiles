vim.cmd[[ autocmd BufNewFile,BufRead *.org let g:table_mode_corner="+" ]]
vim.cmd[[ autocmd BufNewFile,BufRead *.(md|neorg) let g:table_mode_corner="|" ]]
vim.keymap.set("n", "<leader>tt", "<cmd>TableModeToggle<CR>", { desc = "Table mode toggle" })

vim.keymap.set('n', '<F4>', '<Cmd>lua require"dap".close()<CR>', { noremap = true, desc = "Dap debugger close" })
vim.keymap.set('n', '<F5>', '<Cmd>lua require"dap".toggle_breakpoint()<CR>',
    { noremap = true, desc = "Dap debugger toggle breakpoint" })
vim.keymap.set('n', '<F9>', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, desc = "Dap debugger continue" })
vim.keymap.set('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, desc = "Dap debugger step over" })
vim.keymap.set('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, desc = "Dap debugger step into" })
vim.keymap.set('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, desc = "Dap debugger step out" })

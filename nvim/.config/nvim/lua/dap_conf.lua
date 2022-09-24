vim.api.nvim_set_keymap('n', '<F9>', '<Cmd>lua require"dap".continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>',
    '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true })

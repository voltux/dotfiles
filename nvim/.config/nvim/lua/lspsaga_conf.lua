require("lspsaga").setup({
    ui = {
        code_action = '', -- don't show lightbulbs
    }
})

-- keymaps
vim.keymap.set("n", "<leader>cc", "<cmd>Lspsaga finder<CR>",
    { noremap = true, silent = true, desc = "Lspsaga definition and usage finder" })
vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>',
    { noremap = true, silent = true, desc = "Lspsaga diagnostic go to next" })
vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>',
    { noremap = true, silent = true, desc = "Lspsaga diagnostic go to previous" })
vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { noremap = true, silent = true, desc = "Lspsaga diagnostic go to previoue ERROR" })
vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { noremap = true, silent = true, desc = "Lspsaga diagnostic go to next ERROR" })
vim.keymap.set('n', '<leader>ce', '<cmd>Lspsaga show_line_diagnostics<CR>',
    { noremap = true, silent = true, desc = "Lspsaga diagnostic show message" })
vim.keymap.set('n', '<leader>ch', '<cmd>Lspsaga hover_doc<CR>',
    { noremap = true, silent = true, desc = "Lspsaga show hovering doc help" })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>',
    { noremap = true, silent = true, desc = "Lspsaga show hovering doc help" })
-- vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga goto_definition<CR>',
--     { noremap = true, silent = true, desc = "Lspsaga go to definition" })
vim.keymap.set('n', '<leader>cD', '<cmd>Lspsaga peek_definition<CR>',
    { noremap = true, silent = true, desc = "Lspsaga peek definition" })
-- vim.keymap.set('n', '<leader>ct', '<cmd>Lspsaga goto_type_definition<CR>',
--     { noremap = true, silent = true, desc = "Lspsaga goto type definition" })
vim.keymap.set('n', '<leader>cT', '<cmd>Lspsaga peek_type_definition<CR>',
    { noremap = true, silent = true, desc = "Lspsaga peek type definition" })
vim.keymap.set('n', '<leader>ci', '<cmd>Lspsaga incoming_calls<CR>',
    { noremap = true, silent = true, desc = "Lspsaga incoming calls" })
vim.keymap.set('n', '<leader>co', '<cmd>Lspsaga outgoing_calls<CR>',
    { noremap = true, silent = true, desc = "Lspsaga outgoing calls" })
vim.keymap.set("n", "<leader>cm", "<cmd>Lspsaga outline<CR>",
    { noremap = true, silent = true, desc = "Lspsaga outline minimap" })
vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help,
    { noremap = true, silent = true, desc = "LSP signature help" })
vim.keymap.set('n', '<leader>cR', "<cmd>Lspsaga rename ++project<CR>",
    { noremap = true, silent = true, desc = "Lspsaga rename" })
vim.keymap.set('n', '<leader>cE', "<cmd>Lspsaga show_buf_diagnostics<CR>",
    { noremap = true, silent = true, desc = "LSP show errors" })
vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>",
    { noremap = true, silent = true, desc = "LSP code action" })

require('nvim-lsp-installer').setup{}
local lsp = require('lspconfig')

local custom_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', ']c', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '[c', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>co', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>cu', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('x', '<leader>ca', vim.lsp.buf.range_code_action, bufopts)
end

lsp.pylsp.setup{
    on_attach = custom_attach
}
lsp.sumneko_lua.setup{
    on_attach = custom_attach
}
lsp.vimls.setup{
    on_attach = custom_attach
}

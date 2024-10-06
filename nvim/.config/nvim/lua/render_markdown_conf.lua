require("render-markdown").setup {
    filetypes = { 'markdown', }
}
vim.keymap.set('n', '<leader>pr', '<cmd>RenderMarkdown toggle<CR>', { noremap = true, desc = 'Toggle render markdown' })

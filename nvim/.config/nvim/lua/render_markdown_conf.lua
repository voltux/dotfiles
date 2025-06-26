require("render-markdown").setup {
    filetypes = { 'markdown', 'codecompanion', 'Avante'}
}
vim.keymap.set('n', '<leader>pr', '<cmd>RenderMarkdown toggle<CR>', { noremap = true, desc = 'Toggle render markdown' })

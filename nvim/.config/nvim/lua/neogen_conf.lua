vim.api.nvim_set_keymap('n', '<leader>c"', '<cmd>Neogen<CR>',
  { noremap = true, desc = 'Neogen create documentation' })
require('neogen').setup({
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    python = {
      template = {
        annotation_convention = "reST"
      }
    },
  }
})

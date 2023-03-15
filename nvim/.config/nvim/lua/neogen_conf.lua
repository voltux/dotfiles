require('neogen').setup {
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    lua = {
      template = {
        annotation_convention = "reST"
      }
    },
  }
}

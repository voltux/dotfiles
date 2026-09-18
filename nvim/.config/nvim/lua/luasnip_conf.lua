require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()

-- No jump mappings here on purpose. The ones that used to live in this file
-- carried their options inside the lhs string ('<silent><expr> <Tab>'), so they
-- only ever bound that literal text. Snippet jumping is already covered twice
-- over: blink.cmp binds snippet_forward/snippet_backward to <Tab>/<S-Tab>
-- (see blink_cmp_conf.lua), and neovim maps vim.snippet.jump by default.

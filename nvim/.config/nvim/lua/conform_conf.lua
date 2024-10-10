require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		yaml = { "yamlfmt" },
		perl = { "perltidy" },
		go = { "gofmt" },
		python = { "black" },
		bash = { "beautysh" },
		zsh = { "beautysh" },
		markdown = { "prettier" },
	},
})

vim.keymap.set(
	"n",
	"<leader>cF",
	'<cmd>lua require("conform").format()<CR>',
	{ noremap = true, desc = "Conform format file" }
)

require('nvim-lsp-installer').setup {}
local lsp = require('lspconfig')

-- configure keymaps on attach to a lsp server
local custom_attach = function(client, bufnr)

    -- setup diagnostics toggle on and off
	vim.g.diagnostics_visible = true
	function _G.toggle_diagnostics()
		if vim.g.diagnostics_visible then
			vim.g.diagnostics_visible = false
			vim.diagnostic.disable()
		else
			vim.g.diagnostics_visible = true
			vim.diagnostic.enable()
		end
	end
	vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ct', ':call v:lua.toggle_diagnostics()<CR>', {silent=true, noremap=true})

	-- setup global autocompletion
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- keymaps
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', ']w', vim.diagnostic.goto_next, bufopts)
	vim.keymap.set('n', '[w', vim.diagnostic.goto_prev, bufopts)
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

-- configure autocompletion based on lsp
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		{ name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- setup servers for each programming language
lsp.pylsp.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}
lsp.sumneko_lua.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}
lsp.vimls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}
lsp.perlnavigator.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

vim.cmd [[ hi LspInfoBorder cterm=NONE ]]

-- Diagnostics toggle. Defined once at load, not inside on_attach: it is global
-- state, and re-registering it on every server attach reset the flag whenever a
-- second server came up in the same buffer.
vim.g.diagnostics_visible = true
local function toggle_diagnostics()
    vim.g.diagnostics_visible = not vim.g.diagnostics_visible
    vim.diagnostic.enable(vim.g.diagnostics_visible)
    vim.notify("Diagnostics " .. (vim.g.diagnostics_visible and "enabled" or "disabled"))
end

vim.keymap.set('n', '<Leader>c<leader>', toggle_diagnostics,
    { noremap = true, silent = true, desc = "Diagnostics Toggle" })

-- Buffer-local setup, run whenever a server attaches.
local custom_attach = function(_, bufnr)
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

    local function map(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
    end

    map('<leader>cd', vim.lsp.buf.definition, "LSP definition")
    map('<leader>ct', vim.lsp.buf.type_definition, "LSP type definition")
    map('<leader>cu', vim.lsp.buf.references, "LSP references")
    map('<leader>cr', vim.lsp.buf.rename, "LSP rename")
    map('<leader>cf', function() vim.lsp.buf.format { async = true } end, "LSP format")
    map('<leader>cA', vim.lsp.buf.code_action, "LSP code action")
end

-- Shared by every server: neovim merges the '*' config into each named one, so
-- this replaces repeating on_attach/capabilities eighteen times.
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    on_attach = custom_attach,
})

-- Only servers that need something beyond the defaults appear here.
vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120
                }
            }
        }
    }
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config('perlnavigator', {
    cmd = { "perlnavigator", "--stdio" },
})

vim.lsp.config('clangd', {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            keyOrdering = false
        }
    },
})

-- neovim detects *.tf as 'tf', not 'terraform'; keep the other two so that
-- *.tfvars ('terraform-vars') is covered as well
vim.lsp.config('terraformls', {
    filetypes = { "tf", "terraform", "terraform-vars" },
})

vim.lsp.enable({
    'bashls',
    'clangd',
    'dockerls',
    'gopls',
    'hls',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'perlnavigator',
    'pylsp',
    'rust_analyzer',
    'sqlls',
    'terraformls',
    'vimls',
    'yamlls',
})

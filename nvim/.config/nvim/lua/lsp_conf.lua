vim.cmd [[ hi LspInfoBorder cterm=NONE ]]

-- configure setup on attach to a lsp server
local custom_attach = function(_, bufnr)
    -- setup diagnostics toggle on and off
    vim.g.diagnostics_visible = true
    function _G.toggle_diagnostics()
        if vim.g.diagnostics_visible then
            vim.g.diagnostics_visible = false
            vim.diagnostic.enable(false)
            print("Diagnostics disabled")
        else
            vim.g.diagnostics_visible = true
            vim.diagnostic.enable()
            print("Diagnostics enabled")
        end
    end

    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>c<leader>', ':call v:lua.toggle_diagnostics()<CR>', {
        silent = true,
        noremap = true,
        desc = "Diagnostics Toggle"
    })

    -- setup global autocompletion
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf = bufnr})

    -- keymaps
    -- vim.keymap.set('n', ']w', vim.diagnostic.goto_next,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "Diagnostic go to next" })
    -- vim.keymap.set('n', '[w', vim.diagnostic.goto_prev,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "Diagnostic go to previous" })
    -- vim.keymap.set('n', '<leader>cw', vim.diagnostic.open_float,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "Diagnostic show message" })
    -- vim.keymap.set('n', '<leader>ch', '<cmd>lua vim.lsp.buf.hover() vim.lsp.buf.hover()<cr>',
    --     { noremap = true, silent = true, buffer = bufnr, desc = "LSP show hovering help" })
    vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition,
        { noremap = true, silent = true, buffer = bufnr, desc = "LSP definition" })
    -- vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "LSP declaration" })
    -- vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "LSP implementation" })
    vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition,
        { noremap = true, silent = true, buffer = bufnr, desc = "LSP type definition" })
    vim.keymap.set('n', '<leader>cu', vim.lsp.buf.references,
        { noremap = true, silent = true, buffer = bufnr, desc = "LSP references" })
    -- vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "LSP signature help" })
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename,
        { noremap = true, silent = true, buffer = bufnr, desc = "LSP rename" })
    vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "LSP format" })
    -- vim.keymap.set('n', '<leader>ce', vim.diagnostic.setloclist,
    --     { noremap = true, silent = true, buffer = bufnr, desc = "LSP show errors" })
    vim.keymap.set('n', '<leader>cA', vim.lsp.buf.code_action,
        { noremap = true, silent = true, buffer = bufnr, desc = "LSP code action" })
end

-- Setup lspconfig.
local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.enable('pylsp')
vim.lsp.config('pylsp',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        maxLineLength = 120
                    }
                }
            }
        }
    }
)

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
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
    }
)

vim.lsp.enable('vimls')
vim.lsp.config('vimls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('perlnavigator')
vim.lsp.config('perlnavigator',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
        cmd = { "perlnavigator", "--stdio" }
    }
)

vim.lsp.enable('bashls')
vim.lsp.config('bashls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('clangd')
vim.lsp.config('clangd',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", },
    }
)

vim.lsp.enable('yamlls')
vim.lsp.config('yamlls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('gopls')
vim.lsp.config('gopls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('sqlls')
vim.lsp.config('sqlls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('dockerls')
vim.lsp.config('dockerls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('jsonls')
vim.lsp.config('jsonls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('yamlls')
vim.lsp.config('yamlls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
        settings = {
            yaml = {
                keyOrdering = false
            }
        }
    }
)

vim.lsp.enable('html')
vim.lsp.config('html',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('marksman')
vim.lsp.config('marksman',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('hls')
vim.lsp.config('hls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
    }
)

vim.lsp.enable('terraformls')
vim.lsp.config('terraformls',
    {
        on_attach = custom_attach,
        capabilities = capabilities,
        filetypes = { "tf" },
    }
)

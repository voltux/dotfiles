require('neorg').setup {
    load = {
        ["core.defaults"]               = {},
        ["core.integrations.nvim-cmp"]  = {},
        ["core.integrations.telescope"] = {},
        ["core.dirman"]                 = {
            config = {
                workspaces = {
                    todo = os.getenv("HOME") .. "/Documents/todo",
                },
                default_workspace = "todo",
                index = "index.norg"
            }
        },
        ["core.completion"]             = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.concealer"]              = {},
        ["core.journal"]                = {},
        ["core.presenter"]              = {
            config = {
                zen_mode = "zen-mode"
            }
        },
        ["core.export.markdown"]        = {
            config = {
                extensions = "all"
            }
        },
        ["core.export"]                 = {
            config = {
                extensions = "all"
            }
        },
    }
}

vim.keymap.set("n", "<leader>ofh", "<cmd>Telescope neorg search_headings<cr>",
    { noremap = true, desc = 'Telescope neorg search headings' })
vim.keymap.set("n", "<leader>ofL", "<cmd>Telescope neorg insert_link<cr>",
    { noremap = true, desc = 'Telescope neorg insert link' })
vim.keymap.set("n", "<leader>ofl", "<cmd>Telescope neorg find_linkable<cr>",
    { noremap = true, desc = 'Telescope neorg find linkable' })
vim.keymap.set("n", "<leader>off", "<cmd>Telescope neorg find_norg_files<cr>",
    { noremap = true, desc = 'Telescope neorg find linkable' })
vim.keymap.set("n", "<leader>ofF", "<cmd>Telescope neorg insert_file_link<cr>",
    { noremap = true, desc = 'Telescope neorg insert link' })
vim.keymap.set("n", "<leader>ofp", "<cmd>Telescope neorg find_project_tasks<cr>",
    { noremap = true, desc = 'Telescope neorg find project tasks' })
vim.keymap.set("n", "<leader>oft", "<cmd>Telescope neorg find_context_tasks<cr>",
    { noremap = true, desc = 'Telescope neorg find context tasks' })
vim.keymap.set("n", "<leader>ofw", "<cmd>Telescope neorg switch_workspace<cr>",
    { noremap = true, desc = 'Telescope neorg switch workspace' })
vim.keymap.set("n", "<leader>op", "<cmd>Neorg presenter start<cr>",
    { noremap = true, desc = 'Neorg presenter start' })
vim.keymap.set("n", "<leader>oi", "<cmd>Neorg index<cr>",
    { noremap = true, desc = 'Neorg index' })

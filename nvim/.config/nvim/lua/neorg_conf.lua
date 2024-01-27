require('neorg').setup {
    load = {
        ["core.defaults"]              = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.dirman"]                = {
            config = {
                workspaces = {
                    todo = os.getenv("HOME") .. "/Documents/todo",
                },
                default_workspace = "todo",
                index = "index.norg"
            }
        },
        ["core.completion"]            = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.concealer"]             = {},
        ["core.journal"]               = {},
        ["core.presenter"]             = {
            config = {
                zen_mode = "zen-mode"
            }
        },
        ["core.export.markdown"]       = {},
        ["core.manoeuvre"]             = {},
        ["core.export"]                = {},

    }
}

vim.keymap.set("n", "<leader>fnh", "<cmd>Telescope neorg search_headings<cr>",
    { noremap = true, desc = 'Telescope neorg search headings' })
vim.keymap.set("n", "<leader>fnL", "<cmd>Telescope neorg insert_link<cr>",
    { noremap = true, desc = 'Telescope neorg insert link' })
vim.keymap.set("n", "<leader>fnl", "<cmd>Telescope neorg find_linkable<cr>",
    { noremap = true, desc = 'Telescope neorg find linkable' })
vim.keymap.set("n", "<leader>fnf", "<cmd>Telescope neorg find_norg_files<cr>",
    { noremap = true, desc = 'Telescope neorg find linkable' })
vim.keymap.set("n", "<leader>fnF", "<cmd>Telescope neorg insert_file_link<cr>",
    { noremap = true, desc = 'Telescope neorg insert link' })
vim.keymap.set("n", "<leader>fnp", "<cmd>Telescope neorg find_project_tasks<cr>",
    { noremap = true, desc = 'Telescope neorg find project tasks' })
vim.keymap.set("n", "<leader>fnt", "<cmd>Telescope neorg find_context_tasks<cr>",
    { noremap = true, desc = 'Telescope neorg find context tasks' })
vim.keymap.set("n", "<leader>fnw", "<cmd>Telescope neorg switch_workspace<cr>",
    { noremap = true, desc = 'Telescope neorg switch workspace' })

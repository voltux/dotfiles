local basic_load = {
    ["core.defaults"]               = {},
    ["core.integrations.telescope"] = {},
    ["core.integrations.nvim-cmp"]  = {},
    ["core.dirman"]                 = {
        config = {
            workspaces = {
                todo = os.getenv("HOME") .. "/Documents/todo"
            },
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
    ["core.export.markdown"]        = {},
    ["core.manoeuvre"]              = {},
    ["core.export"]                 = {},
}

-- local gtd_load = {
--     ["core.gtd.base"]    = {
--         config = {
--             workspace = "todo"
--         },
--     },
--     ["core.gtd.ui"]      = {},
--     ["core.gtd.helpers"] = {},
--     ["core.gtd.queries"] = {},
-- }

local load = basic_load
-- if isdir(os.getenv("HOME") .. "/Documents/todo") then
--     for k, v in pairs(gtd_load) do
--         load[k] = v
--     end
-- end

require('neorg').setup {
    load = load
}
local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<leader>fnl", "core.integrations.telescope.find_linkable" },
        },
        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
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

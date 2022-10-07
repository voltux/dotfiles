require('neorg').setup {
    load = {
        ["core.defaults"]               = {},
        ["core.integrations.telescope"] = {},
        ["core.integrations.nvim-cmp"]  = {},
        ["core.norg.dirman"]            = {
            config = {
                workspaces = {
                    todo = os.getenv("HOME") .. "/Documents/todo"
                },
                index = "index.norg"
            }
        },
        ["core.gtd.base"]               = {
            config = {
                workspace = "todo"
            },
        },
        ["core.gtd.ui"]                 = {},
        ["core.gtd.helpers"]            = {},
        ["core.gtd.queries"]            = {},
        ["core.norg.completion"]        = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.norg.concealer"]         = {},
        ["core.norg.journal"]           = {},
        ["core.presenter"]              = {
            config = {
                zen_mode = "truezen"
            }
        },
        ["core.export.markdown"]        = {},
        ["core.norg.manoeuvre"]         = {},
        ["core.export"]                 = {},

    }
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

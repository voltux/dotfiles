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

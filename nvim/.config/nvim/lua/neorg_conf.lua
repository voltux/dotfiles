-- helper functions
--- Check if a file or directory exists in this path
function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
    -- "/" works on both Unix and Windows
    return exists(path .. "/")
end

local basic_load = {
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

local gtd_load = {
    ["core.gtd.base"]    = {
        config = {
            workspace = "todo"
        },
    },
    ["core.gtd.ui"]      = {},
    ["core.gtd.helpers"] = {},
    ["core.gtd.queries"] = {},
}

local load = basic_load
if isdir(os.getenv("HOME") .. "/Documents/todo") then
    for k, v in pairs(gtd_load) do
        load[k] = v
    end
end

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

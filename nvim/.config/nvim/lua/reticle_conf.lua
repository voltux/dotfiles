require('reticle').setup {
    on_startup = {
        cursorline = true,
        cursorcolumn = false,
    },
    -- Make the cursorline and cursorcolumn follow your active window. This
    -- only works if the cursorline and cursorcolumn setting is switched on
    -- globaly like explained in 'Usage'. Default is true for both values
    follow = {
        cursorline = true,
        cursorcolumn = true,
    },

    -- Disable the cursorline and cursorcolumn in insert mode. Default is true
    disable_in_insert = true,

    -- By default, nvim highlights the cursorline number only when the cursorline setting is
    -- switched on. When enabling the following setting, the cursorline number
    -- of every window is always highlighted, regardless of the setting
    always_highlight_number = true,

    -- Define filetypes where the cursorline / cursorcolumn is always on,
    -- regardless of the global setting
    always = {
        cursorline = {},
        cursorcolumn = {},
    },

    -- Define filetypes where the cursorline / cursorcolumn is always on when
    -- the window is focused, regardless of the global setting
    on_focus = {
        cursorline = {
            '*',
        },
        cursorcolumn = {},
    },

    -- Define filetypes where the cursorline / cursorcolumn is never on,
    -- regardless of the global setting
    never = {
        cursorline = {
            'qf',
        },
        cursorcolumn = {
            'qf',
        },
    },

    -- Define filetypes which are ignored by the plugin
    ignore = {
        cursorline = {
            'lspinfo',
            'toggleterm'
        },
        cursorcolumn = {
            'lspinfo',
            'toggleterm'
        },
    },
}

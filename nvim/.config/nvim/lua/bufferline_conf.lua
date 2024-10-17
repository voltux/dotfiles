require('bufferline').setup {
    options = {
        mode = "buffers",
        numbers = "none",
        indicator = {
            style = 'none',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 25,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = true,
        diagnostics_update_in_insert = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                highlight = "Directory",
                separator = true
            },
            {
                filetype = "sagaoutline",
                text = "Minimap",
                text_align = "center",
                highlight = "Directory",
                separator = true
            }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        separator_style = "slant",
        enforce_regular_tabs = false,
    },
}

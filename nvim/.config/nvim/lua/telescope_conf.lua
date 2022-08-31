-- setup telescope
local telescope = require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"venv/.*"}
    }
}

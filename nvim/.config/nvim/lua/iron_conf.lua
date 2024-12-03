local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        command = { "python3" },  -- or { "ipython", "--no-autoindent" }
        format = require("iron.fts.common").bracketed_paste_python
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<leader>rc",
    visual_send = "<leader>rc",
    send_file = "<leader>rf",
    send_line = "<leader>rl",
    send_paragraph = "<leader>rp",
    send_until_cursor = "<leader>ru",
    send_mark = "<leader>rm",
    mark_motion = "<leader>mc",
    mark_visual = "<leader>mc",
    remove_mark = "<leader>md",
    cr = "<leader>r<cr>",
    interrupt = "<leader>r<leader>",
    exit = "<leader>rq",
    clear = "<leader>rx",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<leader>rr', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>rS', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rF', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rH', '<cmd>IronHide<cr>')

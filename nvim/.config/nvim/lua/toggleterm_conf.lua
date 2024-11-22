require('toggleterm').setup {
    shade_terminals = false,
    float_opts = {
        border = "rounded",
        height = vim.o.lines - 5,
        width = vim.o.columns,
    },
    highlights = {
        FloatBorder = {
            guifg = "#d79921",
        }
    }
}
vim.keymap.set("n", "<leader>sf", "<cmd>ToggleTerm direction=float<cr>",
    { silent = true, noremap = true, desc = 'Toggle floating terminal' })
vim.keymap.set("n", "<leader>sl", "<cmd>ToggleTerm direction=vertical<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal' })
vim.keymap.set("n", "<leader>sj", "<cmd>ToggleTerm direction=horizontal<cr>",
    { silent = true, noremap = true, desc = 'Toggle horizontal terminal' })
vim.keymap.set("n", "<leader>st", "<cmd>ToggleTerm direction=tab<cr>",
    { silent = true, noremap = true, desc = 'Toggle tab terminal' })
vim.keymap.set("n", "<leader>ss", "<cmd>ToggleTerm<cr>",
    { silent = true, noremap = true, desc = 'Toggle last terminal' })

local lazygit = require('toggleterm.terminal').Terminal:new({
    cmd = "lazygit",
    count = 5,
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "rounded",
        height = vim.o.lines - 5,
        width = vim.o.columns,
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    -- on_close = function(term)
    --     vim.cmd("startinsert!")
    -- end,
})

function LazygitToggle()
    lazygit:toggle()
end

local htop = require('toggleterm.terminal').Terminal:new({
    cmd = "htop",
    count = 5,
    direction = "float",
    float_opts = {
        border = "rounded",
        height = vim.o.lines - 5,
        width = vim.o.columns,
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
})

function HtopToggle()
    htop:toggle()
end

require('toggleterm').setup {
    shade_terminals = false,
    float_opts = {
        border = "rounded",
    }
}
vim.keymap.set("n", "<leader>sf", "<cmd>ToggleTerm direction=float border=rounded<cr>",
    { silent = true, noremap = true, desc = 'Toggle floating terminal' })
vim.keymap.set("n", "<leader>sl", "<cmd>ToggleTerm direction=vertical size=120<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal' })
vim.keymap.set("n", "<leader>sj", "<cmd>ToggleTerm direction=horizontal size=40<cr>",
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
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function LazygitToggle()
    lazygit:toggle()
end

vim.keymap.set("n", "<leader>gg", "<cmd>lua LazygitToggle()<CR>",
{ noremap = true, silent = true, desc = 'Toggle lazygit' })

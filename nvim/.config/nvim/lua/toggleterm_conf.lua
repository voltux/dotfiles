require('toggleterm').setup {}
vim.api.nvim_set_keymap("n", "<leader>sf", "<cmd>ToggleTerm direction=float<cr>",
    { silent = true, noremap = true, desc = 'Toggle floating terminal' })
vim.api.nvim_set_keymap("n", "<leader>sl", "<cmd>ToggleTerm direction=vertical size=120<cr>",
    { silent = true, noremap = true, desc = 'Toggle vertical terminal' })
vim.api.nvim_set_keymap("n", "<leader>sj", "<cmd>ToggleTerm direction=horizontal size=40<cr>",
    { silent = true, noremap = true, desc = 'Toggle horizontal terminal' })
vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>ToggleTerm direction=tab<cr>",
    { silent = true, noremap = true, desc = 'Toggle tab terminal' })
vim.api.nvim_set_keymap("n", "<leader>ss", "<cmd>ToggleTerm<cr>",
    { silent = true, noremap = true, desc = 'Toggle last terminal' })

local lazygit = require('toggleterm.terminal').Terminal:new({
  cmd = "lazygit",
  count = 5,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function LazygitToggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua LazygitToggle()<CR>", {noremap = true, silent = true, desc = 'Toggle lazygit'})

require("zen-mode").setup {}

-- <leader>z used to be true-zen's TZFocus. true-zen has been unmaintained since
-- 2023 and zen-mode covers the same ground, so the key moved here.
vim.keymap.set('n', '<leader>z', '<Cmd>ZenMode<CR>', { noremap = true, desc = 'Zen mode toggle' })

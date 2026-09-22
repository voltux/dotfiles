require("zen-mode").setup {
    window = {
        backdrop = 1, -- no dimming, the zen window covers everything anyway
        width = 1,    -- fraction of the editor width, so: all of it
        height = 1,
    },
    plugins = {
        -- twilight dims everything outside the current block; zen-mode turns it
        -- on by default whenever it is installed, which is the opposite of just
        -- showing the file
        twilight = { enabled = false },
    },
}

-- <leader>z used to be true-zen's TZFocus. true-zen has been unmaintained since
-- 2023 and zen-mode covers the same ground, so the key moved here.
vim.keymap.set('n', '<leader>z', '<Cmd>ZenMode<CR>', { noremap = true, desc = 'Zen mode toggle' })

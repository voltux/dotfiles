local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-S-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-S-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-S-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-S-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-S-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-S-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-S-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-S-l>', ':MoveHBlock(1)<CR>', opts)

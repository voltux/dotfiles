-- <Plug> mappings must be remapped: with noremap the rhs is never resolved
vim.keymap.set({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)', { remap = true, desc = 'EasyAlign activate' })

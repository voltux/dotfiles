-- nvim-treesitter's main branch no longer enables highlighting by itself
-- (the old `highlight = { enable = true }` is gone), so start it for every
-- buffer whose language has an installed parser. rainbow-delimiters relies on
-- this too: without an active highlighter the tree is never parsed and no
-- delimiter gets coloured.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.treesitter.language.add(lang) then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})

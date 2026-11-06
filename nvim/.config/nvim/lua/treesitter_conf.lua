-- Parsers are compiled by `tree-sitter build`, which uses -O2 unless CFLAGS
-- says otherwise. Some grammars generate a huge single lexer function (e.g.
-- gitcommit: ~79k lines in ts_lex), and GCC 12 takes practically forever to
-- optimise it at -O2, so :TSInstall/:TSUpdate seem to hang on "Compiling
-- parser". -O1 builds the same parser in seconds, and the runtime cost is
-- negligible. The `or` keeps any CFLAGS already set in the environment.
vim.env.CFLAGS = vim.env.CFLAGS or '-O1'

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

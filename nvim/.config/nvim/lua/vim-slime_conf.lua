vim.g.slime_target = "neovim"

-- autocmd to assign last entered terminal as slime target
vim.api.nvim_create_autocmd('TermEnter', {
    pattern = '*',
    command = 'let g:slime_last_channel=b:terminal_job_id',
})
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    command = [[if exists("b:slime_config")
                    let b:slime_config = {"jobid": get(g:, "slime_last_channel", b:slime_config["jobid"])}
                endif
                ]],
})

require('orgmode').setup({
    org_default_notes_file = '~/Documents/org/notes.org',
    org_agenda_files = { "~/Documents/org/**" },
    win_split_mode = 'vertical',
    org_agenda_span = 'week',
    org_agenda_skip_scheduled_if_done = true,
    org_agenda_skip_deadline_if_done = true,
    org_agenda_skip_if_done = true,
    org_agenda_start_on_weekday = false
})
--
-- :autocmd BufNewFile,BufRead *.org fold
vim.cmd [[
:autocmd BufNewFile,BufRead *.org setlocal conceallevel=2
:autocmd BufNewFile,BufRead *.org setlocal concealcursor=nc
:autocmd BufNewFile,BufRead *.org setlocal nowrap
:autocmd BufNewFile,BufRead *.org setlocal foldlevel=99
:autocmd BufNewFile,BufRead diary.org setlocal textwidth=66
:autocmd BufNewFile,BufRead diary.org setlocal colorcolumn=+2
]]

vim.cmd(":command MdToOrgLinks s/\\[\\(.*\\)\\](\\(.*\\))/[[\2][\1]]")

require("org-bullets").setup {
    concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
        list = "•",
        headlines = { " ", "󰺕 ", "✸", "✿" },
        checkboxes = {
            half = { "", "OrgTSCheckboxHalfChecked" },
            done = { "✓", "OrgDone" },
            todo = { "×", "OrgTODO" },
        },
    }
}

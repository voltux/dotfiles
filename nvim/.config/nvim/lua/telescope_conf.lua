--Telescope
local homepath = os.getenv("HOME")
local telescope_project_base_dirs = {}
local possible_base_dirs = {
    homepath .. "/workspace",
    homepath .. "/Projects",
    homepath .. "/Scripts",
    homepath .. "/sdev-legacy/workspace",
    "/manager",
}

for _, dirname in ipairs(possible_base_dirs) do
    if vim.fn.isdirectory(dirname) ~= 0 then
        table.insert(telescope_project_base_dirs, dirname)
    end
end

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "venv/.*" }
    },
    extensions = {
        file_browser = {},
        project = {
            base_dirs = {
                telescope_project_base_dirs
            },
            order_by = "asc",
            sync_with_nvim_tree = true
        },
        cder = {
            previewer_command = 'tree -L 1 -C',
        },
    },
}
require('telescope').load_extension('luasnip')
require('telescope').load_extension('project')
vim.api.nvim_set_keymap('n', '<leader>f%', '<cmd>Telescope oldfiles<CR>',
    { noremap = true, desc = 'Telescope find recently open files' })
vim.api.nvim_set_keymap('n', '<leader>f/', '<cmd>Telescope search_history<CR>',
    { noremap = true, desc = 'Telescope find in search history' })
vim.api.nvim_set_keymap('n', '<leader>fG', '<cmd>Telescope git_status<CR>',
    { noremap = true, desc = 'Telescope find modified git files' })
vim.api.nvim_set_keymap('n', '<leader>fa', '<cmd>Telescope live_grep<CR>',
    { noremap = true, desc = 'Telescope find pattern in all files' })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, desc = 'Telescope find buffer' })
vim.api.nvim_set_keymap('n', '<leader>f:', '<cmd>Telescope commands<CR>',
    { noremap = true, desc = 'Telescope find nvim command' })
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>',
    { noremap = true, desc = 'Telescope find diagnostic' })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, desc = 'Telescope find file' })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope git_files<CR>',
    { noremap = true, desc = 'Telescope find git files' })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>',
    { noremap = true, desc = 'Telescope find help tags' })
vim.api.nvim_set_keymap('n', '<leader>fi', '<cmd>Telescope current_buffer_fuzzy_find<CR>',
    { noremap = true, desc = 'Telescope find in current buffer' })
vim.api.nvim_set_keymap('n', '<leader>fj', '<cmd>Telescope jumplist<CR>',
    { noremap = true, desc = 'Telescope find in jumplist' })
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>Telescope keymaps<CR>', { noremap = true, desc = 'Telescope find keymap' })
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>Telescope loclist<CR>',
    { noremap = true, desc = 'Telescope find in location list' })
vim.api.nvim_set_keymap('n', '<leader>f\'', '<cmd>Telescope marks<CR>', { noremap = true, desc = 'Telescope find marks' })
vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd>Telescope vim_options<CR>',
    { noremap = true, desc = 'Telescope find vim option' })
vim.api.nvim_set_keymap('n', '<leader>fq', '<cmd>Telescope quickfix<CR>',
    { noremap = true, desc = 'Telescope find in quickfix list' })
vim.api.nvim_set_keymap('n', '<leader>f"', '<cmd>Telescope registers<CR>',
    { noremap = true, desc = 'Telescope find in registers' })
vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>Telescope grep_string<CR>',
    { noremap = true, desc = 'Telescope find string in path' })
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope tags<CR>', { noremap = true, desc = 'Telescope find tag' })
vim.api.nvim_set_keymap('n', '<leader>fu', '<cmd>Telescope lsp_references<CR>',
    { noremap = true, desc = 'Telescope find lsp reference' })
vim.api.nvim_set_keymap('n', '<leader>f<', '<cmd>Telescope lsp_incoming_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who am I calling' })
vim.api.nvim_set_keymap('n', '<leader>f>', '<cmd>Telescope lsp_outgoing_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who is calling me' })
vim.api.nvim_set_keymap('n', '<leader>f$', '<cmd>Telescope lsp_document_symbols<CR>',
    { noremap = true, desc = 'Telescope find in document functions, variables, expressions...' })
vim.api.nvim_set_keymap('n', '<leader>f^', '<cmd>Telescope lsp_workspace_symbols<CR>',
    { noremap = true, desc = 'Telescope find in workspace functions, variables, expressions...' })
vim.api.nvim_set_keymap('n', '<leader>fD', '<cmd>Telescope lsp_definitions<CR>',
    { noremap = true, desc = 'Telescope find definition' })
vim.api.nvim_set_keymap('n', '<leader>fI', '<cmd>Telescope lsp_implementations<CR>',
    { noremap = true, desc = 'Telescope find implementation' })
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope lsp_type_definitions<CR>',
    { noremap = true, desc = 'Telescope find type definition' })
vim.api.nvim_set_keymap('n', '<leader>fv', '<cmd>Telescope treesitter<CR>',
    { noremap = true, desc = 'Telescope find treesitter symbol' })
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>Telescope git_commits<CR>',
    { noremap = true, desc = 'Telescope find in commits' })
vim.api.nvim_set_keymap('n', '<leader>fT', '<cmd>Telescope git_branches<CR>',
    { noremap = true, desc = 'Telescope find in branches' })
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope luasnip<CR>', { noremap = true, desc = 'Telescope find snippet' })
vim.api.nvim_set_keymap('n', '<leader>fS', '<cmd>Telescope git_stash<CR>',
    { noremap = true, desc = 'Telescope find git stash' })
vim.api.nvim_set_keymap('n', '<leader>fB', '<cmd>Telescope git_bcommits<CR>',
    { noremap = true, desc = 'Telescope find current buffer commit history' })
vim.api.nvim_set_keymap('n', '<leader>fz', '<cmd>Telescope spell_suggest<CR>',
    { noremap = true, desc = 'Telescope find spelling suggestions for current word under cursor' })
vim.api.nvim_set_keymap('n', '<leader>f%', '<cmd>Telescope oldfiles<CR>',
    { noremap = true, desc = 'Telescope find recently open files' })
vim.api.nvim_set_keymap('n', '<leader>fF', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    { noremap = true, desc = 'Telescope file browser' })
vim.api.nvim_set_keymap('n', '<leader>fp',
    "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
    { noremap = true, silent = true, desc = 'Telescope find project' })
vim.api.nvim_set_keymap('n', '<leader>fC', "<cmd>Telescope cder<CR>",
    { noremap = true, desc = 'Telescope cd change current directory' })

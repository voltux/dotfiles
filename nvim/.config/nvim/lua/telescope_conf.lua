--Telescope
local telescope_project_base_dirs = {}
local possible_base_dirs = {
    os.getenv("HOME") .. "/workspace",
    os.getenv("HOME") .. "/Projects",
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
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        },
        file_browser = {},
        project = {
            base_dirs = {
                telescope_project_base_dirs
            },
            order_by = "asc"
        }
    }
}
require('telescope').load_extension('ui-select')
require('telescope').load_extension('luasnip')
require('telescope').load_extension('project')
vim.api.nvim_set_keymap('n', '<leader>f%', ':Telescope oldfiles<CR>',
    { noremap = true, desc = 'Telescope find recently open files' })
vim.api.nvim_set_keymap('n', '<leader>f/', ':Telescope search_history<CR>',
    { noremap = true, desc = 'Telescope find in search history' })
vim.api.nvim_set_keymap('n', '<leader>fG', ':Telescope git_status<CR>',
    { noremap = true, desc = 'Telescope find modified git files' })
vim.api.nvim_set_keymap('n', '<leader>fa', ':Telescope live_grep<CR>',
    { noremap = true, desc = 'Telescope find pattern in all files' })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, desc = 'Telescope find buffer' })
vim.api.nvim_set_keymap('n', '<leader>f:', ':Telescope commands<CR>',
    { noremap = true, desc = 'Telescope find nvim command' })
vim.api.nvim_set_keymap('n', '<leader>fd', ':Telescope diagnostics<CR>',
    { noremap = true, desc = 'Telescope find diagnostic' })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = 'Telescope find file' })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope git_files<CR>',
    { noremap = true, desc = 'Telescope find git files' })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>',
    { noremap = true, desc = 'Telescope find help tags' })
vim.api.nvim_set_keymap('n', '<leader>fi', ':Telescope current_buffer_fuzzy_find<CR>',
    { noremap = true, desc = 'Telescope find in current buffer' })
vim.api.nvim_set_keymap('n', '<leader>fj', ':Telescope jumplist<CR>',
    { noremap = true, desc = 'Telescope find in jumplist' })
vim.api.nvim_set_keymap('n', '<leader>fk', ':Telescope keymaps<CR>', { noremap = true, desc = 'Telescope find keymap' })
vim.api.nvim_set_keymap('n', '<leader>fl', ':Telescope loclist<CR>',
    { noremap = true, desc = 'Telescope find in location list' })
vim.api.nvim_set_keymap('n', '<leader>f\'', ':Telescope marks<CR>', { noremap = true, desc = 'Telescope find marks' })
vim.api.nvim_set_keymap('n', '<leader>fo', ':Telescope vim_options<CR>',
    { noremap = true, desc = 'Telescope find vim option' })
vim.api.nvim_set_keymap('n', '<leader>fq', ':Telescope quickfix<CR>',
    { noremap = true, desc = 'Telescope find in quickfix list' })
vim.api.nvim_set_keymap('n', '<leader>f"', ':Telescope registers<CR>',
    { noremap = true, desc = 'Telescope find in registers' })
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope grep_string<CR>',
    { noremap = true, desc = 'Telescope find string in path' })
vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope tags<CR>', { noremap = true, desc = 'Telescope find tag' })
vim.api.nvim_set_keymap('n', '<leader>fu', ':Telescope lsp_references<CR>',
    { noremap = true, desc = 'Telescope find lsp reference' })
vim.api.nvim_set_keymap('n', '<leader>f<', ':Telescope lsp_incoming_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who am I calling' })
vim.api.nvim_set_keymap('n', '<leader>f>', ':Telescope lsp_outgoing_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who is calling me' })
vim.api.nvim_set_keymap('n', '<leader>f$', ':Telescope lsp_document_symbols<CR>',
    { noremap = true, desc = 'Telescope find in document functions, variables, expressions...' })
vim.api.nvim_set_keymap('n', '<leader>f^', ':Telescope lsp_workspace_symbols<CR>',
    { noremap = true, desc = 'Telescope find in workspace functions, variables, expressions...' })
vim.api.nvim_set_keymap('n', '<leader>fD', ':Telescope lsp_definitions<CR>',
    { noremap = true, desc = 'Telescope find definition' })
vim.api.nvim_set_keymap('n', '<leader>fI', ':Telescope lsp_implementations<CR>',
    { noremap = true, desc = 'Telescope find implementation' })
vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope lsp_type_definitions<CR>',
    { noremap = true, desc = 'Telescope find type definition' })
vim.api.nvim_set_keymap('n', '<leader>fv', ':Telescope treesitter<CR>',
    { noremap = true, desc = 'Telescope find treesitter symbol' })
vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope git_commits<CR>',
    { noremap = true, desc = 'Telescope find in commits' })
vim.api.nvim_set_keymap('n', '<leader>fT', ':Telescope git_branches<CR>',
    { noremap = true, desc = 'Telescope find in branches' })
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope luasnip<CR>', { noremap = true, desc = 'Telescope find snippet' })
vim.api.nvim_set_keymap('n', '<leader>fS', ':Telescope git_stash<CR>',
    { noremap = true, desc = 'Telescope find git stash' })
vim.api.nvim_set_keymap('n', '<leader>fB', ':Telescope git_bcommits<CR>',
    { noremap = true, desc = 'Telescope find current buffer commit history' })
vim.api.nvim_set_keymap('n', '<leader>fz', ':Telescope spell_suggest<CR>',
    { noremap = true, desc = 'Telescope find spelling suggestions for current word under cursor' })
vim.api.nvim_set_keymap('n', '<leader>f%', ':Telescope oldfiles<CR>',
    { noremap = true, desc = 'Telescope find recently open files' })
vim.api.nvim_set_keymap('n', '<leader>fF', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    { noremap = true, desc = 'Telescope file browser' })
vim.api.nvim_set_keymap('n', '<leader>fp',
    "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
    { noremap = true, silent = true, desc = 'Telescope find project' })

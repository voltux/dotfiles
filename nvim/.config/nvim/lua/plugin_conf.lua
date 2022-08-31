--setup needed functions
local setkm = vim.api.nvim_set_keymap

--Treesitter
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' },
}

--Telescope
require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "venv/.*" }
    }
}

--Orgmode
require('orgmode').setup {}

--Nvim-autopairs
require("nvim-autopairs").setup {}

--Comment
require('Comment').setup()

--Nerdtree
vim.api.nvim_create_autocmd("bufenter",
    { command = 'if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif' })
vim.api.nvim_create_autocmd("StdinReadPre", { command = 'let s:std_in=1' })
setkm('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, desc = 'NERDTree Toggle' })

--Ultisnips
vim.g.UltiSnipsExpandTrigger       = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger  = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-tab>"

--Whitespace
vim.cmd [[ highlight ExtraWhitespace ctermbg=78 ]]
setkm('n', '<leader>w', ':StripWhitespace<CR>', { noremap = true, desc = 'Strip whitespace' })

--Undotree
setkm('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, desc = 'Undotree Toggle' })

--Slime
vim.g.slime_target           = "tmux"
vim.g.slime_default_config   = '{"socket_name": "default", "target_pane": "1"}'
vim.g.slime_dont_ask_default = 1
vim.g.slime_python_ipython   = 0

--Rainbow brackets
vim.g.rainbow_active = 1

--Easy align
setkm('n', 'ga', '<Plug>(EasyAlign)', { noremap = true, desc = 'EasyAlign activate' })
setkm('v', 'ga', '<Plug>(EasyAlign)', { noremap = true, desc = 'EasyAlign activate' })

--IndentBlankLine
setkm('n', '<leader>i', ':IndentBlanklineToggle<CR>', { noremap = true, desc = 'IndentBlankLine Toggle' })

--Airline
vim.g['airline_symbols.colnr'] = ':'
vim.g['airline_symbols.crypt'] = '🔒'
vim.g['airline_symbols.linenr'] = ' | '
vim.g['airline_symbols.maxlinenr'] = ''
vim.g['airline_symbols.branch'] = '⎇'
vim.g['airline_symbols.paste'] = 'PASTE'
vim.g['airline_symbols.spell'] = 'SPELL'
vim.g['airline_symbols.notexists'] = 'Ɇ'
vim.g['airline_symbols.whitespace'] = 'wh'
vim.g['airline#extensions#wordcount#formatter#default#fmt'] = '%s |'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#show_tab_nr'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['airline#extensions#tabline#ignore_bufadd_pat'] = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

--Telescope
setkm('n', '<leader>f%', ':Telescope oldfiles<CR>', { noremap = true, desc = 'Telescope find recently open files' })
setkm('n', '<leader>f/', ':Telescope search_history<CR>', { noremap = true, desc = 'Telescope find in search history' })
setkm('n', '<leader>fG', ':Telescope git_status<CR>', { noremap = true, desc = 'Telescope find modified git files' })
setkm('n', '<leader>fa', ':Telescope live_grep<CR>', { noremap = true, desc = 'Telescope find pattern in all files' })
setkm('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, desc = 'Telescope find buffer' })
setkm('n', '<leader>f:', ':Telescope commands<CR>', { noremap = true, desc = 'Telescope find nvim command' })
setkm('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, desc = 'Telescope find diagnostic' })
setkm('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = 'Telescope find file' })
setkm('n', '<leader>fg', ':Telescope git_files<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fi', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fj', ':Telescope jumplist<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fk', ':Telescope keymaps<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fl', ':Telescope loclist<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f\'', ':Telescope marks<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fo', ':Telescope vim_options<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fq', ':Telescope quickfix<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f"', ':Telescope registers<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fw', ':Telescope grep_string<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>ft', ':Telescope tags<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fu', ':Telescope lsp_references<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f<', ':Telescope lsp_incoming_calls<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f>', ':Telescope lsp_outgoing_calls<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f$', ':Telescope lsp_document_symbols<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f^', ':Telescope lsp_workspace_symbols<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fD', ':Telescope lsp_definitions<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fI', ':Telescope lsp_implementations<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>ft', ':Telescope lsp_type_definitions<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fv', ':Telescope treesitter<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fc', ':Telescope git_commits<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fT', ':Telescope git_branches<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fs', ':Telescope git_status<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fS', ':Telescope git_stash<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fB', ':Telescope git_bcommits<CR>', { noremap = true, desc = 'Telescope find' })

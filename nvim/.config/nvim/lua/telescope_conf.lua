require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        mappings = {
            i = {
                ["<C-o>"] = function(p_bufnr)
                    require("telescope.actions").send_selected_to_qflist(p_bufnr)
                    vim.cmd.cfdo("edit")
                end,
            },
            n = { ["q"] = require("telescope.actions").close },
        },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.99,
            height = 0.99,
            horizontal = {
                prompt_position = "top",
                anchor = "SW",
                width = 0.999,
                preview_width = 0.5,
            },
            vertical = {
                mirror = true,
            },
        },
        prompt_prefix = "   ",
        file_ignore_patterns = { "^venv/", "^.git/" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        path_display = { "truncate" },
    },
    extensions = {
        togglescope = {
            find_files = {
                ['<C-h>'] = {
                    hidden = true,
                    no_ignore = true,
                    togglescope_title = "Find Files (hidden)"
                }
            },
            live_grep = {
                ['<C-h>'] = {
                    additional_args = {
                        '--hidden',
                        '--no-ignore',
                    },
                    togglescope_title = "Live Grep (hidden)"
                }
            },
            grep_string = {
                ['<C-h>'] = {
                    additional_args = {
                        '--hidden',
                        '--no-ignore',
                    },
                    togglescope_title = "Find Word (hidden)"
                }
            },
        },
        file_browser = {
            use_fd = false,
        },
        cder = {
            previewer_command = 'tree -L 1 -C',
        },
        undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.8,
            },
        },
    },
}

require('telescope').load_extension('luasnip')
require("telescope").load_extension("undo")
require("telescope").load_extension("emoji")
vim.keymap.set('n', '<leader>f%', '<cmd>Telescope oldfiles<CR>',
    { noremap = true, desc = 'Telescope find recently open files' })
vim.keymap.set('n', '<leader>f/', '<cmd>Telescope search_history<CR>',
    { noremap = true, desc = 'Telescope find in search history' })
vim.keymap.set('n', '<leader>fG', '<cmd>Telescope git_status<CR>',
    { noremap = true, desc = 'Telescope find modified git files' })
vim.keymap.set('n', '<leader>fa', function() require('telescope').extensions.togglescope.live_grep() end,
    { noremap = true, desc = 'Telescope find pattern in all files' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>',
    { noremap = true, desc = 'Telescope find buffer' })
vim.keymap.set('n', '<leader>f:', '<cmd>Telescope commands<CR>',
    { noremap = true, desc = 'Telescope find nvim command' })
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>',
    { noremap = true, desc = 'Telescope find diagnostic' })
vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope').extensions.togglescope.find_files()<CR>",
    { noremap = true, desc = 'Telescope find file' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_files<CR>',
    { silent = true, noremap = true, desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>',
    { noremap = true, desc = 'Telescope find help tags' })
vim.keymap.set('n', '<leader>fi', '<cmd>Telescope current_buffer_fuzzy_find<CR>',
    { noremap = true, desc = 'Telescope find in current buffer' })
vim.keymap.set('n', '<leader>fj', '<cmd>Telescope jumplist<CR>',
    { noremap = true, desc = 'Telescope find in jumplist' })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<CR>',
    { noremap = true, desc = 'Telescope find keymap' })
vim.keymap.set('n', '<leader>fl', '<cmd>Telescope loclist<CR>',
    { noremap = true, desc = 'Telescope find in location list' })
vim.keymap.set('n', '<leader>f\'', '<cmd>Telescope marks<CR>', { noremap = true, desc = 'Telescope find marks' })
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope vim_options<CR>',
    { noremap = true, desc = 'Telescope find vim option' })
vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<CR>',
    { noremap = true, desc = 'Telescope find in quickfix list' })
vim.keymap.set('n', '<leader>f"', '<cmd>Telescope registers<CR>',
    { noremap = true, desc = 'Telescope find in registers' })
vim.keymap.set('n', '<leader>fw', function() require('telescope').extensions.togglescope.grep_string() end,
    { noremap = true, desc = 'Telescope find string in path' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope tags<CR>', { noremap = true, desc = 'Telescope find tag' })
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope lsp_references<CR>',
    { noremap = true, desc = 'Telescope find lsp reference' })
vim.keymap.set('n', '<leader>f<', '<cmd>Telescope lsp_incoming_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who am I calling' })
vim.keymap.set('n', '<leader>f>', '<cmd>Telescope lsp_outgoing_calls<CR>',
    { noremap = true, desc = 'Telescope find lsp who is calling me' })
vim.keymap.set('n', '<leader>f$', '<cmd>Telescope lsp_document_symbols<CR>',
    { noremap = true, desc = 'Telescope find in document functions, variables, expressions...' })
vim.keymap.set('n', '<leader>f^', '<cmd>Telescope lsp_workspace_symbols<CR>',
    { noremap = true, desc = 'Telescope find in workspace functions, variables, expressions...' })
vim.keymap.set('n', '<leader>fD', '<cmd>Telescope lsp_definitions<CR>',
    { noremap = true, desc = 'Telescope find definition' })
vim.keymap.set('n', '<leader>fI', '<cmd>Telescope lsp_implementations<CR>',
    { noremap = true, desc = 'Telescope find implementation' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope lsp_type_definitions<CR>',
    { noremap = true, desc = 'Telescope find type definition' })
vim.keymap.set('n', '<leader>fv', '<cmd>Telescope treesitter<CR>',
    { noremap = true, desc = 'Telescope find treesitter symbol' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<CR>',
    { noremap = true, desc = 'Telescope find in commits' })
vim.keymap.set('n', '<leader>fT', '<cmd>Telescope git_branches<CR>',
    { noremap = true, desc = 'Telescope find in branches' })
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope luasnip<CR>',
    { noremap = true, desc = 'Telescope find snippet' })
vim.keymap.set('n', '<leader>fS', '<cmd>Telescope git_stash<CR>',
    { noremap = true, desc = 'Telescope find git stash' })
vim.keymap.set('n', '<leader>fB', '<cmd>Telescope git_bcommits<CR>',
    { noremap = true, desc = 'Telescope find current buffer commit history' })
vim.keymap.set('n', '<leader>fz', '<cmd>Telescope spell_suggest<CR>',
    { noremap = true, desc = 'Telescope find spelling suggestions for current word under cursor' })
vim.keymap.set('n', '<leader>f%', '<cmd>Telescope oldfiles<CR>',
    { noremap = true, desc = 'Telescope find recently open files' })
vim.keymap.set('n', '<leader>fF', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    { noremap = true, desc = 'Telescope file browser' })
vim.keymap.set('n', '<leader>fC', "<cmd>Telescope cder<CR>",
    { noremap = true, desc = 'Telescope cd change current directory' })
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { noremap = true, desc = 'Telescope undo' })
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<cr>", { noremap = true, desc = 'Telescope emoji' })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects theme=dropdown<cr>",
    { noremap = true, desc = 'Telescope find project' })
vim.keymap.set("n", "<leader>fH", "<cmd>Telescope highlights<cr>", { noremap = true, desc = 'Telescope highlights' })

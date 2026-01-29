require("codecompanion").setup({
  strategies = {
    chat = { adapter = "ovhcloud" },
    inline = { adapter = "ovhcloud" },
    cmd = { adapter = "ovhcloud" },
  },
  adapters = {
    acp = { show_defaults = false },
    http = {
      opts = { show_defaults = false, show_model_choices = true },
      ovhcloud = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "OPENAI_BASE_URL",        -- envvar
            api_key = "OPENAI_API_KEY",     -- envvar
            chat_url = "/chat/completions",
            models_endpoint = "/models",
          },
          schema = {
            model = {
              default = "code_completion@latest",
            },
          },
        })
      end,
    },
  },
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true
      }
    }
  }
})

-- vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionChat Toggle<CR>',
--   { noremap = true, desc = 'Codecompanion chat toggle' })
-- vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionActions<CR>',
--   { noremap = true, desc = 'Codecompanion actions' })

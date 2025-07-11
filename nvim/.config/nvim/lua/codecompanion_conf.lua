require("codecompanion").setup({
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = os.getenv("LLM_URL"),
          api_key = os.getenv("LLM_TOKEN"),
          chat_url = "/v1/chat/completions",
        },
        headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer " .. os.getenv("LLM_TOKEN"),
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
  },
})

vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionChat Toggle<CR>',
    { noremap = true, desc = 'Codecompanion chat toggle' })
vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionActions<CR>',
    { noremap = true, desc = 'Codecompanion actions' })

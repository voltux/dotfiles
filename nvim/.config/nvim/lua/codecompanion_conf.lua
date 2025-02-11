require("codecompanion").setup({
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://mamba-codestral-7b-v0-1.endpoints.kepler.ai.cloud.ovh.net/api/openai_compat",
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

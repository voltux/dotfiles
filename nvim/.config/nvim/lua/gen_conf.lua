require('gen').setup({
    model = os.getenv("LLM_MODEL"),                                    -- The default model to use.
    host = os.getenv("LLM_HOST"),        -- The host running the Ollama service.
    quit_map = "q",                                                         -- set keymap for close the response window
    retry_map = "<c-r>",                                                    -- set keymap to re-send the current prompt
    command = function(options)
        local body = { model = options.model, stream = true }
        return
            'curl -H "Content-Type: application/json" -H "Authorization: Bearer ' .. os.getenv("LLM_TOKEN") .. '" --no-buffer -X POST https://' .. options.host .. "/api/openai_compat/v1/chat/completions -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    display_mode = "split", -- The display mode. Can be "float" or "split".
    show_prompt = true,     -- Shows the prompt submitted to Ollama.
    show_model = true,      -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = true,   -- Never closes the window automatically.
    debug = false           -- Prints errors and the command which is run.
})

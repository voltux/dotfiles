require('gen').setup({
    model = "mixtral",                                                      -- The default model to use.
    host = "768bd4d3-493b-4641-af3c-3615d41425cc.app.gra.ai.cloud.ovh.net", -- The host running the Ollama service.
    quit_map = "q",                                                         -- set keymap for close the response window
    retry_map = "<c-r>",                                                    -- set keymap to re-send the current prompt
    command = function(options)
        local body = { model = options.model, stream = true }
        return
            'curl -H "Authorization: Bearer VaFJSLUGQ+6XFUHtL4FL4bbah/K0NwGT4pEci4y3B4B4+pAgWTiiU/+BpLpqXpmc" --no-buffer -X POST https://' ..
            options.host .. "/api/chat -d $body"
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

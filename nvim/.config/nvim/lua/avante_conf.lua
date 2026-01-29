require("avante").setup({
    provider = "qianwen",
    providers = {
        qianwen = {
            __inherited_from = 'openai',
            endpoint = "https://oai.endpoints.preprod.ai.cloud.ovh.net/v1",
            model = "Qwen2.5-Coder-32B-Instruct",
            api_key_name = "OPENAI_API_KEY",
        },
        deepseek = {
            __inherited_from = 'openai',
            endpoint = "https://oai.endpoints.preprod.ai.cloud.ovh.net/v1",
            model = "DeepSeek-R1-Distill-Llama-70B",
            api_key_name = "OPENAI_API_KEY",
        },
    },
})

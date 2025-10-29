require("avante").setup({
    provider = "qianwen",
    providers = {
        qianwen = {
            __inherited_from = 'openai',
            endpoint =
            "https://qwen-2-5-coder-32b-instruct.endpoints.kepler.ai.cloud.ovh.net/api/openai_compat/v1/",
            model = "Qwen2.5-Coder-32B-Instruct",
            api_key_name = "LLM_TOKEN",
        },
        deepseek = {
            __inherited_from = 'openai',
            endpoint =
            "https://deepseek-r1-distill-llama-70b.endpoints.kepler.ai.cloud.ovh.net/api/openai_compat/v1/",
            model = "DeepSeek-R1-Distill-Llama-70B",
            api_key_name = "LLM_TOKEN",
        },
    },
})

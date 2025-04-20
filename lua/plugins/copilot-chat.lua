return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        keys = {
            {
                "<leader>aa",
                function()
                    require("CopilotChat").toggle({})
                end,
                mode = "",
                desc = "Toggle copilot chat",
            },
            {
                "<leader>ap",
                function()
                    require("CopilotChat").select_prompt()
                end,
                mode = "",
                desc = "Copilot [P]rompts",
            },
        },
    },
}

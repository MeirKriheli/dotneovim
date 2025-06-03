return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spec = {
            { "<leader>f", group = "Find" },
            { "<leader>b", group = "Buffer" },
            { "<leader>c", group = "Code" },
            { "<leader>g", group = "Git" },
            { "<leader>gh", group = "Git Hunk" },
            { "<leader>gt", group = "Git Toggle" },
            { "<leader>u", group = "Toggle UI elements" },
            { "<leader>a", group = "AI" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}

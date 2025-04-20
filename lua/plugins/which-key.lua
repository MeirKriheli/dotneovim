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
            { "<leader>gh", group = "Git [H]unk" },
            { "<leader>gt", group = "Git [T]oggle" },
            { "<leader>u", group = "Toggle [U]I elements" },
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

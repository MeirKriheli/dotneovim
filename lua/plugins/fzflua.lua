return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "[F]ind [f]iles in Project Directory",
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "[F]ind by [g]repping in Project Directory",
        },
        {
            "<leader>fc",
            function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "[F]ind in Neovim [C]onfiguration",
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").helptags()
            end,
            desc = "[F]ind in [H]elp",
        },
        {
            "<leader>fk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "[F]ind [K]eymaps",
        },
        {
            "<leader>fw",
            function()
                require("fzf-lua").grep_cword()
            end,
            desc = "[F]ind current [W]ord",
        },
        {
            "<leader>fW",
            function()
                require("fzf-lua").grep_cWORD()
            end,
            desc = "[F]ind current [W]ords",
        },
        {
            "<leader>fd",
            function()
                require("fzf-lua").diagnostics_document()
            end,
            desc = "[F]ind [D]iagnostics",
        },
        {
            "<leader>fD",
            function()
                require("fzf-lua").diagnostics_workspace()
            end,
            desc = "[F]ind [D]iagnostics in Workspace",
        },
        {
            "<leader>f.",
            function()
                require("fzf-lua").resume()
            end,
            desc = "[F]ind resume ([.] like recent action)",
        },
        {
            "<leader>fr",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "[F]ind [R]ecent Files",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "[F]ind Existing [B]uffers",
        },
        {
            "<leader>f/",
            function()
                require("fzf-lua").lgrep_curbuf()
            end,
            desc = "[/] Live grep in current buffer",
        },
        {
            "<leader>fz",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "[F]ind in F[z]f-lua builtins",
        },
    },
}

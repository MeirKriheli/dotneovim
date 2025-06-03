return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find files in Project Directory",
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "Find by grepping in Project Directory",
        },
        {
            "<leader>fc",
            function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find in Neovim Configuration",
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").helptags()
            end,
            desc = "Find in Help",
        },
        {
            "<leader>fk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "Find Keymaps",
        },
        {
            "<leader>fw",
            function()
                require("fzf-lua").grep_cword()
            end,
            desc = "Find current Word",
        },
        {
            "<leader>fW",
            function()
                require("fzf-lua").grep_cWORD()
            end,
            desc = "Find current Words",
        },
        {
            "<leader>fd",
            function()
                require("fzf-lua").diagnostics_document()
            end,
            desc = "Find Diagnostics",
        },
        {
            "<leader>fD",
            function()
                require("fzf-lua").diagnostics_workspace()
            end,
            desc = "Find Diagnostics in Workspace",
        },
        {
            "<leader>f.",
            function()
                require("fzf-lua").resume()
            end,
            desc = "Find resume (. like recent action)",
        },
        {
            "<leader>fr",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "Find Recent Files",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "Find Existing Buffers",
        },
        {
            "<leader>f/",
            function()
                require("fzf-lua").lgrep_curbuf()
            end,
            desc = "/ Live grep in current buffer",
        },
        {
            "<leader>fz",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "Find in Fzf-lua builtins",
        },
    },
}

return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        -- Enable the mini.statusline
        require("mini.statusline").setup({
            use_icons = true,
        })

        require("mini.surround").setup({})
        require("mini.comment").setup({})
        require("mini.pairs").setup({})
    end,
}

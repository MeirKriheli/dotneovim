return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        -- Enable the mini.statusline
        require("mini.statusline").setup({
            use_icons = true,
            content = {
                active = function()
                    local MiniStatusline = require("mini.statusline")
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git = MiniStatusline.section_git({ trunc_width = 40 })
                    -- local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    -- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local filename = MiniStatusline.section_filename({ trunc_width = 40 })
                    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location = MiniStatusline.section_location({ trunc_width = 75 })
                    local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
                    local navic = require("nvim-navic").get_location()

                    return MiniStatusline.combine_groups({
                        { hl = mode_hl, strings = { mode } },
                        -- { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
                        { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                        { hl = "MiniStatuslineFilename", strings = { navic } },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { search, location } },
                    })
                end,
            },
        })

        require("mini.surround").setup({})
        require("mini.comment").setup({})
        require("mini.pairs").setup({})
    end,
}

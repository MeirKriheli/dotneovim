--[[

  This plugin provides a status line component that shows the current context of the cursor in a
  tree-like structure. It is useful for navigating large codebases and understanding the current
  context of the code.

  The plugin is lazy-loaded and only activated when the LSP client supports the "textDocument/documentSymbol" method.
  It also has options for customizing the separator, highlighting, depth limit, icons, and lazy update context.

]]

return {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
        vim.g.navic_silence = true
        -- LazyVim.lsp.on_attach(function(client, buffer)
        --     if client.supports_method("textDocument/documentSymbol") then
        --         require("nvim-navic").attach(client, buffer)
        --     end
        -- end)
    end,
    opts = {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        lazy_update_context = true,
        lsp = {
            auto_attach = true,
        },
    },
}

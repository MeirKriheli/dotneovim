return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "python", "rust", "html", "css", "javascript", "typescript" },
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
      })
    end
}

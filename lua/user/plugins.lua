--------------------------------
-- Plugins with packer
--------------------------------


local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- utilities
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Helper plugins
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"
  use "vim-scripts/gnupg.vim"
  use "tpope/vim-unimpaired"

  -- UI plugins
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-tree.lua"
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        window = {
          border = "single"
        },
        plugins = {
          spelling = {
            enabled = true,
          },
        },
      })
    end
  }
  -- colorschemes and appearance
  use "shaunsingh/nord.nvim"
  use 'kyazdani42/nvim-web-devicons'

  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "f3fora/cmp-spell"
  use "saadparwaiz1/cmp_luasnip"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim"
  use "williamboman/nvim-lsp-installer"
  use "ray-x/lsp_signature.nvim"
  use "RRethy/vim-illuminate"
  use "SmiteshP/nvim-gps"
  use "simrat39/symbols-outline.nvim"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  use({ -- Install and configure tree-sitter languages
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Programming
  use "editorconfig/editorconfig-vim"
  use 'echasnovski/mini.nvim'
  use {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

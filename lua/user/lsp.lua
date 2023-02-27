require('lspconfig')

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local wk = require("which-key")
  local wk_opts = {buffer = bufnr}
  wk.register({
    ["<leader>l"] = {
      name = "language server",
      d = { "<cmd>Telescope lsp_definitions<CR>", "Go To Definition"},
      r = { "<cmd>Telescope lsp_references<cr>", "Find References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find in Document Symbols" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find in Workspace Symbols" },
      o = { "<cmd>SymbolsOutline<cr>", "Toggle Symbols Outline" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration"},
      f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions"},
      n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
      e = { "<cmd>Telescope diagnostics<CR>", "Errors (Diagnostics)"},
      k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
      i = { "<cmd>Telescope lsp_implementations()<CR>", "Find Implementation"},
    }
  }, wk_opts)

  wk.register({
    ["<leader>w"] = {
      name = "lsp workspace",
      a = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace folder" },
      r = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
      l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "Print Workspace Folders" },
    }
  }, wk_opts)

  wk.register({
    ["[d"] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Previos Error" },
    ["]d"] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Next Error" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Symobol Information" },
    ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show Error" },
  }, wk_opts)

  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "single"
    }
  }, bufnr)

  -- highlight word under cursor
  require 'illuminate'.on_attach(client)
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    border = "rounded"
  }
})

require("mason-null-ls").setup({
    automatic_setup = true,
})
require("null-ls").setup()

require("mason-lspconfig").setup_handlers({
  function (name)
    local opts = make_config()

    -- load custom lsp server settings
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp_settings." .. name)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    require("lspconfig")[name].setup(opts)
  end
})

require 'mason-null-ls'.setup_handlers()
require("mason-lspconfig").setup()
require("nvim-gps").setup()
require "lsp_signature".setup()
require("symbols-outline").setup()

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

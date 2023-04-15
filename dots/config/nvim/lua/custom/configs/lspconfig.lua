local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "bashls",
  "bufls",
  "clangd",
  "cssls",
  "denols",
  "diagnosticls",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "marksman",
  "nimls",
  "pyright",
  "ruby_ls",
  "ruff_lsp",
  "rust_analyzer",
  -- "lua_ls",
  "taplo",
  "terraformls",
  "tsserver",
  "yamlls",
  "taplo"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

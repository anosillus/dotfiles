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

-- local virtual_env_path = vim.trim(vim.fn.system('poetry config virtualenvs.path'))
-- local virtual_env_dirctory = vim.trim(vim.fn.system('poetry env list'))
--
-- local python_path = 'python'
-- if #vim.split(virtual_env_dirctory, '\n') == 1 then
--   python_path = string.format("%s/%s/bin/python", virtual_env_path, virtual_env_dirctory)
-- end
-- nvim_lsp.pyright.setup{
--   settings = {
--     python = {
--       pythonPath = python_path;
--     }
--   }
-- }
-- lspconfig.pyright.setup{
--   settings = {
--     python = {
--       venvPath = ".",
--       pythonPath = "./.venv/bin/python",
--       analysis = {
--         extraPaths = {"."}
--       }
--     }
--   }
-- }

local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "python",
    "rust",
    --"nim",
    "markdown",
    "markdown_inline",
    "fish",
    "toml",
    "json",
    "yaml",
    "dockerfile",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "luacheck",
    "luaformatter",
    -- "diagnostic-languageserver",
    -- python
    "ruff",
    "ruff-lsp",
    "reorder-python-imports",
    "mypy",
    "black",
    "rstcheck",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- json
    "jq",
    "jsonlint",
    "yamlfmt",
    "yamllint",
    "go-debug-adapter",
    "delve",
    "golangci-lint",
    "goimports",
    "golines",
    "gofumpt",
    "taplo",

    "rust-analyzer",
    "clangd",
    "clang-format",
    "sqlfluff",
    "sql-formatter",
    "shfmt",
    "shellcheck",
    "bash-debug-adapter",
    "hadolint",
    "write-good",
    "textlint",
    "xmlformatter",

    --for dap
    "debugpy",
    "mockdebug",
    "delve",
    "editorconfig-checker ",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M

return {
  "b0o/schemastore.nvim",
  lazy = true,
  config = function()
    -- JSON LSP with schemastore
    vim.lsp.config.jsonls = {
      cmd = { "vscode-json-language-server", "--stdio" },
      filetypes = { "json", "jsonc" },
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }

    -- YAML LSP with schemastore
    vim.lsp.config.yamlls = {
      cmd = { "yaml-language-server", "--stdio" },
      filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
      settings = {
        yaml = {
          schemaStore = { enable = false, url = "" },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    }

    vim.lsp.enable({ "jsonls", "yamlls" })
  end,
}

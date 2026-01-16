local meta_path = "/usr/share/fb-editor-support/nvim"

if vim.fn.isdirectory(meta_path) == 0 then
  return {}
end

return {
  {
    dir = meta_path,
    name = "meta.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        config = function()
          local meta = require("meta")
          local null_ls = require("null-ls")
          null_ls.setup({
            sources = {
              meta.null_ls.diagnostics.arclint,
              meta.null_ls.formatting.arclint,
            },
          })
        end,
      },
    },
    config = function()
      require("meta").setup()

      -- Enable Meta LSP servers
      require("meta.lsp")

      -- Available Meta LSP servers:
      -- "pyre@meta" (Python type checking)
      -- "pyls@meta" (Python language server)
      -- "cppls@meta" (C++)
      -- "rust-analyzer@meta" (Rust)
      -- "gopls@meta" (Go)
      -- "thriftlsp@meta" (Thrift)
      -- "buckls@meta" (Buck build files)
      -- "flow@meta" (JavaScript/TypeScript)
      -- "hack@meta" (Hack)

      local meta_servers = {
        "pyre@meta",
        "pyls@meta",
        "cppls@meta",
        "rust-analyzer@meta",
        "gopls@meta",
        "thriftlsp@meta",
        "buckls@meta",
        "flow@meta",
      }

      for _, server in ipairs(meta_servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}

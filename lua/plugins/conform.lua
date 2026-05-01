return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      sh = { "shfmt" },
      bash = { "shfmt" },
      c = { "clang_format" },
      cc = { "clang_format" },
      cpp = { "clang_format" },
      cxx = { "clang_format" },
      h = { "clang_format" },
      hh = { "clang_format" },
      hpp = { "clang_format" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      less = { "prettierd", "prettier" },
      fish = { "fish_indent" },
      go = { "gofmt", "goimports" },
      html = { "prettierd", "prettier" },
      htmldjango = { "prettierd", "prettier" },
      templ = { "prettierd", "prettier" },
      json = { "jq" },
      jsonc = { "jq" },
      lua = { "stylua" },
      markdown = { "prettierd", "prettier" },
      md = { "prettierd", "prettier" },
      nix = { "nixfmt" },
      python = { "black" },
      rust = { "rustfmt" },
      toml = { "taplo" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      yaml = { "yamlfmt" },
      yml = { "yamlfmt" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return {
        timeout_ms = 1000,
        lsp_format = "fallback",
      }
    end,
    notify_on_error = true,
  },
}

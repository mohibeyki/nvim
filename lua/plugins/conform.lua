-- Add conform plugin
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

-- Setup conform
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    rust = { "rustfmt" },
    go = { "gofmt", "goimports" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    zig = { "zigfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Format keymap
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

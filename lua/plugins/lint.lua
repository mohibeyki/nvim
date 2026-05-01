return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      c = { "cpplint", "clangtidy" },
      cc = { "cpplint", "clangtidy" },
      cpp = { "cpplint", "clangtidy" },
      cxx = { "cpplint", "clangtidy" },
      h = { "cpplint", "clangtidy" },
      hh = { "cpplint", "clangtidy" },
      hpp = { "cpplint", "clangtidy" },
      fish = { "fish" },
      go = { "golangcilint" },
      lua = { "luacheck" },
      markdown = { "markdownlint" },
      md = { "markdownlint" },
      nix = { "statix" },
      python = { "ruff", "pylint" },
      rust = { "clippy" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      yaml = { "yamllint" },
      yml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

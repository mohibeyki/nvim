return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  opts = {
    provider_selector = function(_, filetype, _)
      local lsp_ft = { "rust", "go", "c", "cpp", "zig", "lua", "python" }
      if vim.tbl_contains(lsp_ft, filetype) then
        return { "lsp", "treesitter" }
      end
      return { "treesitter", "indent" }
    end,
  },
  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    { "zp", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
  },
}

return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      before = "",
      keyword = "wide",
      after = "fg",
      pattern = "@?(KEYWORDS)",
    },
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = {
        icon = " ",
        color = "info",
        alt = { "TASK", "TO DO" },
      },
      HACK = {
        icon = " ",
        color = "warning",
      },
      WARN = {
        icon = " ",
        color = "warning",
        alt = { "WARNING", "WARN", "ATTENTION", "ATTN" },
      },
      PERF = {
        icon = " ",
        color = "default",
        alt = { "OPTIMIZE", "PERFORMANCE", "OPTIM" },
      },
      NOTE = {
        icon = " ",
        color = "hint",
        alt = { "INFO", "NOTE", "REVIEW" },
      },
      TEST = {
        icon = " ",
        color = "test",
        alt = { "TESTING", "PASSED", "FAILED" },
      },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
    },
  },
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment",
    },
  },
}

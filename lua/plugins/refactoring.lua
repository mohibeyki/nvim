return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "lewis6991/async.nvim",
  },
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>rb", function() require("refactoring").refactor("Extract Block") end, desc = "Extract Block" },
    { "<leader>rB", function() require("refactoring").refactor("Extract Block To File") end, desc = "Extract Block To File" },
    { "<leader>rf", function() require("refactoring").refactor("Extract Function") end, mode = { "n", "x" }, desc = "Extract Function" },
    { "<leader>rF", function() require("refactoring").refactor("Extract Function To File") end, mode = { "n", "x" }, desc = "Extract Function To File" },
    { "<leader>rv", function() require("refactoring").refactor("Extract Variable") end, mode = { "n", "x" }, desc = "Extract Variable" },
    { "<leader>ri", function() require("refactoring").refactor("Inline Variable") end, mode = { "n", "x" }, desc = "Inline Variable" },
    { "<leader>rp", function() require("refactoring").debug.printf({ below = false }) end, desc = "Debug Print (Below)" },
    { "<leader>rP", function() require("refactoring").debug.printf({ below = true }) end, desc = "Debug Print (Above)" },
    { "<leader>rc", function() require("refactoring").debug.cleanup({}) end, desc = "Cleanup Debug Prints" },
  },
}

return {
  "andythigpen/nvim-coverage",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    auto_reload = true,
    signs = {
      covered = { hl = "CoverageCovered", text = "▎" },
      uncovered = { hl = "CoverageUncovered", text = "▎" },
      partial = { hl = "CoveragePartial", text = "▎" },
    },
    summary = {
      min_coverage = 80,
    },
    lang = {
      rust = {
        coverage_command = "cargo tarpaulin --out Lcov --output-dir /tmp 2>/dev/null",
      },
      go = {
        coverage_command = "go test ./... -coverprofile=/tmp/coverage.out 2>/dev/null",
      },
    },
  },
  keys = {
    { "<leader>tc", "<cmd>Coverage<cr>", desc = "Load Coverage" },
    { "<leader>tC", "<cmd>CoverageHide<cr>", desc = "Hide Coverage" },
    { "<leader>ts", "<cmd>CoverageSummary<cr>", desc = "Coverage Summary" },
    { "<leader>tt", "<cmd>CoverageToggle<cr>", desc = "Toggle Coverage" },
  },
}

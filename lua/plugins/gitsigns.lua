return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged_enable = true,
  },
  keys = {
    -- Navigation
    {
      "]h",
      function()
        if vim.wo.diff then
          return "]c"
        end
        package.loaded.gitsigns.next_hunk()
      end,
      desc = "Next Hunk",
    },
    {
      "[h",
      function()
        if vim.wo.diff then
          return "[c"
        end
        package.loaded.gitsigns.prev_hunk()
      end,
      desc = "Prev Hunk",
    },
    {
      "]H",
      function()
        package.loaded.gitsigns.nav_hunk("last")
      end,
      desc = "Last Hunk",
    },
    {
      "[H",
      function()
        package.loaded.gitsigns.nav_hunk("first")
      end,
      desc = "First Hunk",
    },
    -- Actions
    { "<leader>ghs", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" }, desc = "Stage Hunk" },
    { "<leader>ghr", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" }, desc = "Reset Hunk" },
    {
      "<leader>ghS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "Stage Buffer",
    },
    {
      "<leader>ghR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Buffer",
    },
    {
      "<leader>ghu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Undo Stage Hunk",
    },
    {
      "<leader>ghp",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "Preview Hunk Inline",
    },
    {
      "<leader>ghd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "Diff This",
    },
    {
      "<leader>ghD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "Diff This ~",
    },
    {
      "<leader>ghb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Blame Line",
    },
    {
      "<leader>ghB",
      function()
        require("gitsigns").blame()
      end,
      desc = "Blame Buffer",
    },
  },
}

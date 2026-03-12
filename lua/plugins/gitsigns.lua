return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
  },
  keys = {
    -- Navigation
    {
      "]h",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
      desc = "Next Hunk",
    },
    {
      "[h",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
      desc = "Prev Hunk",
    },
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
      "<leader>ghu",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Undo Stage Hunk",
    },
    {
      "<leader>ghR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Buffer",
    },
    {
      "<leader>ghp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Hunk",
    },
    {
      "<leader>ghb",
      function()
        require("gitsigns").blame()
      end,
      desc = "Blame Line",
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
    -- Text object
    { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "GitSigns Select Hunk" },
  },
}

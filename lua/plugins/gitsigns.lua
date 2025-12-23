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
      "]c",
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
      "[c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
      desc = "Prev Hunk",
    },
    -- Actions
    { "<leader>hs", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" }, desc = "Stage Hunk" },
    { "<leader>hr", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" }, desc = "Reset Hunk" },
    {
      "<leader>hS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "Stage Buffer",
    },
    {
      "<leader>hu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Undo Stage Hunk",
    },
    {
      "<leader>hR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Buffer",
    },
    {
      "<leader>hp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Hunk",
    },
    {
      "<leader>hb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Blame Line",
    },
    {
      "<leader>hd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "Diff This",
    },
    {
      "<leader>hD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "Diff This ~",
    },
    -- Text object
    { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "GitSigns Select Hunk" },
  },
}

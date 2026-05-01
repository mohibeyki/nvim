return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = true,
        jump_labels = true,
      },
      search = {
        enabled = true,
      },
    },
    labels = "asdfghjklqwertyuiopzxcvbnm",
    label = {
      uppercase = false,
    },
  },
  keys = {
    -- Flash jump (remapped from s)
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    -- Flash treesitter selection
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    -- Remote flash
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    -- Treesitter search
    {
      "R",
      mode = { "x", "o" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    -- Substitute moved to gs
    {
      "gs",
      mode = "n",
      "s",
      desc = "Substitute (was s)",
    },
    {
      "gs",
      mode = "x",
      "s",
      desc = "Substitute (was s)",
    },
  },
}

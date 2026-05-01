return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader><tab>", group = "+tabs" },
      {
        "<leader>b",
        group = "+buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
      { "<leader>c", group = "+code" },
      { "<leader>d", group = "+debug" },
      { "<leader>dp", group = "+profiler" },
      { "<leader>f", group = "+file/find" },
      { "<leader>g", group = "+git" },
      { "<leader>gh", group = "+hunks" },
      { "<leader>m", group = "+markdown" },
      { "<leader>n", group = "+notifications" },
      { "<leader>o", group = "+opencode" },
      { "[", group = "+prev" },
      { "]", group = "+next" },
      { "g", group = "+goto" },
      { "gz", group = "+surround" },
      { "<leader>q", group = "+quit/session" },
      { "<leader>r", group = "+refactor" },
      { "<leader>s", group = "+search" },
      { "<leader>u", group = "+ui" },
      {
        "<leader>w",
        group = "+windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      },
      { "<leader>x", group = "+diagnostics/quickfix" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
}

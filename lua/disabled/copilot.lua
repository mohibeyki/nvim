return {

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    lazy_load = false,
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  -- copilot cmp source
  {
    "zbirenbaum/copilot-cmp",
    opts = {},
  },
}

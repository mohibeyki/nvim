return {
  {
    "mrjones2014/opencode.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "Ask OpenCode",
      },
      {
        "<leader>ox",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "Execute OpenCode Action",
      },
      {
        "<leader>ot",
        function()
          require("opencode").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle OpenCode",
      },
      {
        "go",
        function()
          return require("opencode").operator("@this ")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Add Range to OpenCode",
      },
      {
        "goo",
        function()
          return require("opencode").operator("@this ") .. "_"
        end,
        expr = true,
        desc = "Add Line to OpenCode",
      },
    },
  },
}

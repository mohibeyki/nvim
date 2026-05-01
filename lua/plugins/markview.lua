return {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "md" },
  opts = {},
  keys = {
    {
      "<leader>mp",
      function()
        require("markview").actions.toggle()
      end,
      desc = "Toggle Markdown Preview",
    },
  },
}

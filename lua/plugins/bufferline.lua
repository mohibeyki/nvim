return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      close_command = function(n)
        Snacks.bufdelete(n)
      end,
      right_mouse_command = function(n)
        Snacks.bufdelete(n)
      end,
      diagnostics_indicator = function(_, _, diag)
        local icons = {
          Error = " ",
          Warn = " ",
          Info = " ",
          Hint = " ",
        }
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "snacks_layout_box",
        },
      },
    },
  },
  keys = {
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<CR>", desc = "Move Buffer Left" },
    { "]B", "<cmd>BufferLineMoveNext<CR>", desc = "Move Buffer Right" },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    { "<leader>bD", "<cmd>:bd<CR>", desc = "Delete Buffer and Window" },
    { "<leader>bb", "<cmd>e #<CR>", desc = "Switch to Other Buffer" },
    { "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bj", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
  },
}

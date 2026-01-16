return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        style = "icon",
        icon = "▎",
      },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      offsets = {
        {
          filetype = "snacks_layout_box",
          text = "󰙅  File Explorer",
          separator = true,
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      separator_style = "thin",
      always_show_bufferline = true,
    },
  },
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer next" },
    { "<leader>bb", "<cmd>e #<cr>", desc = "Switch to Other Buffer" },
    { "<leader>`", "<cmd>e #<cr>", desc = "Switch to Other Buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
  },
}

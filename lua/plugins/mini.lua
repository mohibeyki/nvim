return {
  -- mini.icons for file icons
  {
    "echasnovski/mini.icons",
    lazy = true,
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- mini.ai for better text objects
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = {
      mappings = {
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",
        goto_left = "g[",
        goto_right = "g]",
      },
    },
  },

  -- mini.surround for surrounding text operations
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn",
      },
    },
  },

  -- mini.bracketed for bracketed keymaps
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    opts = {},
  },

  -- mini.move for moving lines/selections
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {
      mappings = {
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },
    },
  },

  -- mini.visits for tracking visited locations
  {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    opts = {
      store = {
        path = vim.fn.stdpath("data") .. "/mini-visits",
      },
    },
    keys = {
      {
        "<leader>vr",
        function()
          require("mini.visits").list_paths()
        end,
        desc = "Recent Locations (Visits)",
      },
      {
        "<leader>vl",
        function()
          require("mini.visits").list_labels()
        end,
        desc = "Visit Labels",
      },
    },
  },

  -- mini.hipatterns for highlighting patterns
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    config = function()
      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })
    end,
  },
}

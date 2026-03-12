return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "fish",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "protobuf",
        "python",
        "regex",
        "rust",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "zig",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      -- Select textobjects
      local select_maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query)
        end, { desc = query })
      end

      -- Move to next/prev start
      local move_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]a"] = "@parameter.inner",
      }
      for key, query in pairs(move_next_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_start(query)
        end, { desc = "Next " .. query })
      end

      -- Move to next end
      local move_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
      }
      for key, query in pairs(move_next_end) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_end(query)
        end, { desc = "Next " .. query .. " end" })
      end

      -- Move to prev start
      local move_prev_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[a"] = "@parameter.inner",
      }
      for key, query in pairs(move_prev_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_start(query)
        end, { desc = "Prev " .. query })
      end

      -- Move to prev end
      local move_prev_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
      }
      for key, query in pairs(move_prev_end) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_end(query)
        end, { desc = "Prev " .. query .. " end" })
      end

      -- Swap parameters
      vim.keymap.set("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap with next parameter" })
      vim.keymap.set("n", "<leader>A", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap with prev parameter" })
    end,
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
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
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "around function" },
            ["if"] = { query = "@function.inner", desc = "inside function" },
            ["ac"] = { query = "@class.outer", desc = "around class" },
            ["ic"] = { query = "@class.inner", desc = "inside class" },
            ["aa"] = { query = "@parameter.outer", desc = "around parameter" },
            ["ia"] = { query = "@parameter.inner", desc = "inside parameter" },
            ["ai"] = { query = "@conditional.outer", desc = "around conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "inside conditional" },
            ["al"] = { query = "@loop.outer", desc = "around loop" },
            ["il"] = { query = "@loop.inner", desc = "inside loop" },
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function" },
            ["]c"] = { query = "@class.outer", desc = "Next class" },
            ["]a"] = { query = "@parameter.inner", desc = "Next parameter" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Prev function" },
            ["[c"] = { query = "@class.outer", desc = "Prev class" },
            ["[a"] = { query = "@parameter.inner", desc = "Prev parameter" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Prev function end" },
            ["[C"] = { query = "@class.outer", desc = "Prev class end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
          },
          swap_previous = {
            ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with prev parameter" },
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },
}

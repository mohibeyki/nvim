return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    }
  end,
  keys = {
    {
      "<leader>re",
      function()
        vim.cmd.RustLsp("expandMacro")
      end,
      desc = "Expand Macro",
      ft = "rust",
    },
    {
      "<leader>rc",
      function()
        vim.cmd.RustLsp("openCargo")
      end,
      desc = "Open Cargo.toml",
      ft = "rust",
    },
    {
      "<leader>rr",
      function()
        vim.cmd.RustLsp("runnables")
      end,
      desc = "Runnables",
      ft = "rust",
    },
    {
      "<leader>rd",
      function()
        vim.cmd.RustLsp("debuggables")
      end,
      desc = "Debuggables",
      ft = "rust",
    },
    {
      "<leader>rp",
      function()
        vim.cmd.RustLsp("parentModule")
      end,
      desc = "Parent Module",
      ft = "rust",
    },
    {
      "<leader>rj",
      function()
        vim.cmd.RustLsp("joinLines")
      end,
      desc = "Join Lines",
      ft = "rust",
    },
    {
      "<leader>ra",
      function()
        vim.cmd.RustLsp("codeAction")
      end,
      desc = "Code Action (Rust)",
      ft = "rust",
    },
    {
      "J",
      function()
        vim.cmd.RustLsp("joinLines")
      end,
      desc = "Rust Join Lines",
      ft = "rust",
    },
  },
}

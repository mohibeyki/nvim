return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "ministarter",
            "snacks_dashboard",
          },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          -- Root directory
          {
            function()
              local root = Snacks.git.get_root() or vim.fn.getcwd()
              return vim.fn.fnamemodify(root, ":t")
            end,
            color = function()
              return { fg = Snacks.util.color("Constant") }
            end,
          },
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          -- Pretty path
          {
            function()
              local path = vim.fn.expand("%:p")
              if path == "" then
                return ""
              end
              local root = Snacks.git.get_root() or vim.fn.getcwd()
              local relative = vim.fn.fnamemodify(path, ":~:.")
              if relative:sub(1, 1) == "~" then
                relative = vim.fn.fnamemodify(path, ":~")
              end
              return relative
            end,
            symbols = {
              modified = " ",
              readonly = " ",
              unnamed = "",
            },
          },
        },
        lualine_x = {
          -- Snacks profiler status
          {
            function()
              return Snacks.profiler.status()
            end,
            cond = function()
              return Snacks.profiler.status() ~= ""
            end,
          },
          -- noice command status
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Statement") }
            end,
          },
          -- noice mode status (macro recording etc.)
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Constant") }
            end,
          },
          -- DAP status
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = function()
              return { fg = Snacks.util.color("Debug") }
            end,
          },
          -- diff
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          {
            "progress",
            separator = " ",
            padding = { left = 1, right = 0 },
          },
          {
            "location",
            padding = { left = 0, right = 1 },
          },
        },
        lualine_z = {
          {
            function()
              return "  " .. os.date("%R")
            end,
          },
        },
      },
      extensions = {},
    }
  end,
}

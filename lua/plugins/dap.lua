return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      -- Core DAP
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint Condition" },
      { "<leader>dL", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Toggle Log Point" },
      { "<leader>dbc", function() require("dap").clear_breakpoints() end, desc = "Clear All Breakpoints" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      {
        "<leader>da",
        function()
          local dap = require("dap")
          dap.continue({
            before = function(config)
              local args = vim.fn.input("Run args: ")
              config = vim.deepcopy(config)
              config.args = vim.split(args, " ", { trimempty = true })
              return config
            end,
          })
        end,
        desc = "Run with Args",
      },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate Debug Session" },
      { "<leader>dx", function() require("dap").disconnect() end, desc = "Disconnect from Debug Session" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dr", function() require("dap").repl.open() end, desc = "Toggle REPL" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up in Call Stack" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down in Call Stack" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate Expression" },
      { "<leader>dE", function() require("dapui").eval(vim.fn.input("Expression: ")) end, mode = { "n", "v" }, desc = "Evaluate Input Expression" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>dw", function() require("dapui").toggle("widgets") end, desc = "Widgets" },
      { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },

      -- Go
      { "<leader>dgt", function() require("dap-go").debug_test() end, ft = "go", desc = "Debug Go Test" },
      { "<leader>dgl", function() require("dap-go").debug_last_test() end, ft = "go", desc = "Debug Last Go Test" },

      -- Python
      { "<leader>dpm", function() require("dap-python").test_method() end, ft = "python", desc = "Debug Python Test Method" },
      { "<leader>dpc", function() require("dap-python").test_class() end, ft = "python", desc = "Debug Python Test Class" },
      { "<leader>dpS", function() require("dap-python").debug_selection() end, ft = "python", desc = "Debug Python Selection" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- ==========================================================================
      -- Sign definitions
      -- ==========================================================================
      vim.api.nvim_set_hl(0, "DapBreakpoint", { default = true, link = "DiagnosticError" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { default = true, link = "DiagnosticWarn" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { default = true, link = "DiagnosticInfo" })
      vim.api.nvim_set_hl(0, "DapStopped", { default = true, link = "DiagnosticOk" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { default = true, link = "DiagnosticHint" })
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◐", texthl = "DapBreakpointCondition" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint" })
      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DapStopped",
        linehl = "DapStopped",
        numhl = "DapStopped",
      })
      vim.fn.sign_define("DapBreakpointRejected", { text = "✖", texthl = "DapBreakpointRejected" })

      -- ==========================================================================
      -- DAP UI setup
      -- ==========================================================================
      dapui.setup({
        icons = {
          expanded = "▾",
          collapsed = "▸",
          current_frame = "▸",
        },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "⏴",
            run_last = "↻",
            terminate = "⏹",
          },
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.33 },
              { id = "stacks", size = 0.34 },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 10,
          },
        },
      })

      -- Auto open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- dap-virtual-text
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
  },

  -- dap-go
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = true,
  },

  -- dap-python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup(nil, {
        console = "integratedTerminal",
        justMyCode = false,
        subProcess = false,
      })
    end,
  },
}

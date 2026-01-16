return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 2 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    rename = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    -- File/Find operations (<leader>f)
    {
      "<leader><space>",
      function()
        require("snacks").picker.files()
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>ff",
      function()
        require("snacks").picker.files()
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>fF",
      function()
        require("snacks").picker.files({ cwd = vim.fn.getcwd() })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fr",
      function()
        require("snacks").picker.recent()
      end,
      desc = "Recent Files",
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.git_files()
      end,
      desc = "Find Files (git-files)",
    },

    -- Search operations (<leader>s)
    {
      "<leader>/",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep (Root Dir)",
    },
    {
      "<leader>sg",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep (Root Dir)",
    },
    {
      "<leader>sG",
      function()
        require("snacks").picker.grep({ cwd = vim.fn.getcwd() })
      end,
      desc = "Grep (cwd)",
    },
    {
      "<leader>sw",
      function()
        require("snacks").picker.grep_word()
      end,
      desc = "Grep Word (Root Dir)",
    },
    {
      "<leader>sW",
      function()
        require("snacks").picker.grep_word({ cwd = vim.fn.getcwd() })
      end,
      desc = "Grep Word (cwd)",
    },
    {
      "<leader>sb",
      function()
        require("snacks").picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sh",
      function()
        require("snacks").picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sk",
      function()
        require("snacks").picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sc",
      function()
        require("snacks").picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>:",
      function()
        require("snacks").picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        require("snacks").picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        require("snacks").picker.diagnostics({ filter = { buf = 0 } })
      end,
      desc = "Document Diagnostics",
    },
    {
      "<leader>sD",
      function()
        require("snacks").picker.diagnostics()
      end,
      desc = "Workspace Diagnostics",
    },
    {
      "<leader>ss",
      function()
        require("snacks").picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        require("snacks").picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>sR",
      function()
        require("snacks").picker.resume()
      end,
      desc = "Resume Last Picker",
    },
    {
      "<leader>sm",
      function()
        require("snacks").picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sr",
      function()
        require("snacks").picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>\"",
      function()
        require("snacks").picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>sj",
      function()
        require("snacks").picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sq",
      function()
        require("snacks").picker.qflist()
      end,
      desc = "Quickfix List",
    },

    -- Buffer operations (<leader>b)
    {
      "<leader>,",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Buffers",
    },

    -- Git operations (<leader>g)
    {
      "<leader>gg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gb",
      function()
        require("snacks").git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gB",
      function()
        require("snacks").gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gs",
      function()
        require("snacks").picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gl",
      function()
        require("snacks").picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        require("snacks").picker.git_log_line()
      end,
      desc = "Git Log (Line)",
    },
    {
      "<leader>gf",
      function()
        require("snacks").picker.git_log_file()
      end,
      desc = "Git Log (File)",
    },

    -- Explorer (<leader>e)
    {
      "<leader>e",
      function()
        require("snacks").picker.explorer()
      end,
      desc = "Explorer (Root Dir)",
    },
    {
      "<leader>E",
      function()
        require("snacks").picker.explorer({ cwd = vim.fn.getcwd() })
      end,
      desc = "Explorer (cwd)",
    },

    -- Terminal
    {
      "<C-/>",
      function()
        require("snacks").terminal()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    {
      "<leader>ft",
      function()
        require("snacks").terminal()
      end,
      desc = "Terminal (Root Dir)",
    },
    {
      "<leader>fT",
      function()
        require("snacks").terminal({ cwd = vim.fn.getcwd() })
      end,
      desc = "Terminal (cwd)",
    },

    -- UI toggles (<leader>u)
    {
      "<leader>uz",
      function()
        require("snacks").zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>uZ",
      function()
        require("snacks").zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>un",
      function()
        require("snacks").notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>ud",
      function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
      end,
      desc = "Toggle Diagnostics",
    },
    {
      "<leader>uf",
      function()
        vim.g.autoformat = not vim.g.autoformat
        vim.notify("Autoformat " .. (vim.g.autoformat and "enabled" or "disabled"))
      end,
      desc = "Toggle Format on Save",
    },
    {
      "<leader>uL",
      function()
        vim.wo.relativenumber = not vim.wo.relativenumber
      end,
      desc = "Toggle Relative Line Numbers",
    },
    {
      "<leader>us",
      function()
        vim.wo.spell = not vim.wo.spell
      end,
      desc = "Toggle Spelling",
    },
    {
      "<leader>uc",
      function()
        local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
        vim.o.conceallevel = vim.o.conceallevel == 0 and conceallevel or 0
      end,
      desc = "Toggle Conceal",
    },
    {
      "<leader>nh",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Notification History",
    },

    -- New file
    { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },

    -- Quit
    { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All" },
  },
}

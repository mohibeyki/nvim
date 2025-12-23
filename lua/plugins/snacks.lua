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
      "<leader>nh",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Notification History",
    },

    -- Quit
    { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All" },
  },
  init = function()
    -- Open explorer when nvim is started with a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
          vim.cmd("cd " .. vim.fn.fnameescape(arg))
          require("snacks").picker.explorer()
        end
      end,
    })
  end,
}

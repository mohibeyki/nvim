return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = true,
      size = 1.5 * 1024 * 1024, -- 1.5 MB
      line_length = 1000,
    },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          {
            icon = "󱪞 ",
            key = "n",
            desc = "New File",
            action = ":ene | startinsert",
            gap = 1,
            padding = 1,
          },
          {
            icon = "󰱽 ",
            key = "f",
            desc = "Find File",
            action = "<cmd>lua Snacks.picker.files({ hidden = true })<CR>",
            gap = 1,
            padding = 1,
          },
          {
            icon = "󰺮 ",
            key = "g",
            desc = "Find Text",
            action = "<cmd>lua Snacks.picker.grep()<CR>",
            gap = 1,
            padding = 1,
          },
          {
            icon = "󰕁 ",
            title = "Recent Files",
            key = "r",
            action = "<cmd>lua Snacks.picker.recent()<CR>",
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          {
            icon = "󰝰 ",
            title = "Projects",
            key = "p",
            action = "<cmd>lua Snacks.picker.projects()<CR>",
            section = "projects",
            indent = 2,
            padding = 1,
          },
          {
            icon = "󰑓 ",
            key = "s",
            desc = "Restore Session",
            action = ":lua require('persistence').load()",
          },
          {
            icon = "󰒲 ",
            key = "l",
            desc = "Lazy",
            action = ":Lazy",
            gap = 1,
            padding = 1,
          },
          {
            icon = "󰈆 ",
            key = "q",
            desc = "Quit",
            action = ":qa",
            gap = 1,
            padding = 1,
          },
        },
        header = [[

                                                                           
            ████ ██████           █████      ██                      
           ███████████             █████                              
           █████████ ███████████████████ ███   ███████████    
          █████████  ███    █████████████ █████ ██████████████    
         █████████ ██████████ █████████ █████ █████ ████ █████    
       ███████████ ███    ███ █████████ █████ █████ ████ █████   
      ██████  █████████████████████ ████ █████ █████ ████ ██████  

]],
      },
      sections = {
        { section = "header" },
        { section = "keys" },
      },
    },
    indent = { enabled = true },
    scope = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = false },
    scroll = { enabled = true },
    statuscolumn = {
      enabled = true,
      left = { "mark", "sign", "git" },
      right = { "line", "relativenumber" },
    },
    picker = { enabled = true },
    terminal = { enabled = true },
    explorer = { enabled = true },
    words = { enabled = true },
    rename = { enabled = true },
    quickfile = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    bufdelete = { enabled = true },
    image = { enabled = true },
    toggle = {},
    zen = { enabled = true },
    dim = { enabled = true },
    animate = { enabled = true },
  },
  keys = {
    -- Top-level toggles and navigation
    {
      "<leader><space>",
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep (Root Dir)",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>dps",
      function()
        Snacks.profiler.scratch()
      end,
      desc = "Profiler Scratch Buffer",
    },

    -- File/Find (<leader>f)
    {
      "<leader>ff",
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fB",
      function()
        Snacks.picker.buffers({ filter = { hidden = true } })
      end,
      desc = "Buffers (all)",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>fF",
      function()
        Snacks.picker.files({ cwd = vim.fn.expand("%:p:h"), hidden = true })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Files (git-files)",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    {
      "<leader>fR",
      function()
        Snacks.picker.recent({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Recent (cwd)",
    },

    -- Search (<leader>s)
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep (Root Dir)",
    },
    {
      "<leader>sG",
      function()
        Snacks.picker.grep({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Grep (cwd)",
    },
    {
      "<leader>s\"",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics({ filter = { buf = 0 } })
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search Plugin Configs",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undotree",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      mode = { "n", "x" },
      desc = "Visual selection or word (Root Dir)",
    },
    {
      "<leader>sW",
      function()
        Snacks.picker.grep_word({ cwd = vim.fn.expand("%:p:h") })
      end,
      mode = { "n", "x" },
      desc = "Visual selection or word (cwd)",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>st",
      function()
        Snacks.picker.todo()
      end,
      desc = "Todo",
    },
    {
      "<leader>sT",
      function()
        Snacks.picker.todo({ keywords = { "TODO", "FIX", "FIXME" } })
      end,
      desc = "Todo/Fix/Fixme",
    },

    -- Terminal (<leader>f)
    {
      "<leader>ft",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Terminal (Root Dir)",
    },
    {
      "<leader>fT",
      function()
        Snacks.terminal.toggle({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Terminal (cwd)",
    },

    -- Explorer (<leader>e / <leader>f)
    {
      "<leader>e",
      function()
        Snacks.explorer.open({ cwd = Snacks.git.get_root() or vim.fn.getcwd() })
      end,
      desc = "Explorer (root dir)",
    },
    {
      "<leader>E",
      function()
        Snacks.explorer.open()
      end,
      desc = "Explorer (cwd)",
    },
    {
      "<leader>fe",
      function()
        Snacks.explorer.open({ cwd = Snacks.git.get_root() or vim.fn.getcwd() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>fE",
      function()
        Snacks.explorer.open()
      end,
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>fn",
      "<cmd>enew<cr>",
      desc = "New File",
    },

    -- LSP
    {
      "<leader>cl",
      function()
        Snacks.picker.lsp_config()
      end,
      desc = "Lsp Info",
    },
    {
      "<leader>ca",
      function()
        vim.lsp.buf.code_action()
      end,
      mode = { "n", "x" },
      desc = "Code Action",
    },
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      mode = { "n", "x" },
      desc = "Format",
    },
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "x" },
      desc = "Format Injected Langs",
    },

    -- Git (<leader>g)
    {
      "<leader>gg",
      function()
        Snacks.lazygit({ cwd = Snacks.git.get_root() })
      end,
      desc = "Lazygit (Root Dir)",
    },
    {
      "<leader>gG",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit (cwd)",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (hunks)",
    },
    {
      "<leader>gD",
      function()
        Snacks.picker.git_diff({ cwd = Snacks.git.get_root(), diff_base = "origin" })
      end,
      desc = "Git Diff (origin)",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log({ cwd = Snacks.git.get_root() })
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log (cwd)",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Current File History",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      mode = { "n", "x" },
      desc = "Git Browse (open)",
    },
    {
      "<leader>gY",
      function()
        Snacks.gitbrowse({
          open = function(url)
            vim.fn.setreg("+", url)
          end,
          notify = false,
        })
      end,
      mode = { "n", "x" },
      desc = "Git Browse (copy)",
    },
    {
      "<leader>gi",
      function()
        Snacks.picker.github_issues()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.github_issues({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.github_prs()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.github_prs({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },

    -- UI Toggles (<leader>u / <leader>w)
    {
      "<leader>ur",
      "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
      desc = "Redraw / Clear hlsearch / Diff Update",
    },
    {
      "<leader>ui",
      function()
        vim.show_pos()
      end,
      desc = "Inspect Pos",
    },
    {
      "<leader>uI",
      function()
        vim.treesitter.inspect_tree()
        vim.api.nvim_input("I")
      end,
      desc = "Inspect Tree",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },

    -- Smart-splits
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Go to Left Window",
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Go to Lower Window",
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Go to Upper Window",
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Go to Right Window",
    },

    -- Quit
    { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All" },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- ==========================================================================
    -- Snacks toggles (matching nixvim toggle.nix)
    -- ==========================================================================
    Snacks.toggle.profiler():map("<leader>dpp")
    Snacks.toggle.profiler_highlights():map("<leader>dph")

    Snacks.toggle
      .new({
        id = "auto_format_global",
        name = "Auto Format (Global)",
        get = function()
          return not (vim.g.disable_autoformat or false)
        end,
        set = function(state)
          vim.g.disable_autoformat = not state
        end,
      })
      :map("<leader>uf")

    Snacks.toggle
      .new({
        id = "auto_format_buffer",
        name = "Auto Format (Buffer)",
        get = function()
          return not (vim.b.disable_autoformat or false)
        end,
        set = function(state)
          vim.b.disable_autoformat = not state
        end,
      })
      :map("<leader>uF")

    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle
      .option("conceallevel", {
        off = 0,
        on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
        name = "Conceal Level",
      })
      :map("<leader>uc")
    Snacks.toggle
      .option("showtabline", {
        off = 0,
        on = vim.o.showtabline > 0 and vim.o.showtabline or 2,
        name = "Tabline",
      })
      :map("<leader>uA")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    Snacks.toggle.dim():map("<leader>uD")
    Snacks.toggle.animate():map("<leader>ua")
    Snacks.toggle.indent():map("<leader>ug")
    Snacks.toggle.scroll():map("<leader>uS")
    if vim.lsp.inlay_hint then
      Snacks.toggle.inlay_hints():map("<leader>uh")
    end
    Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
    Snacks.toggle.zen():map("<leader>uz")
  end,
}

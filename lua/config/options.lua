-- Leader keys (must be set before plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- Diagnostic Configuration (vim.diagnostic)
-- ============================================================================
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  virtual_text = true,
  signs = true,
  underline = true,
})

-- ============================================================================
-- Core Vim Options (vim.opt)
-- ============================================================================

-- Display
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both" -- highlight both line and line number
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cmdheight = 1 -- noice handles cmdline UI
vim.opt.showmode = false -- lualine shows mode
vim.opt.showtabline = 2 -- always show tabline for bufferline

-- Indentation & Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Text & Wrap
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.scrolloff = 8

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.inccommand = "split"
vim.opt.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- Window Management
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Input & Timing
vim.opt.mouse = "a"
vim.opt.updatetime = 200 -- faster completion
vim.opt.timeoutlen = 300 -- which-key timeout

-- Persistence
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.autoread = true

-- Misc
vim.opt.colorcolumn = "80"

-- Whitespace visualization
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  extends = "›",
  precedes = "‹",
}

-- Fill characters
vim.opt.fillchars = {
  diff = "╱",
  eob = " ",
}

-- Window title
vim.opt.title = true
vim.opt.titlestring = "%t - NVIM"

-- Command-line completion
vim.opt.wildmode = "longest:full,full"

-- Completion menu
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Leader key global
vim.g.mapleader = " "

-- ============================================================================
-- Centralized undo files + auto-clean stale undo files on exit
-- ============================================================================
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo//"
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undo", "p")

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local undodir = vim.fn.stdpath("data") .. "/undo"
    local handle = vim.uv.fs_scandir(undodir)
    if not handle then
      return
    end
    repeat
      local name, _ = vim.uv.fs_scandir_next(handle)
      if not name then
        break
      end
      -- Vim encodes path separators as %, decode back
      local path = name:gsub("%%", "/"):sub(2)
      if not vim.uv.fs_stat(path) then
        vim.uv.fs_unlink(undodir .. "/" .. name)
      end
    until not name
  end,
})

-- ============================================================================
-- Global Keymaps (from nixvim modules/keys.nix)
-- ============================================================================

-- Better up/down (wrapped lines)
vim.keymap.set({ "n", "x" }, "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down" })
vim.keymap.set({ "n", "x" }, "<Down>", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down" })
vim.keymap.set({ "n", "x" }, "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up" })
vim.keymap.set({ "n", "x" }, "<Up>", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up" })

-- Escape: clear hlsearch + stop snippet
vim.keymap.set({ "i", "n", "s" }, "<Esc>", function()
  vim.cmd("noh")
  if vim.snippet and vim.snippet.active and vim.snippet.active({ direction = 1 }) then
    pcall(vim.snippet.stop)
  end
  return "<Esc>"
end, { expr = true, silent = true, desc = "Escape and Clear hlsearch" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File", silent = true })

-- Better n/N (wrap-aware, reveals folds)
vim.keymap.set({ "n", "x", "o" }, "n", function()
  local c = ({ "N", "n" })[vim.v.searchforward + 1]
  return c .. (vim.fn.mode() == "n" and "zv" or "")
end, { expr = true, silent = true, desc = "Next Search Result" })
vim.keymap.set({ "n", "x", "o" }, "N", function()
  local c = ({ "n", "N" })[vim.v.searchforward + 1]
  return c .. (vim.fn.mode() == "n" and "zv" or "")
end, { expr = true, silent = true, desc = "Prev Search Result" })

-- Punctuation undo break points in insert mode
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Indent keeps selection in visual mode
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Add comment below/above
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Diagnostic jumps
vim.keymap.set("n", "]e", function()
  vim.diagnostic.jump({ count = vim.v.count1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = "Next Error" })
vim.keymap.set("n", "[e", function()
  vim.diagnostic.jump({ count = -vim.v.count1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = "Prev Error" })
vim.keymap.set("n", "]w", function()
  vim.diagnostic.jump({ count = vim.v.count1, severity = vim.diagnostic.severity.WARN, float = true })
end, { desc = "Next Warning" })
vim.keymap.set("n", "[w", function()
  vim.diagnostic.jump({ count = -vim.v.count1, severity = vim.diagnostic.severity.WARN, float = true })
end, { desc = "Prev Warning" })

-- Window splits
vim.keymap.set("n", "<leader>-", "<C-W>s", { silent = true, desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { silent = true, desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { silent = true, desc = "Delete Window", remap = true })

-- Tab management
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Keywordprg
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- Location/Quickfix lists
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Buffer navigation
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Terminal escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- Close quickfix/location list or window
vim.keymap.set("n", "<C-q>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.bo[buf].buftype
    if buftype == "quickfix" then
      vim.api.nvim_win_close(win, false)
      return
    end
  end
  vim.cmd("close")
end, { desc = "Close Quickfix or Window" })

-- ============================================================================
-- Autocommands (from nixvim modules/autocommands.nix)
-- ============================================================================

-- Open help in a vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Enable spellcheck for tex and markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "markdown" },
  command = "setlocal spell spelllang=en",
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

-- Highlight yanked region briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

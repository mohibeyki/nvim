-- Add snacks plugin
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

-- Setup snacks.nvim
local snacks = require("snacks")
snacks.setup({
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 2 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
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
})

-- Snacks keymaps
vim.keymap.set("n", "<leader>ff", function()
  snacks.picker.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
  snacks.picker.grep()
end, { desc = "Find in files (grep)" })
vim.keymap.set("n", "<leader>fb", function()
  snacks.picker.buffers()
end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", function()
  snacks.picker.help()
end, { desc = "Find help" })
vim.keymap.set("n", "<leader>fr", function()
  snacks.picker.recent()
end, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fc", function()
  snacks.picker.grep_word()
end, { desc = "Find word under cursor" })
vim.keymap.set("n", "<leader>:", function()
  snacks.picker.command_history()
end, { desc = "Command history" })
vim.keymap.set("n", "<leader>gg", function()
  snacks.lazygit()
end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gb", function()
  snacks.git.blame_line()
end, { desc = "Git blame line" })
vim.keymap.set("n", "<leader>gB", function()
  snacks.gitbrowse()
end, { desc = "Git browse" })
vim.keymap.set("n", "<leader>e", function()
  snacks.picker.explorer()
end, { desc = "Explorer" })
vim.keymap.set("n", "<leader>z", function()
  snacks.zen()
end, { desc = "Zen mode" })
vim.keymap.set({ "n", "t" }, "<C-/>", function()
  snacks.terminal()
end, { desc = "Toggle terminal" })

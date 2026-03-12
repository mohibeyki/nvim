return {
  "RRethy/vim-illuminate",
  event = "BufReadPost",
  opts = {
    delay = 300,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "treesitter" },
    },
    filetypes_denylist = {
      "dirbuf",
      "dirvish",
      "fugitive",
      "snacks_dashboard",
      "snacks_picker",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
    vim.keymap.set("n", "]]", function()
      require("illuminate").goto_next_reference()
    end, { desc = "Next reference" })
    vim.keymap.set("n", "[[", function()
      require("illuminate").goto_prev_reference()
    end, { desc = "Prev reference" })
  end,
}

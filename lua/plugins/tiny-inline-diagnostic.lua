return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  opts = {
    preset = "modern",
    options = {
      show_source = true,
      multilines = {
        enabled = true,
        always_show = false,
      },
      show_all_diags_on_cursorline = true,
      enable_on_insert = false,
    },
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)
    -- disable built-in rendering since this plugin handles it
    vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
  end,
}

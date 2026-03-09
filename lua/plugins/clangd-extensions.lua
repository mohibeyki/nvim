return {
  "p00f/clangd_extensions.nvim",
  ft = { "c", "cpp", "objc", "objcpp" },
  opts = {
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        statement = "",
        specifier = "",
        ["template argument"] = "",
      },
      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },
    },
    memory_usage = {
      border = "rounded",
    },
    symbol_info = {
      border = "rounded",
    },
  },
  keys = {
    { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" },
    { "<leader>ct", "<cmd>ClangdTypeHierarchy<cr>", desc = "Type Hierarchy" },
    { "<leader>cm", "<cmd>ClangdMemoryUsage<cr>", desc = "Memory Layout" },
    { "<leader>cA", "<cmd>ClangdAST<cr>", desc = "AST View" },
  },
}

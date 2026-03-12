return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  main = "project_nvim",
  opts = {
    detection_methods = { "pattern", "lsp" },
    patterns = {
      ".git",
      "Cargo.toml",
      "go.mod",
      "pyproject.toml",
      "package.json",
      "Makefile",
      "CMakeLists.txt",
      "build.zig",
    },
    silent_chdir = true,
    scope_chdir = "global",
  },
}

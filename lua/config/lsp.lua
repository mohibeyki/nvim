-- Native LSP configuration (0.12)
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- C++
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}

-- Rust
vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        bindingModeHints = { enable = true },
        closingBraceHints = { enable = true, minLines = 10 },
        closureReturnTypeHints = { enable = "with_block" },
        lifetimeElisionHints = { enable = "skip_trivial", useParameterNames = true },
        reborrowHints = { enable = "always" },
        typeHints = { enable = true },
        parameterHints = { enable = true },
        maxLength = 25,
      },
    },
  },
}

-- Go
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

-- Zig
vim.lsp.config.zls = {
  cmd = { "zls" },
  filetypes = { "zig" },
}

-- Diagnostics
vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false,
})

-- Enable LSP servers
vim.lsp.enable({ "clangd", "gopls", "zls" })

-- LSP keymaps (set on LspAttach)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "rust_analyzer" then
      if vim.lsp.inlay_hint then
        if type(vim.lsp.inlay_hint) == "function" then
          vim.lsp.inlay_hint(buf, true)
        elseif vim.lsp.inlay_hint.enable then
          vim.lsp.inlay_hint.enable(true, { bufnr = buf })
        end
      end
    end
    -- Goto
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Goto Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = buf, desc = "References" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = buf, desc = "Goto Implementation" })
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = buf, desc = "Goto Type Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "Goto Declaration" })

    -- Hover
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover" })
    vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature Help" })
    vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature Help" })

    -- Code actions
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code Action" })
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, desc = "Rename" })

    -- Inlay hints
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
      vim.keymap.set("n", "<leader>uh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
      end, { buffer = buf, desc = "Toggle Inlay Hints" })
    end
  end,
})

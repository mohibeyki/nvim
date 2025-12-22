-- Native LSP configuration (0.12)
vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- C++
vim.lsp.config.clangd = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}

-- Rust
vim.lsp.config.rust_analyzer = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
}

-- Zig
vim.lsp.config.zls = {
  cmd = { 'zls' },
  filetypes = { 'zig' },
}

-- Go
vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
}

-- Enable LSP servers
vim.lsp.enable({ 'clangd', 'rust_analyzer', 'zls', 'gopls' })

-- LSP keymaps (set on LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

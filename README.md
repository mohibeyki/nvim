# Minimal Neovim 0.12 Config

Extremely minimal Neovim configuration using native 0.12 features.

## Features

- Native package manager (`vim.pack`)
- Native LSP configuration (`vim.lsp.config`)
- LSP support for C++, Rust, Zig, and Go
- mini.ai for enhanced text objects

## Requirements

- Neovim 0.12+
- LSP servers (install separately):
  - `clangd` (C++)
  - `rust-analyzer` (Rust)
  - `zls` (Zig)
  - `gopls` (Go)

## Installation

Plugins install automatically on first launch. Neovim will prompt you to install them.

## LSP Keymaps

- `gd` - Go to definition
- `K` - Hover documentation
- `gr` - Find references
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action

## Installing LSP Servers

```bash
# macOS/Linux
brew install llvm          # clangd
brew install rust-analyzer
brew install zig           # includes zls
brew install gopls
```

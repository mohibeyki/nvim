# Minimal Neovim 0.12 Config

Extremely minimal Neovim configuration using some of native 0.12 features.

## Features

- Lazy package manager (`lazy.nvim`)
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


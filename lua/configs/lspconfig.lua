require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd" }
vim.lsp.enable(servers)
vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp', 'h'},
  capabilities = {
    offsetEncoding = { 'utf-16'},
  }
}

-- read :h vim.lsp.config for changing options of lsp servers 

require("nvchad.configs.lspconfig").defaults()

local servers = {
  lua_ls = {},
  html = {},
  cssls = {},
  ts_ls = {},
  eslint = {},
  csharp_ls = {},
  bashls = {},
  ansiblels = {}
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

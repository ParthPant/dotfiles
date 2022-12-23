local lspconfig = require('lspconfig')
local mason_config = require('mason-lspconfig')
local lsp_defaults = lspconfig.util.default_config

require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

-- Servers
mason_config.setup({
	ensure_installed = { 'sumneko_lua', 'rust_analyzer', 'clangd', 'dockerls', 'eslint'}
})

lspconfig['metals'].setup({})
lspconfig['sumneko_lua'].setup({})
lspconfig['hls'].setup({})

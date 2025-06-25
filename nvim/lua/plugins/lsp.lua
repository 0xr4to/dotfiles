require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'pyright','clangd'}
})

local on_attach = function(_, bufnr)
  vim.keymap.set('n', '<Space>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<Space>ca', vim.lsp.buf.rename, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configuração para o servidor LSP de Lua (lua_ls)
require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Configuração para o servidor LSP de Pyton (pyright)
require('lspconfig').pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Configuração para o servidor LSP de C (clangd)
require('lspconfig').clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Configuração para o servidor LSP de Java()
require('lspconfig').java_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Configuração para o servidor LSP de Java()
require('lspconfig').cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

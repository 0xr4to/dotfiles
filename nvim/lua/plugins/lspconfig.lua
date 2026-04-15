-- plugins/lspconfig.lua
local lspconfig = require("lspconfig")

-- Capabilities (para autocompletion funcionar)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Keybinds que aparecem quando LSP está ativo
local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    
    -- Exemplos de keybinds úteis
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)          -- Go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                -- Hover info
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- Rename
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)          -- Find references
end

-- Configuração de cada LSP
-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }  -- Reconhece 'vim' como global
            }
        }
    }
})

-- C/C++
lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Bash
lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

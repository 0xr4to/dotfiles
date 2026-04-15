require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
--        "bashls",
        "clangd",
    },
    automatic_installation = true,
})

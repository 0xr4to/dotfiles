require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

require("mason-lspconfig").setup({
    function(server_name)
        require("lspconfig")[server_name].setup({})
    end
})

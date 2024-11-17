require("mason-lspconfig").setup({
    ensure_installed = {
		"lua_ls",
		"pylsp",
		"glslls",
	}
})

require("mason-lspconfig").setup_handlers({
    function(server) require("lspconfig")[server].setup({}) end
})

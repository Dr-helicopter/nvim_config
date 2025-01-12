require("nvim-treesitter.configs").setup({
	auto_install = false,
	sync_install = true,
	ensure_installed = { "lua", "python", 'gdscript'},
	indent = { enable = true },

	highlight = {
		enable = true,
		disable = { "c", "rust" },
		additional_vim_regex_highlighting = true,
	},
})


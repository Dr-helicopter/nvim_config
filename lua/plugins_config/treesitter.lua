local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
	auto_install = true,
	sync_install = true,
	ensure_installed = {
		'lua',
		'python',
		'gdscript',
		'gdshader',
		'godot_resource',
		'lua',
	},
	indent = { enable = true },

	highlight = {
		enable = true,
		disable = { 'c', 'rust' },
		additional_vim_regex_highlighting = true,
	},
}


local treesitter = require('nvim-treesitter')

treesitter.setup {
	auto_install = true,
	sync_install = true,
	ignore_install = {},
	ensure_installed = {
		'lua',
		'python',
		'gdscript',
		'gdshader',
		'godot_resource',
		'lua',
		'bash',
	},
	indent = {
		enable = true,
		disable = { "gdscript"}
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}


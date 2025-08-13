local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
	auto_install = true,
	sync_install = true,
  ignore_install = { "javascript" },
	ensure_installed = {
		'lua',
		'python',
		'gdscript',
		'gdshader',
		'godot_resource',
		'lua',
	},
	indent = {
		enable = true,
		disable = { "gdscript"}
	},
	modules = {},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}


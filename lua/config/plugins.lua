return {
    { "ojroques/vim-oscyank" }, --for copy & paste
	{        -- VVV for cmdline costomizetion VVV --
		"folke/noice.nvim", requires = { "MunifTanjim/nui.nvim" },
		config = function() require("plugins_config.noice") end,
	},
	{
		'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('plugins_config.lualine') end,
	},
	{  -- VVV for LSPs VVV --
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		config = function() require("plugins_config.mason") end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function() require("plugins_config.mason-lspconfig") end,
	},
	{ "tikhomirov/vim-glsl" },
	{
		"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end,
	},
}


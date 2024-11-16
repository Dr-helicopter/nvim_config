return {
    { "ojroques/vim-oscyank" }, --for copy & paste
	{        -- VVV for cmdline costomizetion VVV --
		"folke/noice.nvim", requires = { "MunifTanjim/nui.nvim" }, 
		config = function() require("plugins_config.noice") end,
	},
	{ 	-- VVV for LSPs VVV --
		"williamboman/mason.nvim", 
		config = function() require("plugins_config.mason") end,
	},
	{ "tikhomirov/vim-glsl" },
	{ 
		"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end, 
	},
}


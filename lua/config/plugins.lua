-- plugins table
return {
	{ -- just the theme
		'akinsho/horizon.nvim',
	},


	{ -- treesitter
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function() require('plugins_config.treesitter') end,
	},
	{ -- lualine
		'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('plugins_config.lualine') end,
	},
	{ -- tabby
		'nanozuki/tabby.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('plugins_config.tabby') end,
	},
	{ -- noice
		'folke/noice.nvim', requires = { 'MunifTanjim/uni.nvim' },
		config = function() require('plugins_config.noice') end,
	},
	{ -- cmp
		'hrsh7th/nvim-cmp',
    	event = 'InsertEnter',
    		dependencies = {
      			{
					-- snippet plugin
					'L3MON4D3/LuaSnip',
					dependencies = 'rafamadriz/friendly-snippets',
					opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
					config = function(_, opts)
					require('luasnip').config.set_config(opts)
					end,
				},

            -- cmp sources plugins
			{
				'saadparwaiz1/cmp_luasnip',
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
			},
		},
		config = function() return require('plugins_config.cmp') end,
  	},

  	-- LSPs --
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'L3MON4D3/LuaSnip',
			'j-hui/fidget.nvim',
		},
	},
	{
		'williamboman/mason.nvim',
		config = function() require('plugins_config.mason') end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {'williamboman/mason.nvim'},
		config = function() require('plugins_config.mason-lspconfig') end,
	},
	-- lsps end --



	{ -- autopairs
		'windwp/nvim-autopairs',
		config = function() require 'plugins_config.autopairs' end
	},
	{
		'goolord/alpha-nvim',
		config = function() require 'plugins_config.alpha' end,
	},
	{
  "apyra/nvim-unity-sync",
  config = function()
    require("unity.plugin").setup({
 unity_path = "path/to/unity/Unity.exe", -- Optional, to run the :Uopen command
  unity_cs_template = false --Optional, used to insert the unity MonoBehaviour template in new .cs files
})
  end,
  ft = "cs",
}
}

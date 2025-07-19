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
	{ -- nvim tree
		'nvim-tree/nvim-tree.lua',  dependencies = { 'nvim-tree/nvim-web-devicons' },
		  config = function() require('plugins_config.nvim-tree') end,
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
        opts = {
			fast_wrap = {},
        	disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        config = function(_, opts)
        	require('nvim-autopairs').setup(opts)

          	-- setup cmp for autopairs
          	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          	require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,

	},
	{
		"habamax/vim-godot",
		ft = "gdscript",
	}
}

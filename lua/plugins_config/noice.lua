-- noice UI settings --

local noice = require("noice")
noice.setup({
    enabled = true,
    view = 'cmdline_popup',


	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- filterimg the lsp loading messege
	routes = {
		{
			filter = {
			event = "lsp",
			kind = "progress",
			find = "workspace",
		},
		opts = { skip = true },
	},}
})

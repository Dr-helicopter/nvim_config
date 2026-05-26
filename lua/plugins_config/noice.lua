local tty = require 'tty.tty_settings'
local opts = {
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
		format = {
			lua = { title = " Cmdline "},
		},
	},

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
}

local function merge_tables(base, extra)
  for k, v in pairs(extra) do
    base[k] = v
  end
  return base
end


if tty.is_tty() then
	merge_tables(opts, tty.get_noice())
end




local noice = require("noice")
noice.setup(opts)

local theme = {
	fill = 'TabLine',
	head = { fg='#3D4A51', bg='#3D4A51', style='italic' },
	current_tab = { fg='#3D4A51', bg='#A4BDCB', style='italic' },
	tab = { fg='#A4BDCB', bg='#46555D', style='italic' },
	win = 'TabLine',
	tail = 'TabLine',
}

local function to_bin(n) return n==0 and"0"or to_bin(math.floor(n/2))..(n%2) end


require('tabby').setup {
	line = function(line) return {
		{
			{ '  ', hl = { fg = '#7FBBB3', bg = '#414B50' } },
			line.sep('', theme.head, theme.fill),
		},
		line.tabs().foreach(function(tab)
			local hl = tab.is_current() and theme.current_tab or theme.tab

			-- remove count of wins in tab with [n+] included in tab.name()
			local name = tab.name()
			local index = string.find(name, "%[%d")
			local tab_name = index and string.sub(name, 1, index - 1) or name

			-- indicate if any of buffers in tab have unsaved changes
			local modified = false
			local win_ids = require('tabby.module.api').get_tab_wins(tab.id)
			for _, win_id in ipairs(win_ids) do
				if pcall(vim.api.nvim_win_get_buf, win_id) then
					local bufid = vim.api.nvim_win_get_buf(win_id)
					if vim.api.nvim_buf_get_option(bufid, "modified") then
						modified = true
						break
					end
				end
			end

			return {
				line.sep('', hl, theme.fill),
				to_bin(tab.number()),
				tab_name,
				modified and '',
				tab.close_btn(''),
				line.sep('', hl, theme.fill),
				hl = hl,
				margin = ' ',
			}
		end),
		line.spacer(),
		{
			line.sep('', theme.tail, theme.fill),
			{ '  ', hl = theme.tail },
		},
		hl = theme.fill,
	} end,
}

return {
	views = {
		cmdline_popup = {
			border = {
				style = {
					top_left = "┌",
					top = "─",
					top_right = "┐",
					right = "│",
					bottom_right = "┘",
					bottom = "─",
					bottom_left = "└",
					left = "│",
				},
				padding = {0, 1},
			},
			win_options = {
				winhighlight = {
					Normal = "NoiceCmdlinePopup",
					FloatBorder = "NoiceCmdlinePopupBorder",
				},
			},
		},
	},
	cmdline = {
		format = {
			cmdline = { icon = ">" },
			search_down = { icon = "?↓" },
			search_up = { icon = "?↑" },
			lua = { icon = "Lua >" , title = " Cmdline "},
		},
	},
}

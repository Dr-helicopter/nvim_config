-- noice UI settings --

local noice = require("noice")
noice.setup({
    enabled = true,
    view = 'cmdline_popup',        
    cmdline = {
		format = {
			cmdline = { pattern = "^:", icon = ":>", lang = "vim" },
        },
    },
})


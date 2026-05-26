_G.lin_or_win = function(linux_choice, windows_choice)
	local os_name = vim.loop.os_uname().sysname
	if os_name == "Linux" then return linux_choice
	else return windows_choice end
end

-- tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smartindent = true


-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = 'yes:4'



-- transparency
vim.cmd([[
	hi Normal guibg=NONE ctermbg=NONE
	hi NonText guibg=NONE ctermbg=NONE
]])


-- loading lazy
require('config.lazy')



-- Python settings
vim.api.nvim_create_autocmd('FileType', {
    pattern = "python",
    callback = function()
        vim.opt_local.expandtab = false
		vim.o.smartindent = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})


-- code folding
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99



-- keymaping
require('keymaps')

-- godot support
require('godot_support')

require 'theme'


vim.api.nvim_create_autocmd("FileType", {
    pattern = "gdscript",
    callback = function()
        vim.bo.autoindent = true
        vim.bo.smartindent = true
    end,
})

local open_fff = require("fff").start

vim.api.nvim_create_user_command("Ex", function() open_fff() end, {})
vim.api.nvim_create_user_command("Explore", function() open_fff() end, {})
vim.api.nvim_create_user_command("Sexplore", function() open_fff() end, {})
vim.api.nvim_create_user_command("Vexplore", function() open_fff() end, {})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
			vim.cmd("bd")        -- close the empty buffer
			open_fff()           -- your function here
		end
	end
})

require('tty.tty_settings').apply()

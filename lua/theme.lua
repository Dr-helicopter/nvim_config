-- syntax highligting
vim.cmd("syntax on")
vim.cmd.colorscheme('horizon')
vim.o.background = "dark"


vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { ctermfg=6, fg = "#63BABF" })
vim.api.nvim_set_hl(0, "string", {ctermfg=5, fg="#C29DFF"})

vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
	pattern = "*",
	callback = function()
		-- define the highlight groups first
		vim.api.nvim_set_hl(0, "MySingle", {ctermfg=13, fg="#C29DFF"})
		vim.api.nvim_set_hl(0, "MyDouble", {ctermfg=5, fg="#957FB8"})

		-- apply the syntax matches
		vim.cmd([[syntax match MySingle /'[^']*'/]])
		vim.cmd([[syntax match MyDouble /"[^"]*"/]])
	end
})

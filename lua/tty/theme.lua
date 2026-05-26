-- syntax highligting
vim.cmd("syntax on")
vim.o.background = "dark"


vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { ctermfg = "Yellow" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderLua", { ctermfg = "Cyan" })

vim.api.nvim_set_hl(0, "NoiceCmdlineIconCmdline", { ctermfg = "LightBlue" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { ctermfg = "DarkYellow" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIconLua", { ctermfg = "DarkCyan" })
vim.api.nvim_set_hl(0, "string", {ctermfg=5, fg="#C29DFF"})
vim.api.nvim_set_hl(0, "type", { ctermfg=3 })
vim.api.nvim_set_hl(0, "Special", { ctermfg=8 })
vim.api.nvim_set_hl(0, "Function", { ctermfg="Darkgreen" })

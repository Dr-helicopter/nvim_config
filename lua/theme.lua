-- syntax highligting
vim.cmd("syntax on")
vim.cmd.colorscheme('horizon')
vim.o.background = "dark"
vim.o.termguicolors = false


vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { ctermfg=6})
vim.api.nvim_set_hl(0, "string", {ctermfg=5, fg="NONE"})
vim.api.nvim_set_hl(0, "comment", {ctermfg=8, fg="NONE"})
vim.api.nvim_set_hl(0, "function_call", {ctermfg=3, fg="NONE"})
vim.api.nvim_set_hl(0, "Variable", {ctermfg=1, fg="NONE"})
vim.api.nvim_set_hl(0, "Function", {ctermfg=12, fg="NONE"})
vim.api.nvim_set_hl(0, "Conditional", {ctermfg=4, fg="NONE"})
vim.api.nvim_set_hl(0, "Delimiter", {ctermfg=7, fg="NONE"})
vim.api.nvim_set_hl(0, "LineNr", {ctermfg=8, fg="NONE"})

vim.api.nvim_set_hl(0, "Number", {ctermfg=3, fg="NONE"})
vim.api.nvim_set_hl(0, "Constant", {ctermfg=3, fg="NONE"})

vim.api.nvim_set_hl(0, "shFunctionExpr", {ctermfg=10, fg="NONE"})
vim.api.nvim_set_hl(0, "shOperator", {ctermfg=10, fg="NONE"})


vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })


vim.api.nvim_set_hl(0, "DiagnosticWarn", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticSignWarning", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NvimTreeLspDiagnosticsWarning", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyWARNIcon", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { ctermfg = 3 })


vim.api.nvim_set_hl(0, "Visual", { ctermbg = 0, ctermfg = "NONE", bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "Search", { ctermbg = 0, ctermfg = "NONE", bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "Substitute", { ctermbg = 0, ctermfg = "NONE", bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "CurSearch", { ctermbg = 0, ctermfg = 1, bg = "NONE", fg = "NONE" })

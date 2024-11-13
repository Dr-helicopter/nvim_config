-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:6"

-- Load lazy.nvim configuration
require("config.lazy")



-- Load Noice configuration for command line padding
local noice = require('config.noice')

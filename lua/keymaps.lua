local opts = { noremap = true, nowait = true, silent = true }
local map = vim.keymap.set



-- Map Ctrl+C to yank (copy)
vim.api.nvim_set_keymap('n', "<C-c>", '"+y', opts)
vim.api.nvim_set_keymap('v', "<C-c>", '"+y',  opts)


-- Map Ctrl+V to paste
vim.api.nvim_set_keymap('n', "<C-v>", '"+p', opts)
vim.api.nvim_set_keymap('i', "<C-v>", "<C-r>+", opts)



-- visual mode remap
map('v', 'a', "<Nop>", opts)
map('v', "zw", "aw", opts)
map('v', "zp", "ap", opts)

map('v', 'X', '"_di', opts)
map('v', 'x', 'd', opts) -- this changes nothing actuly



--normal mode remap
map('n', 'e', 'd', opts)
map('n', 'ee', 'dd', opts)
map('n', 'S', 'i', opts)
map('n', 'W', 'a', opts)
map('n', 'i', 's', opts)



--insertmode remap 
map({'i', 'n'}, "<C-z>", "<Esc>", opts)



-- glbal remap
map('', 'w', "<Up>", opts)
map('', 's', "<Down>", opts)
map('', 'a', "<Left>", opts)
map('', 'd', "<Right>", opts)

map('', 'D', 'e', opts)
map('', 'A', 'b', opts)



-- normal mode z remaps
map('n', 'QQ', 'ZZ', opts)
map('n', 'QZ', 'ZQ', opts)
map('n', 'Qt', 'Zt', opts)
map('n', 'Qb', 'Zb', opts)
map('n', 'QO', 'ZO', opts)
map('n', 'QC', 'ZC', opts)
map('n', 'Qa', 'Za', opts)
map('n', 'Qx', 'Zx', opts)
map('n', 'qo', 'zo', opts)
map('n', 'qc', 'zc', opts)
map('n', 'qO', 'zO', opts)
map('n', 'qC', 'zC', opts)
map('n', 'qa', 'za', opts)
map('n', 'qA', 'zA', opts)
map('n', 'qm', 'zm', opts)
map('n', 'qr', 'zr', opts)
map('n', 'qM', 'zM', opts)
map('n', 'qR', 'zR', opts)
map('n', 'qx', 'zx', opts)
map('n', 'qv', 'zv', opts)
map('n', 'q=', 'z=', opts)
map('n', 'qn', 'zn', opts)
map('n', 'qN', 'zN', opts)
map('n', 'qg', 'zg', opts)
map('n', 'qG', 'zG', opts)
map('n', 'qw', 'zw', opts)
map('n', 'qW', 'zW', opts)

map('n', 'z', 'u', opts)
map('n', 'Z', '<C-r>', opts)

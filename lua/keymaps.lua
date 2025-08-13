--[[

    __              __    _           ___                 
   / /_____  __  __/ /_  (_)___  ____/ (_)___  ____ ______
  / //_/ _ \/ / / / __ \/ / __ \/ __  / / __ \/ __ `/ ___/
 / ,< /  __/ /_/ / /_/ / / / / / /_/ / / / / / /_/ (__  ) 
/_/|_|\___/\__, /_.___/_/_/ /_/\__,_/_/_/ /_/\__, /____/  
          /____/                            /____/        

]]

local opts = { noremap = true, nowait = true, silent = true }
local function map(m, k, b) vim.keymap.set(m, k, b, opts ) end
local function apimap(m, k, b) vim.api.nvim_set_keymap(m, k, b, opts) end


-- Map Ctrl+C to yank (copy)
apimap('n', "<C-c>", '"+y')
apimap('v', "<C-c>", '"+y')


-- Map Ctrl+V to paste
apimap('n', "<C-v>", '"+p')
apimap('i', "<C-v>", "<C-r>+")



-- visual mode remap
map('v', 'a', "<Nop>")
map('v', "zw", "aw")
map('v', "zp", "ap")

map('v', 'X', '"_di')
map('v', 'x', 'd') -- this changes nothing actuly



--normal mode remap
map('n', 'S', 'i')
map('n', 'W', 'a')
map('n', 'i', 's')
map('n', '<C-s>', ':w<CR>')

--[[
  ______ 
 |  ____|
 | |__   
 |  __|  
 | |____ 
 |______|

  ]]

map('n', 'e', 'd')
map('n', 'eD', 'd$')
map('n', 'ed', 'dw')
map('n', 'ee', 'dd')





--insertmode remap 
map({'i', 'n'}, "<C-z>", "<Esc>")
map('i', '<A-w>', "<Up>")
map('i', '<A-s>', "<Down>")
map('i', '<A-a>', "<Left>")
map('i', '<A-d>', "<Right>")

map('i', '<C-e>', 'd')
map('i', '<A-x>', '<BS>')


-- glbal remap
map('', 'w', "<Up>")
map('', 's', "<Down>")
map('', 'a', "<Left>")
map('', 'd', "<Right>")

map('', 'D', 'e')
map('', 'A', 'b')



-- normal mode z remaps
map('n', 'QQ', ':w<CR>')
map('n', 'QZ', 'ZQ')
map('n', 'Qt', 'Zt')
map('n', 'Qq', 'ZZ')
map('n', 'Qb', 'Zb')
map('n', 'QO', 'ZO')
map('n', 'QC', 'ZC')
map('n', 'Qa', 'Za')
map('n', 'Qx', 'Zx')
map('n', 'qo', 'zo')
map('n', 'qc', 'zc')
map('n', 'qO', 'zO')
map('n', 'qC', 'zC')
map('n', 'qa', 'za')
map('n', 'qA', 'zA')
map('n', 'qm', 'zm')
map('n', 'qr', 'zr')
map('n', 'qM', 'zM')
map('n', 'qR', 'zR')
map('n', 'qx', 'zx')
map('n', 'qv', 'zv')
map('n', 'q=', 'z=')
map('n', 'qn', 'zn')
map('n', 'qN', 'zN')
map('n', 'qg', 'zg')
map('n', 'qG', 'zG')
map('n', 'qw', 'zw')
map('n', 'qW', 'zW')

map('n', 'z', 'u')
map('n', 'Z', '<C-r>')


vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	command = [[
		nnoremap <buffer> s <Down>
		nnoremap <buffer> S s

		nnoremap <buffer> d <CR>    " open file / dir
		nnoremap <buffer> a -       " parent directory
		nnoremap <buffer> n %       " new file
		nnoremap <buffer> N d       " new directory
	]]
})


-- tab management
for i = 1, 9 do
	map('n', '<C-' .. i .. '>', i .. 'gt')
	map('i', '<C-' .. i .. '>', i .. 'gt')
end
map('n', '<Tab>', ':tabnext<CR>')
map('n', '<S-Tab>', ':tabprevious<CR>')



map('i', '', '~')

--[[                              _ 
  __ ___ _ __  _ __  __ _ _ _  __| |
 / _/ _ \ '  \| '  \/ _` | ' \/ _` |
 \__\___/_|_|_|_|_|_\__,_|_||_\__,_|

]]

-- block the stupid '' with ~
map('c', '', '~')

map('c', '<A-a>', "<Left>")
map('c', '<A-d>', "<right>")
apimap('c', '<A-s>', '<C-z>')
apimap('c', '<A-w>', '<C-p>')

--map('c', '<A-e>', '<>')
map('c', '<A-x>', '<C-h>')
vim.keymap.set('c', '<A-x>', '<C-h>')

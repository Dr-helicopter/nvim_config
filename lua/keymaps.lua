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


local function toggle_recurcive_fold()
	if vim.fn.foldclosed('.') ~= -1 then vim.cmd('normal! zO')
	else vim.cmd('normal! zC') end
end

local function verticalize()
	if vim.wo.number then
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.opt.numberwidth = 1
		vim.opt.signcolumn = 'no'
		vim.opt.wrap = false
	else
		vim.opt.number = true
		vim.opt.relativenumber = true
		vim.opt.numberwidth = 3
		vim.opt.signcolumn = 'yes:4'
		vim.opt.wrap = true
	end
end

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

--[[
  ______ 
 |  ____|
 | |__   
 |  __|  
 | |____ 
 |______|

  ]]

map('n', 'e', 'd')
map('n', 'ee', 'dd')

map('n', 'eD', 'd$')
map('n', 'ed', 'dw')
map('n', 'ew', 'dW')

map('n', 'eA', 'd0')
map('n', 'ea', 'dbx')
map('n', 'es', 'dB')

--[[
   _____ 
  / ____|
 | |     
 | |     
 | |____ 
  \_____|

  ]]
map('n', 'c', '')
map('n', 'cc', ':w<CR>')
map('n', 'cq', ':wq<CR>')
map('n', 'cQ', ':q!<CR>')
map('n', 'cv', verticalize)




--insertmode remap 
map({'i', 'n'}, "<C-z>", "<Esc>")
map('i', '<A-w>', "<Up>")
map('i', '<A-s>', "<Down>")
map('i', '<A-a>', "<Left>")
map('i', '<A-d>', "<Right>")

map('i', '<C-e>', 'd')
map('i', '<A-x>', '<BS>')

map('i', '<A-e>', '<CR>')
map('i', '<C-BS>', '<Esc>ddi')


-- glbal remap
map('', 'w', "<Up>")
map('', 's', "<Down>")
map('', 'a', "<Left>")
map('', 'd', "<Right>")

map('', 'D', 'e')
map('', 'A', 'b')

--[[
  ____  
 / __ \ 
| |  | |
| |  | |
| |__| |
 \___\_\

  ]]

-- normal mode z remaps
map('n', 'qa', 'za')
map('n', 'qA', toggle_recurcive_fold)
map('n', 'qq', 'zM')
map('n', 'qQ', 'zR')

map({'n', 'o', 'x', 'v'}, 'qc', 'y')
map('o', 'c', 'y')
map('n', 'qv', 'p')

map('n', 'qs', 'o')
map('n', 'qw', 'O')

map('v' ,'qa', '<')
map('v' ,'qd', '>')

-- Make c act like y in operator-pending mode
map('n', 'QZ', 'ZQ')
map('n', 'Qt', 'Zt')
map('n', 'Qb', 'Zb')
map('n', 'QO', 'ZO')
map('n', 'QC', 'ZC')
map('n', 'Qa', 'Za')
map('n', 'Qx', 'Zx')
map('n', 'qo', 'zo')
map('n', 'qO', 'zO')
map('n', 'qC', 'zC')
map('n', 'qm', 'zm')
map('n', 'qr', 'zr')
map('n', 'qM', 'zM')
map('n', 'qR', 'zR')
map('n', 'qx', 'zx')
map('n', 'q=', 'z=')
map('n', 'qn', 'zn')
map('n', 'qN', 'zN')
map('n', 'qG', 'zG')
map('n', 'qW', 'zW')
map('n', 'q:', ':')


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

map('c', '<A-x>', '<C-h>')
vim.keymap.set('c', '<A-x>', '<C-h>')




local function start_fff()
	require('fff').start()
end

local function start_tab_fff()
	vim.cmd("tabnew")
	require('fff').start()
end


map('n', 'F', start_fff)
map('n', '<A-f>', start_tab_fff)

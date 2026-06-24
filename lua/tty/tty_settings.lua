local M = {}
local tty_terms = {
	"linux",  -- Linux console
	"vt100",  -- Very basic terminal
	"vt220",  -- Older terminal
	"ansi",   -- ANSI terminal
}

function M.is_tty()
	local term = vim.env.TERM or ""

	if term =='linux' then return true end

	for _, tty_term in ipairs(tty_terms) do
		if term == tty_term then return true end
	end


	if term:match("xterm-kitty") or
		term:match("kitty") or
		term:match("xterm") or
		term:match("alacritty") or
		term:match("wezterm") or
		term:match("foot") or
		term:match("256color") then
		return false
	end

  -- Additional check: if DISPLAY is set, it's likely a graphical environment (non-TTY)
	if vim.env.DISPLAY then
		return false
	end

	return true
end

function M.get_noice()
	return require('tty.noice')
end


function M.apply()
	if not M.is_tty() then return end


	vim.cmd("colorscheme habamax")
	vim.opt.termguicolors = false
	vim.opt.background = "dark"

	vim.opt.statusline = "%F%m%r%h%w [%l,%c] %p%%"

	vim.opt.mouse = ""

	vim.opt.cursorline = false
	vim.opt.colorcolumn = ""

	require('tty.theme')
end

return M

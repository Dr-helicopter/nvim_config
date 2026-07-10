local hipatterns = require("mini.hipatterns")

local function load_project_rules()
	local root = vim.fs.root(0, { ".git" })
	if not root then
		return
	end

	local highlighters = {}

	for _, file in ipairs(vim.fn.globpath(root, "*.mini_rules.lua", false, true))
	do
		local rules = dofile(file)

		if rules.colors then
			for name, opts in pairs(rules.colors) do
				vim.api.nvim_set_hl(0, name, opts)
			end
		end

		if rules.highlights then
			for name, highlight in pairs(rules.highlights) do
				highlighters[name] = highlight
			end
		end
	end
	hipatterns.setup({
		highlighters = highlighters
	})
end

vim.api.nvim_create_autocmd(
	{
		"BufEnter",
		"DirChanged",
	},
	{ callback = load_project_rules }
)

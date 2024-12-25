local null_ls = require('null-ls')

vim.notify(vim.fn.stdpath("config") .. lin_or_win("/","\\") .. '.ruff.toml' )


return{
	sources = {
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff.with({
			extra_args = { "--config", vim.fn.stdpath("config") .. lin_or_win('/', '\\') .. '.ruff.toml' },
		}),
	}
}

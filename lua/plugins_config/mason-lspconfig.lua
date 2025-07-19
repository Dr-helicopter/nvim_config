vim.diagnostic.config({
	virtual_text = true,
})

local map = vim.keymap.set

-- export on_attach & capabilities
local on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
	map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
	map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

	map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts "List workspace folders")

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
	map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = {
		'markdown',
		'plaintext'
	},
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}



local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

 mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "pylsp" },
	automatic_enable = true, -- auto-enable via vim.lsp.enable()
})

-- Global server settings
vim.lsp.config("*", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Per-server override for Lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

-- Python
vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W191", "E701", "E704", "E301", "E741" },
					maxLineLength = 100,
				},
			},
		},
	},
})


lspconfig.gdscript.setup(capabilities)


lspconfig.clangd.setup {
    cmd = { "/bin/clangd" },
    -- optional:
    -- cmd = { "/home/you/tools/clangd/bin/clangd", "--background-index" },
}

lspconfig.gdscript.setup(capabilities)

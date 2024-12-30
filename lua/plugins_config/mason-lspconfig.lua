require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'pylsp',
	},
	automatic_installation = true,
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
	map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
	map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
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

require("mason-lspconfig").setup_handlers({
	function(server) lspconfig[server].setup({}) end,
})

lspconfig.pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W191", "E701", "E704","E301", "E741" },        
					 maxLineLength = 100,
				}
			}
		}
	}
}

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
    		diagnostics = { globals = { 'vim' } },
    		workspace = {
        		library = vim.api.nvim_get_runtime_file("", true),
        		checkThirdParty = true,
      		},
		},
	},
})

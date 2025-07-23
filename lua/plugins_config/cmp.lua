local cmp = require('cmp')


cmp.setup({
	completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    },
	sources = {
		{ name = 'nvim_lsp' }, -- LSP source from mason-lspconfig
		{ name = 'buffer' }, -- Buffer completions
		{ name = 'path' }, -- File path completions
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-x>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
})


cmp.event:on("menu_closed", function()
    print("cmp menu closed")
end)

cmp.event:on("menu_opened", function()
    print("cmp menu opened")
end)

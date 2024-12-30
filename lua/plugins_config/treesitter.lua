




require("nvim-treesitter.configs").setup({
	auto_install = false,
	sync_install = true,
		ensure_installed = { "lua", "python", },
        indent = { enable = true },
	highlight = {
		enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    	disable = { "c", "rust" },
    -- Or usnd

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
})


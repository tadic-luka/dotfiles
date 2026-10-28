return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = false,
					scope_selection = "<TAB>",
					node_decremental = "<bs>",
				},
			},
		},
	},
}

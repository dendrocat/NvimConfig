return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd", -- C++
				"pyright", -- Python
				"lua_ls" -- Lua
			}
		}
	},
	{
		'neovim/nvim-lspconfig',
		event = "BufReadPre",
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip'
		}
	},
}

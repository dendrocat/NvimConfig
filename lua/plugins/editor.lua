return {
	-- Autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},

	-- Formatter
	{ 'stevearc/conform.nvim', },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate",
	}
}

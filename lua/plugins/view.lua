return {
	-- Themes
	{ "folke/tokyonight.nvim", },
	{ "EdenEast/nightfox.nvim", },
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	-- Status + tab line	
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
	}
}

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
		'rebelot/heirline.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Indent lines
	{ "lukas-reineke/indent-blankline.nvim" },

	-- Git signs
	{ "lewis6991/gitsigns.nvim" },

	-- Notifications
	{ "j-hui/fidget.nvim" }
}

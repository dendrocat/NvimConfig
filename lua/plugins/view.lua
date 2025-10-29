return {
	-- Themes
	{ "folke/tokyonight.nvim", },
	{ "EdenEast/nightfox.nvim", },

	-- Status + tab line	
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				scope = {
					show_start = false,
				}
			})
		end
	}
}

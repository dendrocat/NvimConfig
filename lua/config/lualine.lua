-- M.align = { provider = "%=" }
-- M.space = { provider = " " }
--
-- M.statusline_separators = { left = "", right = "" }
-- M.tabline_separators = { left = "", right = "" }

local config = {}
config.options = {
	section_separators = { left = "", right = "" },
	component_separators = ""
}
config.sections = {
	lualine_a = { "mode" },
	lualine_b = {
		{
			"filename",
			symbols = { readonly = "  " }
		}
	},
	lualine_c = {
		"diagnostics", "%=",
		{ "filetype", icon_only = true, },
		{
			"lsp_status",
			icon = "",
			symbols = { separator = "" }
		}
	},
	lualine_x = { "encoding", "fileformat" },
	lualine_y = { "diff", "branch" },
	lualine_z = { "progress" },
}
config.inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = { "filename" },
	lualine_x = { "filetype" },
	lualine_y = {},
	lualine_z = {},
}
config.tabline = {
	lualine_a = { { "tabs", mode = 1 } }
}
config.extensions = {
	"nvim-tree", "mason", "lazy"
}
require("lualine").setup(config)

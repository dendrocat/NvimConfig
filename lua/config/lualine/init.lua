local align = "%="
-- M.space = { provider = " " }
--
-- M.statusline_separators = { left = "", right = "" }
-- M.tabline_separators = { left = "", right = "" }
package.path = vim.fn.stdpath("config") .. "/lua/config/lualine/?.lua;" .. package.path
local lspactive = require("lspactive")
local file = require("file")

local config = {}
config.options = {
	section_separators = { left = "", right = "" },
	component_separators = ""
}
config.sections = {
	lualine_a = { "mode" },
	lualine_b = { file.flags.modified, file.flags.readonly, { "filename", file_status = false, } },
	lualine_c = { "diagnostics", align, file.icon, lspactive },
	lualine_x = { { "encoding", fmt = string.upper, color = { gui = "bold" } }, "fileformat" },
	lualine_y = { "diff", { "branch", icon = {"", align = "right" }, }, },
	lualine_z = { "location", "progress" },
}
config.inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = { "filename" },
	lualine_x = { { "encoding", fmt = string.upper }, "fileformat" },
	lualine_y = {},
	lualine_z = {},
}
config.tabline = {
	lualine_a = { { "tabs", mode = 1 }, },
}
config.extensions = {
	"nvim-tree", "mason", "lazy"
}
require("lualine").setup(config)

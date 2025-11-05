local conditions = require("heirline.conditions")
local utils = require("utils")

local Ruler = require("ruler")
local Scrollbar = require("scrollbar")
local ViMode = require("vimode")
local LSPActive = require("lspactive")
local File = require("file")
local Git = require("git")
local Diagnostic = require("diagnostic")
local Terminal = require("terminal")
local base_providers = require("base_providers")

local Align = base_providers.align
local Space = base_providers.space

local separators = base_providers.statusline_separators
local fill_provider = '█'

local function mode_color(self)
	return self:mode_color()
end

Scroll = utils.surround({ "", "" }, mode_color, { Ruler, Space, Scrollbar })
FileBlock = utils.surround({ "", separators.right }, "gray",
	{ File.Flags, Space, File.Name, Diagnostic })

Git = utils.surround({ separators.left, fill_provider }, Git.hl.bg, Git)
Git.condition = conditions.is_git_repo

local DefualtStatusLine = {
	ViMode,
	{
		provider = separators.right,
		hl = function(self)
			return { fg = mode_color(self), bg = FileBlock[2].hl(self).bg }
		end,
	},
	FileBlock,
	Align,
	{
		condition = conditions.lsp_attached,
		File.Icon,
		Space,
		LSPActive,
	},
	Align,
	File.Encoding, Space, File.Format, Space, Git,
	{
		provider = separators.left,
		hl = function(self)
			local hl = { fg = mode_color(self), }
			if conditions.is_git_repo() then
				hl["bg"] = Git[2].hl(self).bg
			end
			return hl
		end,
	},
	Scroll
}

local InactiveStatusLine = {
	condition = conditions.is_not_active,
	ViMode,
	{
		provider = separators.right,
		hl = function(self)
			return { fg = mode_color(self), bg = FileBlock[2].hl(self).bg }
		end,
	},
	FileBlock,
	Align,
	File.Encoding,
	Space,
	File.Format,
	Space
}

local TerminalStatusline = {
	condition = function()
		return conditions.buffer_matches({ buftype = { "terminal" } })
	end,
	{
		condition = conditions.is_active,
		ViMode,
		{
			provider = separators.right,
			hl = function(self)
				return { fg = mode_color(self), bg = Terminal.Name.hl.bg }
			end,
		},
	},
	Space,
	Terminal.Name,
}

local NvimTreeLine = {
	condition = function()
		return conditions.buffer_matches({
			filetype = { "NvimTree" },
		})
	end,
	Space,
	File.Type,
	Align,
	{ provider = " ", hl = { fg = "fg", } },
}


local StatusLines = {
	static = {
		mode_colors_map = {
			n = "blue",
			i = "green",
			v = "cyan",
			V = "cyan",
			["\22"] = "cyan",
			c = "orange",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "orange",
			r = "orange",
			["!"] = "red",
			t = "green",
		},
		mode_color = function(self)
			local mode = conditions.is_active() and vim.fn.mode() or "n"
			return self.mode_colors_map[mode]
		end,
		separators = { left = "", right = "" },
	},
	fallthrough = false,
	NvimTreeLine,
	TerminalStatusline,
	InactiveStatusLine,
	DefualtStatusLine,
}

function StatusLines.set_separators(left_separator, right_separator)
	separators = {
		left = left_separator, right = right_separator
	}
end

return StatusLines

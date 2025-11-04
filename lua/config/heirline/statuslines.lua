local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Ruler = require("ruler")
local Scrollbar = require("scrollbar")
local ViMode = require("vimode")
local LSPActive = require("lspactive")
local File = require("file")
local Git = require("git")
local Diagnostic = require("diagnostic")
local Terminal = require("terminal")

local Align = { provider = '%=', }
local Space = { provider = ' ', }

local separators = { left = "", right = "", fill = '█' }

local function mode_color(self)
	return self:mode_color()
end

Scroll = utils.surround({ "", separators.fill }, mode_color, { Ruler, Space, Scrollbar })
FileBlock = utils.surround({ "", separators.right }, File.Name.hl.bg,
	{ File.Flags, Space, File.Name, Diagnostic })

Git = utils.surround({ separators.left, separators.fill }, Git.hl.bg, Git)
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
	Align, Git,
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
	},
	fallthrough = false,
	NvimTreeLine,
	TerminalStatusline,
	InactiveStatusLine,
	DefualtStatusLine,
}
return StatusLines

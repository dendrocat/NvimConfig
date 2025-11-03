local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Ruler = require("config.heirline.ruler")
local Scrollbar = require("config.heirline.scrollbar")
local ViMode = require("config.heirline.vimode")
local LSPActive = require("config.heirline.lspactive")
local FileName = require("config.heirline.filename")
local Git = require("config.heirline.git")
local FileIcon = require("config.heirline.fileicon")
local FileFlags = require("config.heirline.fileflags")
local Diagnostic = require("config.heirline.diagnostic")

local theme_colors = require("catppuccin.palettes").get_palette("macchiato")

local colors = {
	fg = utils.get_highlight('StatusLine').fg,
	bg = theme_colors.base,
	fg_inactive = utils.get_highlight('StatusLineNC').fg,
	bg_inactive = utils.get_highlight('StatusLineNC').bg,
	bright_bg = utils.get_highlight('Folded').bg,
	bright_fg = utils.get_highlight('Folded').fg,
	red = theme_colors.red,
	dark_red = utils.get_highlight('DiffDelete').bg,
	green = theme_colors.green,
	blue = theme_colors.blue,
	gray = theme_colors.base,
	orange = theme_colors.peach,
	purple = theme_colors.mauve,
	cyan = theme_colors.teal,
	diag_warn = utils.get_highlight('DiagnosticWarn').fg,
	diag_error = utils.get_highlight('DiagnosticError').fg,
	diag_hint = utils.get_highlight('DiagnosticHint').fg,
	diag_info = utils.get_highlight('DiagnosticInfo').fg,
	git_add = utils.get_highlight('GitSignsAdd').fg,
	git_change = utils.get_highlight('GitSignsChange').fg,
	git_del = utils.get_highlight('GitSignsDelete').fg,
}

local Align = { provider = '%=', }
local Space = { provider = ' ', }

local separators = { left = "", right = "", fill = '█' }

local function mode_color(self)
	return self:mode_color()
end

Scroll = utils.surround({ "", separators.fill }, mode_color, { Ruler, Space, Scrollbar })
File = utils.surround({ "", separators.right }, FileName.hl.bg,
	{ FileFlags, Space, FileName, Diagnostic })

Git = utils.surround({ separators.left, separators.fill }, Git.hl.bg, Git)
Git.condition = conditions.is_git_repo

local DefualtStatusLine = {
	ViMode,
	{
		provider = separators.right,
		hl = function(self)
			return { fg = mode_color(self), bg = File[2].hl(self).bg }
		end,
	},
	File,
	Align,
	{
		condition = conditions.lsp_attached,
		FileIcon,
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

local NvimTreeLine = {
	condition = function()
		return conditions.buffer_matches({
			filetype = { "NvimTree" },
		})
	end,
	FileName,
	Align,
	{ provider = " "},
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
	DefualtStatusLine,
}

require('heirline').setup {
	statusline = StatusLines,
	opts = {
		colors = colors,
	},
}

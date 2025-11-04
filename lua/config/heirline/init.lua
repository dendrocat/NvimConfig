package.path = vim.fn.stdpath("config") .. "/lua/config/heirline/?.lua;" .. package.path

local utils = require("heirline.utils")

local theme_colors = require("catppuccin.palettes").get_palette("macchiato")

local colors = {
	fg = utils.get_highlight('StatusLine').fg,
	bg = utils.get_highlight('StatusLine').bg,
	fg_inactive = utils.get_highlight('StatusLineNC').fg,
	bg_inactive = utils.get_highlight('StatusLineNC').bg,
	bright_fg = utils.get_highlight('Folded').fg,
	bright_bg = theme_colors.base,
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

local StatusLines = require("statuslines")
local Tablines = require("tablines")

require('heirline').setup {
	statusline = StatusLines,
	tabline = Tablines,
	opts = {
		colors = colors,
	},
}

local conditions = require("heirline.conditions")
local utils = require("utils")

local File = {}
File.Name = {
	init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
	provider = function(self)
		local filename = vim.fn.fnamemodify(self.filename, ":t")
		if filename == "" then return "[No Name]" end
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = { fg = utils.get_highlight("Directory").fg },
}
File.Icon = {
	init = function(self)
		local filename = vim.api.nvim_buf_get_name(0)
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end
}
File.Type = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = { fg = utils.get_highlight("Directory").fg, bold = true },
}
File.Flags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = " [+]",
		hl = { fg = "green" },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "  ",
		hl = { fg = "orange" },
	},
}
File.Format = {
	static = {
		symbols = {
			unix = '', -- e712
			dos = '', -- e70f
			mac = '', -- e711
		},
	},
	provider = function(self)
		local fmt = vim.bo.fileformat
		return self.symbols[fmt]
	end,
}
File.Encoding = {
	provider = function()
		local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
		return enc:upper()
	end,
	hl = { bold = true }
}
return File

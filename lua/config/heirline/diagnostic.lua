local conditions = require("heirline.conditions")

local Diagnostics = {

	condition = conditions.has_diagnostics,
	-- Example of defining custom LSP diagnostic icons, you can copypaste in your config:
	--vim.diagnostic.config({
	static = {
		error_icon = ' ',
		warn_icon = ' ',
		info_icon = '󰋇 ',
		hint_icon = '󰌵 ',
	},
	--})
	-- Fetching custom diagnostic icons
	-- error_icon = vim.diagnostic.config()['signs']['text'][vim.diagnostic.severity.ERROR],
	-- warn_icon = vim.diagnostic.config()['signs']['text'][vim.diagnostic.severity.WARN],
	-- info_icon = vim.diagnostic.config()['signs']['text'][vim.diagnostic.severity.INFO],
	-- hint_icon = vim.diagnostic.config()['signs']['text'][vim.diagnostic.severity.HINT],
	-- If you defined custom LSP diagnostics with vim.fn.sign_define(), use this instead
	-- Note defining custom LSP diagnostic this way its deprecated, though
	-- static = {
	--    error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
	--    warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
	--    info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
	--    hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
	-- },

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },

	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and (" " .. self.error_icon .. self.errors)
		end,
		hl = { fg = "diag_error" },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (" " .. self.warn_icon .. self.warnings)
		end,
		hl = { fg = "diag_warn" },
	},
	{
		provider = function(self)
			return self.info > 0 and (" " .. self.info_icon .. self.info)
		end,
		hl = { fg = "diag_info" },
	},
	{
		provider = function(self)
			return self.hints > 0 and (" " .. self.hint_icon .. self.hints)
		end,
		hl = { fg = "diag_hint" },
	},
}
return Diagnostics

local conditions = require 'heirline.conditions'

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { 'LspAttach', 'LspDetach', 'BufEnter' },
	provider = function()
		return vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })[1].name
	end,
	hl = { bold = true },
}

return LSPActive

local lual = require('lualine')
local config = lual.get_config()

config.options.component_separators = { left = '\\', right = '/' }
config.options.section_separators = { left = '', right = '' }

config.sections = {
	lualine_a = { 'mode' },
	lualine_b = { 'branch', 'diff' },
	lualine_c = { 'filename', 'diagnostics' },
	lualine_x = { 'lsp_status' },
	lualine_y = { 'encoding', 'fileformat' },
	lualine_z = { 'progress' }
}
config.inactive_sections = {
	lualine_c = { 'filename' },
	lualine_x = {},
}
config.tabline = {
	lualine_a = { {
		'tabs',
		mode = 1,
		max_length = vim.o.columns,
	} },
}
config.extensions = {
	{
		filetypes = { 'NvimTree' },
		sections = {
			lualine_a = { function() return "NvimTree" end },
			lualine_z = { 'progress' },
		},
	},
}


lual.setup(config)

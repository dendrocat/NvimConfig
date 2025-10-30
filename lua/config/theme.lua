local theme = require('catppuccin')
local config = {}
config.auto_integrations = true

config.styles = {
	keywords = { 'italic' },
}

theme.setup(config)

vim.cmd [[colorscheme catppuccin-macchiato ]]

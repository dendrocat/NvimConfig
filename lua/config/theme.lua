local cat = require('catppuccin')
local palet = require("catppuccin.palettes").get_palette("macchiato")

local config = {}
config.auto_integrations = true

config.styles = {
	keywords = { 'italic' },
}

config.custom_highlights = {
	Type = { fg = palet.green, },
	Function = { fg = "#10b1fe", }
}

cat.setup(config)

vim.cmd("colorscheme catppuccin-macchiato")

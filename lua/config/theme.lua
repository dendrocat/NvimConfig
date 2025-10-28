local theme = require('nightfox')
theme.setup({
	options = {
		styles = {
			keywords = 'italic',
			types = 'italic, bold',
		}
	}
})
vim.cmd [[colorscheme nightfox ]]

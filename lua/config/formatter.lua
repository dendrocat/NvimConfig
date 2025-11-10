local config = {
	formatters = {},
}
config.formatters.prettier = {
	command = 'prettier',
	args = {
		'--stdin-filepath', '$FILENAME',
		'--arrow-parens', 'avoid',
		'--bracket-spacing',
		'--end-of-line', 'lf',
		'--html-whitespace-sensitivity', 'css',
		'--insert-pragma', 'false',
		'--single-attribute-per-line', 'false',
		'--bracket-same-line', 'false',
		'--single-quote', 'true',
		'--print-width', '80',
		'--prose-wrap', 'preserve',
		'--quote-props', 'as-needed',
		'--require-pragma', 'false',
		'--semi', 'false',
		'--single-quote', 'true',
		'--tab-width', '2',
		'--trailing-comma', 'es5',
		'--use-tabs', 'true',
		'--embedded-language-formatting', 'auto',
		'--vue-indent-script-and-style', 'false',
		'--experimental-ternaries', 'false',
	},
	stdin = true,
}
config.formatters.xmlformatter = {
	command = "xmlformat",
	args = { "--indent", "4", "$FILENAME" },
}
config.formatters['*'] = {}

config.formatters_by_ft = {
	json = { 'prettier' },
	javascript = { 'prettier' },
	typescript = { 'prettier' },
	css = { 'prettier' },
	html = { 'prettier' },
	markdown = { 'prettier' },
	xml = { 'xmlformatter' },
}

config.default_format_opts = {
	lsp_format = "fallback",
	quiet = false
}

config.log_level = vim.log.levels.INFO
config.notify_on_error = true
config.notify_no_formatters = true

local conform = require("conform")
conform.setup(config)
vim.keymap.set('n', '==', function()
	conform.format({ async = true }, function(err, _)
		local filename = vim.fn.expand("%:t")
		if err ~= nil then
			vim.notify(err, vim.log.levels.ERROR)
		else
			vim.notify(filename .. " has been successfully formatted", vim.log.levels.INFO)
		end
	end)
end, { desc = "Format file" })


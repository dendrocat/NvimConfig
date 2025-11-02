local parsers = {
	'c', 'cpp', 'c_sharp', 'lua', 'javascript', 'python', 'typescript',
	'gitignore', 'gitattributes',
	'json', 'xml', 'yaml',
	'regex',
	'markdown',
}

local parser_install_dir = vim.fn.stdpath("data") .. "\\treesitter-parsers"

vim.opt.runtimepath:prepend(parser_install_dir)
require("nvim-treesitter.configs").setup({
	ensure_installed = parsers,
	auto_install = false,
	highlight = { enable = true, },
	parser_install_dir = parser_install_dir,
})

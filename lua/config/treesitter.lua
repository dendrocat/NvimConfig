local parsers = {
	'c', 'cpp', 'c_sharp', 'lua', 'javascript', 'python', 'typescript',
	'gitignore', 'gitattributes',
	'json', 'xml', 'yaml',
	'regex',
	'markdown',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if not vim.tbl_contains(parsers, lang) then
			return
		end
		-- vim.notify("Treesitter включен для " .. ft)
		vim.treesitter.start()
	end
})

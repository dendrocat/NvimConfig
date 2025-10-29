local function in_list(list, val)
	for _, v in ipairs(list) do
		if val == v then
			return true
		end
	end
	return false
end


vim.cmd("syntax off")

local parsers = {
	'c', 'cpp', 'c_sharp', 'lua', 'javascript', 'python', 'typescript',
	'gitignore', 'gitattributes',
	'json', 'xml', 'yaml',
	'regex',
	'markdown',
}

require('nvim-treesitter').install(parsers)


-- Автоматически включаем подсветку для всех буферов с установленным парсером
vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		local ft = vim.bo.filetype
		local lang = vim.treesitter.language.get_lang(ft)
		if not in_list(parsers, lang) then
			return
		end
		-- vim.notify("Treesitter включен для " .. ft)
		vim.treesitter.start()
	end
})

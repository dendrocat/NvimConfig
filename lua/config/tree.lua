-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local config = {}
config.sort = { sorter = "case_sensitive" }
config.view = {
	width = 30,
	side = 'left',
}
config.renderer = {
	group_empty = true,
	highlight_git = true,
}
config.filters = {
	dotfiles = false,
	git_ignored = false,
}
config.filters.custom = {
	"^.git$",
	"\\.meta$",
}

local unity_ignore = require("config.tree_ingores.unity")
if unity_ignore.is_unity_project() then
	for _, pattern in ipairs(unity_ignore.patterns) do
		table.insert(config.filters.custom, pattern)
	end
end

require('nvim-tree').setup(config)

local api = require("nvim-tree.api")
vim.keymap.set('n', '<leader>e', function()
	if api.tree.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			api.tree.close()
		else
			api.tree.focus()
		end
	else
		api.tree.open()
	end
end, { desc = 'Tree toggle' })

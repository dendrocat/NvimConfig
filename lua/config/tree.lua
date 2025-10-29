-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort = { sorter = "case_sensitive" },
	view = {
		width = 30,
		side = 'left',
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
	},
	filters = {
		dotfiles = false,
		git_ignored = false,
		custom = {
			"^.git$",
			"\\.meta$",
		},
	},
})


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

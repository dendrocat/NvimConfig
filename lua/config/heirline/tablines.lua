local utils = require("utils")
local base_providers = require("base_providers")

local separators = base_providers.tabline_separators

local tabCountLength = 5
local TabCount = {
	provider = function()
		local count = tostring(#vim.api.nvim_list_tabpages())
		local padding = tabCountLength - #count
		local left = math.floor(padding / 2)
		return string.rep(" ", left) .. count .. string.rep(" ", padding - left)
	end
}

local TabFileName = {
	provider = function(self)
		local buflist = vim.fn.tabpagebuflist(self.tabnr)
		local winnr = vim.fn.tabpagewinnr(self.tabnr)
		local bufnr = buflist[winnr]

		local filename = vim.fn.bufname(bufnr)
		filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
		filename = self.tabnr .. " " .. filename

		if #filename > self.tab_width then
			filename = filename:sub(1, self.tab_width - 3) .. "..."
		elseif #filename < self.tab_width then
			local padding = self.tab_width - #filename
			local left = math.floor(padding / 2)
			filename = string.rep(" ", left) .. filename .. string.rep(" ", padding - left)
		end

		return filename
	end,
	hl = function(self)
		return { bold = self.is_active or self.is_visible }
	end,
}

local TabBlock = utils.surround({ separators.left, separators.right }, function(self)
	if self.is_active then
		return "gray"
	else
		return utils.get_highlight("TabLine").bg
	end
end, TabFileName)


local TabBuffer = utils.make_tabpages(
	TabBlock, vim.o.columns - tabCountLength, 10
)
local Align = { provider = "%=", }
return { TabBuffer, Align, TabCount, }

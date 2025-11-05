local M = require("heirline.utils")

local function get_tabs_on_page(tabs, tabs_per_page, page)
	local start_idx = (page - 1) * tabs_per_page + 1
	local end_idx = math.min(#tabs, page * tabs_per_page)
	local page_tabs = {}
	for i, tabpage in ipairs(tabs) do
		if i >= start_idx then table.insert(page_tabs, tabpage) end
		if i >= end_idx then break end
	end
	return page_tabs
end

function M.make_tabpages(tab_component, max_width, tabs_per_page)
	local tab_width = math.floor(max_width / tabs_per_page)

	local tablist = {
		static = {
			tab_width = tab_width - 2,
		},
		init = function(self)
			local page = math.floor((vim.api.nvim_tabpage_get_number(0) - 1) / tabs_per_page) + 1
			local tabs = vim.api.nvim_list_tabpages()
			local tabs_on_page = get_tabs_on_page(tabs, tabs_per_page, page)

			for i, tabpage in ipairs(tabs_on_page) do
				local tabnr = vim.api.nvim_tabpage_get_number(tabpage)
				local child = self[i]
				if not (child and child.tabpage == tabpage) then
					self[i] = self:new(tab_component, i)
					child = self[i]
					child.tabnr = tabnr
					child.tabpage = tabpage
				end
				child.is_active = (tabnr == vim.fn.tabpagenr())
			end
			for i = #tabs_on_page + 1, #self do
				self[i] = nil
			end
		end,
	}
	return tablist
end

return M

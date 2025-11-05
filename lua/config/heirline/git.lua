local conditions = require("heirline.conditions")

local function null_check(value)
	return value ~= 0 and value ~= nil
end

local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = null_check(self.status_dict.added) or null_check(self.status_dict.removed) or
			null_check(self.status_dict.changed)
	end,

	hl = { fg = "fg", bg = "gray" },
	update = { "BufEnter","TextChanged", "TextChangedI" },
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ("+" .. count)
		end,
		hl = { fg = "git_add" },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ("-" .. count)
		end,
		hl = { fg = "git_del" },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ("~" .. count)
		end,
		hl = { fg = "git_change" },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = " "
	},
	{ -- git branch name
		provider = function(self)
			return self.status_dict.head .. " "
		end,
		hl = function(self) return { fg = self:mode_color(), bold = true } end
	},
}
return Git

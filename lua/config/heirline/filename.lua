local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local FileName = {
	init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
	provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":t")
        if filename == "" then return "[No Name]" end
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = { fg = utils.get_highlight("Directory").fg, bg = "gray" },
}
return FileName

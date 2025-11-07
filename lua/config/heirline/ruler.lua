local Ruler = {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	provider = function()
		local current = vim.fn.line('.')
		local max = vim.fn.line("$")
		if current == 1 then
			return "Top"
		elseif current == max then
			return "Bot"
		else
			return tostring(math.floor(current / max * 100)) .. "%%"
		end
	end,
	hl = function(self)
		return { fg = 'bg', bg = self:mode_color(), }
	end
}

return Ruler

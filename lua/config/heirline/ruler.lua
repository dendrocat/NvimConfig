local Ruler = {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	provider = '%3p%% ',
	hl = function(self)
		return { fg = 'bg', bg = self:mode_color(), }
	end
}

return Ruler

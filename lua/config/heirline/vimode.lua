local ViMode = {
	init = function(self)
		self.mode = vim.fn.mode(1) -- :h mode()
	end,
	static = {
		mode_names = {
			n = 'NORMAL',
			no = 'N?',
			nov = 'N?',
			noV = 'N?',
			['no\22'] = 'N?',
			niI = 'Ni',
			niR = 'Nr',
			niV = 'Nv',
			nt = 'Nt',
			v = 'VISUAL',
			vs = 'Vs',
			V = 'VISUAL-LINE',
			Vs = 'Vs',
			['\22'] = 'VISUAL-BLOCK',
			['\22s'] = '^V',
			s = 'SELECT',
			S = 'S_',
			['\19'] = '^S',
			i = 'INSERT',
			ic = 'Ic',
			ix = 'Ix',
			R = 'REPLACE',
			Rc = 'Rc',
			Rx = 'Rx',
			Rv = 'Rv',
			Rvc = 'Rv',
			Rvx = 'Rv',
			c = 'COMMAND',
			cv = 'Ex',
			r = '...',
			rm = 'M',
			['r?'] = '?',
			['!'] = 'SHELL',
			t = 'TERMINAL',
		},
	},
	provider = function(self)
		return ' %2(' .. self.mode_names[self.mode] .. '%) '
	end,
	hl = function(self)
		return { fg = "bg", bg = self:mode_color(), bold = true }
	end,
	update = {
		'ModeChanged',
		pattern = '*:*',
		callback = vim.schedule_wrap(function()
			vim.cmd('redrawstatus')
		end),
	},
}

return ViMode

-- Terminal
vim.keymap.set('n', '<leader>t', ':tabnew<CR>:terminal<CR>i', { desc = 'Open terminal' })
vim.keymap.set('t', '<C-n>', "<C-\\><C-n>", { desc = 'Exit terminal' })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { desc = 'Exit terminal' })


-- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

local jump = function(cnt) vim.diagnostic.jump({ count = cnt, float = true }) end
vim.keymap.set('n', '[d', function() jump(-1) end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', function() jump(1) end, { desc = 'Next diagnostic' })


-- Settings
vim.keymap.set('n', '<leader>s', ':e $MYVIMRC | cd %:p:h | split . | wincmd k | pwd<CR>', { desc = "Open settings" })

vim.keymap.set('n', '<leader>bd',
	function()
		for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
			if (buf.changed == 0) then
				vim.cmd('silent! bd! ' .. buf.bufnr)
			end
		end
	end,
	{ desc = "Buffer: all safe delete" }
)

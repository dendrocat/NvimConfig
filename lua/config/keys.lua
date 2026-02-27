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

vim.keymap.set('n', '<leader>bd', function()
	-- Check for modified buffers
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf)
			and vim.api.nvim_get_option_value('modified', { buf = buf })
			and vim.api.nvim_get_option_value('buflisted', { buf = buf }) then
			vim.notify("Found modified buffers. Save or discard changes before clearing buffers", vim.log.levels.ERROR)
			return
		end
	end

	vim.cmd [[NvimTreeClose]]

	-- if current buffer isn't [No Name]
	if vim.fn.expand("%:p"):len() > 0 then
		vim.cmd [[%bd|e#|bd#]] -- delete all buffers
	end

	vim.cmd [[NvimTreeFocus]]
end, { desc = "Buffer: all delete", noremap = true, silent = true })

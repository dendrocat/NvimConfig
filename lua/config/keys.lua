-- Terminal
vim.keymap.set('n', '<leader>t', ':tabnew<CR>:terminal<CR>i', { desc = 'Open terminal' })
vim.keymap.set('t', '<C-n>', "<C-\\><C-n>", { desc = 'Exit terminal' })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { desc = 'Exit terminal' })

-- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

local jump = function(cnt) vim.diagnostic.jump({ count = cnt, float = true }) end
vim.keymap.set('n', '[d', function() jump(-1) end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', function() jump(1) end, { desc = 'Next diagnostic' })

-- Format
vim.keymap.set('n', '==', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format file' })

-- Settings
vim.keymap.set('n', '<leader>s', ':e $MYVIMRC | cd %:p:h | split . | wincmd k | pwd<CR>', { desc = "Open settings" })

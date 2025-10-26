--- Terminal
vim.keymap.set('n', '<leader>t', ':tabe | terminal<CR>i', { desc = 'Open terminal' })


--- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, { desc = 'Next diagnostic' })


--- Format
vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format file' })

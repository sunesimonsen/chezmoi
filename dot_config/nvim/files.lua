vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>fD', ':!rm %', { desc = 'Delete current file' })
vim.keymap.set('n', '<leader>fR', ':!mv % ', { desc = 'Rename current file' })

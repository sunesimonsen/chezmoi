vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Window right' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Window left' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Window close others' })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Window switch' })
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = 'Window close' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Window split' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Window split vertical' })
vim.keymap.set('n', '<leader>wp', '<C-w>p', { desc = 'Window previous' })

for i = 1, 4 do
  vim.keymap.set('n', '<leader>' .. i, i .. '<C-w>w', { desc = 'Window ' .. i })
end

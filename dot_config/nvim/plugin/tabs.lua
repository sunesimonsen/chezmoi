vim.keymap.set('n', '<leader>tt', ':tab term<CR>', { desc = 'Tab terminal' })
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'Tab new' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Tab close' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Tab only' })
vim.keymap.set('n', '<C-j>', ':tabnext<CR>', { desc = 'Tab next' })
vim.keymap.set('n', '<C-k>', ':tabprevious<CR>', { desc = 'Tab previous' })

for i = 1, 4 do
  vim.keymap.set('n', '<leader>t' .. i, i .. 'gt', { desc = 'Tab ' .. i })
end

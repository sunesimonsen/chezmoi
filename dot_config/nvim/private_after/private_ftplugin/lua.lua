require 'snippets.lua'

vim.keymap.set('n', '<leader>xf', ':%lua<cr>', { desc = 'Execute file', buffer = 0 })
vim.keymap.set('n', '<leader>xl', ':.lua<cr>', { desc = 'Execute line', buffer = 0 })
vim.keymap.set('v', '<leader>x', ':lua<cr>', { desc = 'Execute selection', buffer = 0 })

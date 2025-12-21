require('mini.diff').setup()
require('mini.git').setup()

vim.keymap.set('n', '<leader>go', MiniDiff.toggle_overlay, { desc = 'Toggle diff overlay' })

require('mini.diff').setup()

vim.keymap.set('n', '<leader>go', MiniDiff.toggle_overlay, { desc = 'Toggle diff overlay' })

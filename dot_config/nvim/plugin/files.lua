local deps = require 'custom.deps'

deps.add { source = 'stevearc/oil.nvim', checkout = 'bbad9a76b2617ce1221d49619e4e4b659b3c61fc' }

require('oil').setup {
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })

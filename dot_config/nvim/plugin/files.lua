local deps = require 'custom.deps'

deps.add 'stevearc/oil.nvim'

require('oil').setup {
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })

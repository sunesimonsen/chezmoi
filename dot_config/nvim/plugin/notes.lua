local deps = require 'custom.deps'

deps.add { source = 'nvim-telescope/telescope.nvim', checkout = 'b4da76be54691e854d3e0e02c36b0245f945c2c7' }
--deps.add('sunesimonsen/notes.nvim')
deps.add { source = 'file:///Users/ssimonsen/Code/nvim/notes.nvim' }

require('notes').setup {
  dir = '/Users/ssimonsen/Library/CloudStorage/Dropbox/denoted',
}

vim.keymap.set('n', '<leader>nn', ':Notes find<CR>', { desc = 'Find note' })
vim.keymap.set('n', '<leader>nl', ':Notes link_to_note<CR>', { desc = 'Link to note' })
vim.keymap.set('n', '<leader>nr', ':Notes retitle<CR>', { desc = 'Retitle note' })
vim.keymap.set('n', '<leader>ns', ':Notes search<CR>', { desc = 'Search through notes' })
vim.keymap.set('n', '<leader>nt', ':Notes toggle_tag<CR>', { desc = 'Toggle tag' })
vim.keymap.set('n', '<leader>ni', function()
  local notes = require 'notes'
  vim.cmd('edit ' .. vim.fn.expand(notes.dir .. '/*--inbox__*'))
end, { desc = 'Open inbox' })

require('notes').setup {
  dir = '~/Dropbox/denoted',
}

local findNotes = function()
  local notes = require 'notes'

  MiniPick.builtin.files(nil, { source = { cwd = notes.dir } })
end

local searchNotes = function()
  local notes = require 'notes'

  MiniPick.builtin.grep_live(nil, { source = { cwd = notes.dir } })
end

vim.keymap.set('n', '<leader>nn', findNotes, { desc = 'Find note' })
vim.keymap.set('n', '<leader>ns', searchNotes, { desc = 'Search notes' })
-- vim.keymap.set('n', '<leader>nn', ':Notes find<CR>', { desc = 'Find note' })
-- vim.keymap.set('n', '<leader>ns', ':Notes search<CR>', { desc = 'Search through notes' })

vim.keymap.set('n', '<leader>nc', ':Notes create<CR>', { desc = 'Create note' })
vim.keymap.set('n', '<leader>nl', ':Notes link_to_note<CR>', { desc = 'Link to note' })
vim.keymap.set('n', '<leader>nr', ':Notes retitle<CR>', { desc = 'Retitle note' })
vim.keymap.set('n', '<leader>nt', ':Notes toggle_tag<CR>', { desc = 'Toggle tag' })
vim.keymap.set('n', '<leader>ni', function()
  local notes = require 'notes'
  vim.cmd('edit ' .. vim.fn.expand(notes.dir .. '/*--inbox__*'))
end, { desc = 'Open inbox' })

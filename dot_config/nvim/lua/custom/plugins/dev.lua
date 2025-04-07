return {
  {
    dir = '~/Code/nvim/notes.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local notes = require 'notes'

      vim.g.notes_dir = '/Users/ssimonsen/Library/CloudStorage/Dropbox/denoted'

      vim.keymap.set('n', '<leader>nn', notes.find_note, { desc = 'Find note' })
      vim.keymap.set('n', '<leader>ns', notes.search_notes, { desc = 'Search notes' })
      vim.keymap.set('n', '<leader>nl', notes.link_to_note, { desc = 'Link to note' })
      vim.keymap.set('n', '<leader>nt', notes.toggle_tag, { desc = 'Toggle tag' })
      vim.keymap.set('n', '<leader>nr', notes.retitle, { desc = 'Retitle note' })
    end,
  },
}

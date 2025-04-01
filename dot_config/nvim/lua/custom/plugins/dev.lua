return {
  {
    dir = '~/Code/nvim/notes.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local dir = '/Users/ssimonsen/Library/CloudStorage/Dropbox/denoted'
      local notes = require 'notes'

      vim.keymap.set('n', '<leader>nn', function()
        notes.find_note {
          dir = dir,
        }
      end, { desc = 'Find note' })

      vim.keymap.set('n', '<leader>ns', function()
        notes.search_notes {
          dir = dir,
        }
      end, { desc = 'Search notes' })

      vim.keymap.set('n', '<leader>nl', function()
        notes.link_to_note {
          dir = dir,
        }
      end, { desc = 'Link to note' })

      vim.keymap.set('n', '<leader>nt', function()
        notes.toggle_tag {
          dir = dir,
        }
      end, { desc = 'Toggle tag' })
    end,
  },
}

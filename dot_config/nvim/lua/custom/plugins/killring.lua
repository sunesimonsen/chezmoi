return {
  {
    dir = '~/Code/nvim/killring.nvim',
    config = function()
      local killring = require 'killring'
      killring.setup()
      vim.keymap.set('n', '<leader>yy', ':KillRing<cr>', { desc = 'Paste from killring' })
    end,
  },
}

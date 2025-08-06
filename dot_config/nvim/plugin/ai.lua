local deps = require 'custom.deps'
deps.add 'robitx/gp.nvim'

require('gp').setup {
  openai_api_key = os.getenv 'OPENAI_API_KEY',
  providers = {
    openai = {
      endpoint = os.getenv 'OPENAI_BASE_URL' .. '/chat/completions',
    },
  },
}

vim.keymap.set('n', '<leader>ar', ':GpRewrite<CR>', { desc = 'Rewrite' })
vim.keymap.set('n', '<leader>arb', ':%GpRewrite<CR>', { desc = 'Rewrite buffer' })
vim.keymap.set('n', '<leader>acn', ':GpChatNew<CR>', { desc = 'New chat' })
vim.keymap.set('n', '<leader>acf', ':GpChatFinder<CR>', { desc = 'Find chat' })
vim.keymap.set('n', '<leader>act', ':GpChatToggle<CR>', { desc = 'Toggle chat' })
vim.keymap.set('n', '<leader>acp', ':%GpChatPaste<CR>', { desc = 'Paste buffer into chat' })
vim.keymap.set('n', '<leader>acp', ':GpChatPaste<CR>', { desc = 'Paste buffer into chat' })
vim.keymap.set('n', '<leader>acb', ':%GpChatNew<CR>', { desc = 'New chat - with buffer' })
vim.keymap.set('n', '<leader>acn', ':GpChatNew<CR>', { desc = 'New chat' })

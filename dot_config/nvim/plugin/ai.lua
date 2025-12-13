local openai_api_key = os.getenv 'OPENAI_API_KEY'

if openai_api_key then
  require('gp').setup {
    openai_api_key = openai_api_key,
    providers = {
      openai = {
        endpoint = os.getenv 'OPENAI_BASE_URL' .. '/chat/completions',
      },
    },
  }

  vim.keymap.set('v', '<leader>ar', ':GpRewrite<CR>', { desc = 'Rewrite' })
  vim.keymap.set('n', '<leader>ar', ':%GpRewrite<CR>', { desc = 'Rewrite buffer' })
  vim.keymap.set({ 'n', 'v' }, '<leader>acn', ':GpChatNew<CR>', { desc = 'New chat' })
  vim.keymap.set('n', '<leader>acf', ':GpChatFinder<CR>', { desc = 'Find chat' })
  vim.keymap.set('n', '<leader>act', ':GpChatToggle<CR>', { desc = 'Toggle chat' })
  vim.keymap.set('n', '<leader>acp', ':%GpChatPaste<CR>', { desc = 'Paste buffer into chat' })
  vim.keymap.set('v', '<leader>acp', ':GpChatPaste<CR>', { desc = 'Paste buffer into chat' })
  vim.keymap.set('n', '<leader>acb', ':%GpChatNew<CR>', { desc = 'New chat - with buffer' })
end

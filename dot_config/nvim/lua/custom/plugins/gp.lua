return {
  'robitx/gp.nvim',
  opts = {
    openai_api_key = os.getenv 'OPENAI_API_KEY',
    providers = {
      openai = {
        endpoint = os.getenv 'OPENAI_BASE_URL' .. '/chat/completions',
      },
    },
  },
  keys = {
    { '<leader>ar', ':GpRewrite<CR>', desc = 'Rewrite', mode = { 'v' } },
    { '<leader>arb', ':%GpRewrite<CR>', desc = 'Rewrite buffer', mode = { 'n' } },
    { '<leader>acn', ':GpChatNew<CR>', desc = 'New chat', mode = { 'n' } },
    { '<leader>acf', ':GpChatFinder<CR>', desc = 'Find chat', mode = { 'n' } },
    { '<leader>act', ':GpChatToggle<CR>', desc = 'Toggle chat', mode = { 'n' } },
    { '<leader>acp', ':%GpChatPaste<CR>', desc = 'Paste buffer into chat', mode = { 'n' } },
    { '<leader>acp', ':GpChatPaste<CR>', desc = 'Paste buffer into chat', mode = { 'v' } },
    { '<leader>acb', ':%GpChatNew<CR>', desc = 'New chat - with buffer', mode = { 'n' } },
    { '<leader>acn', ':GpChatNew<CR>', desc = 'New chat', mode = { 'v' } },
  },
}

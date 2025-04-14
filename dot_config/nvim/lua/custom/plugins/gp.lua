return {
  'robitx/gp.nvim',
  config = function()
    require('gp').setup {
      openai_api_key = os.getenv 'OPENAI_API_KEY',
      providers = {
        openai = {
          endpoint = os.getenv 'OPENAI_BASE_URL' .. '/chat/completions',
        },
      },
    }
  end,
}

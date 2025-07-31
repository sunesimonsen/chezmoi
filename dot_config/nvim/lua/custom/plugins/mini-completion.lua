return {
  'echasnovski/mini.completion',
  opts = {
    delay = {
      completion = 10 ^ 10,
      info = 500,
      signature = 500,
    },
    lsp_completion = {
      snippet_insert = function(snippet)
        vim.snippet.expand(snippet)
      end,
    },
  },
}

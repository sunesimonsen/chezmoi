return {
  setup = function()
    vim.snippet.add('if', 'if ${1:condition} {\n  $0\n}')
  end,
}

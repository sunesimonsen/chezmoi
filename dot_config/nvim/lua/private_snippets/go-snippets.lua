return {
  setup = function()
    vim.snippet.add('if', 'if ${1:condition} {\n  $0\n}')
    vim.snippet.add('fun', 'func ${1:name}($2) $3 => {\n  $0\n}')
  end,
}

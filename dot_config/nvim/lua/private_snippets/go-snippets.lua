return {
  setup = function()
    vim.snippet.add('if', 'if ${1:condition} {\n  $0\n}')
    vim.snippet.add('else', 'else {\n  $0\n}')
    vim.snippet.add('fun', 'func ${1:name}($2) $3 {\n  $0\n}')
    vim.snippet.add('met', 'func (${1:received}) ${2:name}($3) $4 {\n  $0\n}')
  end,
}

return {
  setup = function()
    vim.snippet.add('else', 'else {\n  $0\n}')
    vim.snippet.add('fun', 'func ${1:name}($2) $3 {\n  $0\n}')
    vim.snippet.add('fn', 'func ($1) $2 {\n  $0\n}')
    vim.snippet.add('if', 'if ${1:condition} {\n  $0\n}')
    vim.snippet.add('ife', 'if err != nil {\n  return $0\n}')
    vim.snippet.add('errorf', 'fmt.Errorf("%w: %s", err, "$0")')
    vim.snippet.add('met', 'func (${1:received}) ${2:name}($3) $4 {\n  $0\n}')
  end,
}

return {
  setup = function()
    vim.snippet.add('class', 'class ${1:name} {\n  $0\n}')
    vim.snippet.add('const', 'const ${1:name} = $2')
    vim.snippet.add('describe', 'describe("$1", () => {\n  $0\n})')
    vim.snippet.add('else', 'else {\n  $0\n}')
    vim.snippet.add('fn', '($1) => {\n  $0\n}')
    vim.snippet.add('for', 'for (const ${1:item} of ${2:items}) {\n  $0\n}')
    vim.snippet.add('fori', 'for (let i = 0; i < ${1:arr}.length - 1; i++) {\n  $0\n}')
    vim.snippet.add('fun', 'const $1 = ($2) => {\n  $0\n}')
    vim.snippet.add('if', 'if (${1:condition}) {\n  $0\n}')
    vim.snippet.add('it', 'it("$1", () => {\n  $0\n})')
    vim.snippet.add('let', 'let ${1:name} = $2')
    vim.snippet.add('log', 'console.log($0)')
    vim.snippet.add('logv', 'console.log("$1", $1)')
  end,
}

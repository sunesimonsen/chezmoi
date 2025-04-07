return {
  setup = function()
    vim.snippet.add('fn', 'function ($1)\n  $0\nend')
    vim.snippet.add('lfn', 'local function ${1:name}($2)\n  $0\nend')
    vim.snippet.add('var', 'local ${1:name} = $2')
    vim.snippet.add('if', 'if ${1:condition} then\n  $0\nend')
    vim.snippet.add('elseif', 'elseif ${1:condition} then')
    vim.snippet.add('for', 'for ${1:key}, ${2:value} in pairs(${3:table}) do\n  $0\nend')
    vim.snippet.add('fori', 'for i=${1:1}, ${2:end} do\n  $0\nend')
    vim.snippet.add('forl', 'for ${1:index}, ${2:value} in ipairs(${3:list}) do\n  $0\nend')
  end,
}

return {
  setup = function()
    vim.snippet.add('before', 'before do\n  $0\nend')
    vim.snippet.add('context', 'context "$1" do\n  $0\nend')
    vim.snippet.add('def', 'def ${1:name}(${2:args})\n  $0\nend')
    vim.snippet.add('describe', 'describe "$1" do\n  $0\nend')
    vim.snippet.add('let', 'let(:${1:name}) { $0 }')
    vim.snippet.add('do', 'do\n  $0\nend')
    vim.snippet.add('if', 'if ${1:condition} \n  $0\nend')
    vim.snippet.add('it', 'it "$1" do\n  $0\nend')
    vim.snippet.add('let', 'let(:${1:name}) { $0 }')
  end,
}

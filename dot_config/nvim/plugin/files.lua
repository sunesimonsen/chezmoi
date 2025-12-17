require('mini.files').setup()

vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<leader>dd', function()
  MiniFiles.open(vim.fn.expand '%:p:h')
end, { desc = 'Edit current directory' })

vim.keymap.set('n', '<leader>dp', MiniFiles.open, { desc = 'Edit current directory' })

local function get_git_path()
  return vim.fn.trim(vim.fn.system 'git rev-parse --show-toplevel')
end

vim.keymap.set('n', '<leader>dg', function()
  local ok, path = pcall(get_git_path)
  if ok then
    MiniFiles.open(path)
  else
    MiniFiles.open()
  end
end, { desc = 'Edit current directory' })

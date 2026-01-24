require('mini.visits').setup()
require('oil').setup { view_options = { show_hidden = true } }

vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<leader>dd', ':Oil<CR>', { desc = 'Edit current directory' })

vim.keymap.set('n', '<leader>dp', ':Oil .<CR>', { desc = 'Edit current directory' })

local function get_git_path()
  return vim.fn.trim(vim.fn.system 'git rev-parse --show-toplevel')
end

vim.keymap.set('n', '<leader>dg', function()
  local ok, path = pcall(get_git_path)
  if ok then
    vim.cmd('Oil ' .. path)
  else
    vim.cmd 'Oil'
  end
end, { desc = 'Edit current directory' })

vim.keymap.set('n', '<leader>fn', ':e %:p:h/', { desc = 'New file' })

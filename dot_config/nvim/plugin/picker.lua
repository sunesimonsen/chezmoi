require('project_nvim').setup {
  detection_methods = { 'pattern' },
  patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.project' },
  scope_chdir = 'tab',
}

require('mini.pick').setup()
require('mini.extra').setup()

local paths = require 'custom.paths'

vim.keymap.set('n', '<leader>*', ":Pick grep pattern='<cword>'<cr>", { desc = 'Search current word' })
vim.keymap.set('n', "<leader>'", ':Pick resume<cr>', { desc = 'Search resume' })

vim.keymap.set('n', '<leader>bb', ':Pick buffers<cr>', { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fr', ':Pick oldfiles<cr>', { desc = 'Search recent files' })

vim.keymap.set('n', '<leader>es', ':Pick diagnostic<cr>', { desc = 'Search diagnostics' })

vim.keymap.set('n', '<leader>sh', ':Pick help<cr>', { desc = 'Search help' })
vim.keymap.set('n', '<leader>sk', ':Pick keymaps<cr>', { desc = 'Search keymaps' })

vim.keymap.set('n', '<leader>sp', ':Pick grep_live<cr>', { desc = 'Search with grep' })

vim.keymap.set('n', '<leader>sd', function()
  MiniPick.builtin.grep_live(nil, { source = { cwd = vim.fn.expand '%:p:h' } })
end, { desc = 'Search with grep (dir)' })

vim.keymap.set('n', '<leader>sc', ':Pick commands<cr>', { desc = 'Search commands' })

vim.keymap.set('n', '<leader>qs', ":Pick list scope='quickfix'", { desc = 'Search quickfixes' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>ss', ":Pick buf_lines scope='current'<cr>", { desc = 'Search buffer' })

vim.keymap.set('n', '<leader>ff', ':Pick files<cr>', { desc = 'Search project files' })

vim.keymap.set('n', '<leader>fg', function()
  MiniPick.builtin.files(nil, { source = { cwd = paths.get_git_path() } })
end, { desc = 'Search Git files' })

vim.keymap.set('n', '<leader>fd', function()
  MiniPick.registry.explorer({ cwd = vim.fn.expand '%:p:h' }, nil)
end, { desc = 'Browse' })

vim.keymap.set('n', '<leader>pd', ':Pick explorer<cr>', { desc = 'Browse project dir' })

local function get_file_name(path)
  return path:match '([^/\\]+)$'
end

MiniPick.registry.project = function()
  local projects = require('project_nvim').get_recent_projects()

  local items = {}

  for _, value in pairs(projects) do
    if not string.find(value, '/node_modules/') then
      table.insert(items, value)
    end
  end

  table.sort(items, function(a, b)
    return string.lower(a) < string.lower(b)
  end)

  vim.ui.select(items, {
    prompt = 'Project:',
    format_item = get_file_name,
  }, function(path)
    if path then
      MiniPick.builtin.files(nil, { source = { cwd = path } })
    else
      vim.notify('No project selected', vim.log.levels.WARN)
    end
  end)
end

vim.keymap.set('n', '<leader>pp', ':Pick project<cr>', { desc = 'Search projects' })

vim.keymap.set('n', '<leader>tp', function()
  vim.cmd 'tabnew %'
  MiniPick.registry.project()
end, { desc = 'Tab search projects' })

vim.keymap.set('n', '<leader>sS', ':Pick buf_lines<cr>', { desc = 'Search buffers' })

vim.keymap.set('n', '<leader>vf', function()
  MiniPick.builtin.files(nil, { source = { cwd = vim.fn.stdpath 'config' } })
end, { desc = 'Search Neovim files' })

vim.keymap.set('n', '<leader>vs', function()
  MiniPick.builtin.grep_live(nil, { source = { cwd = vim.fn.stdpath 'config' } })
end, { desc = 'Search Neovim files' })

vim.keymap.set('n', '<leader>vc', ':Pick colorschemes<cr>', { desc = 'Colorschemes' })

vim.keymap.set('n', '<leader>gb', ':Pick git_branches<cr>', { desc = 'Search Git branches' })
vim.keymap.set('n', '<leader>gc', ':Pick git_commits<cr>', { desc = 'Search Git commits' })
vim.keymap.set('n', '<leader>gl', ":Pick git_commits path='%'<cr>", { desc = 'Search file log' })
vim.keymap.set('n', '<leader>gs', ':Pick git_hunks<cr>', { desc = 'Search Git status' })

vim.keymap.set('n', '<leader>yr', ':Pick registers<cr>', { desc = 'Yank register' })

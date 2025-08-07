vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Tab close' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Tab only' })
vim.keymap.set('n', '<C-j>', ':tabnext<CR>', { desc = 'Tab next' })
vim.keymap.set('n', '<C-k>', ':tabprevious<CR>', { desc = 'Tab previous' })

local function get_path()
  local path = vim.fn.expand '%:p:h'
  if string.match(path, '^term') then
    return nil
  end

  return path
end

local runInTerminal = function(path, command)
  vim.cmd 'tabnew'
  if path ~= nil then
    vim.cmd('tcd ' .. path)
    vim.cmd('term cd ' .. path .. '; ' .. command)
  else
    vim.cmd 'term'
  end
  vim.cmd 'startinsert'
end

local openTerminalInTab = function()
  local path = vim.fn.expand '%:p:h'

  runInTerminal(path, '$SHELL')
end

vim.keymap.set('n', '<leader>tt', openTerminalInTab, { desc = 'Tab terminal' })

local openProjectTerminalInTab = function()
  local path = require('project_nvim.project').find_pattern_root()

  runInTerminal(path, '$SHELL')
end

vim.keymap.set('n', '<leader>t<S-t>', openProjectTerminalInTab, { desc = 'Tab terminal (project)' })

local openLazyGit = function()
  local path = require('project_nvim.project').find_pattern_root()

  runInTerminal(path, 'lazygit')
end

vim.keymap.set('n', '<leader>gg', openLazyGit, { desc = 'Lazygit' })

local openDirBrowser = function(path)
  vim.cmd 'tabnew'
  if path then
    vim.cmd('tcd ' .. path)
  end
  vim.cmd 'Oil'
end

local function get_git_path()
  return vim.fn.trim(vim.fn.system 'git rev-parse --show-toplevel')
end

vim.keymap.set('n', '<leader>gd', function()
  local ok, path = pcall(get_git_path)
  if ok then
    openDirBrowser(path)
  else
    local project_path = require('project_nvim.project').find_pattern_root()
    openDirBrowser(project_path)
  end
end, { desc = 'Open git dir in tab' })

vim.keymap.set('n', '<leader>pd', function()
  local path = require('project_nvim.project').find_pattern_root()
  openDirBrowser(path)
end, { desc = 'Open project dir in tab' })

local openTabInBufDir = function()
  local path = get_path()

  vim.cmd 'tabnew'
  if path then
    vim.cmd('tcd ' .. path)
  end
end

vim.keymap.set('n', '<leader>tn', openTabInBufDir, { desc = 'Tab create' })

vim.keymap.set('n', '<leader>td', function()
  openDirBrowser(get_path())
end, { desc = 'Open dir in tab' })

for i = 1, 4 do
  vim.keymap.set('n', '<leader>t' .. i, i .. 'gt', { desc = 'Tab ' .. i })
end

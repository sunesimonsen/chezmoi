vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Tab close' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Tab only' })
vim.keymap.set('n', '<C-j>', ':tabnext<CR>', { desc = 'Tab next' })
vim.keymap.set('n', '<C-k>', ':tabprevious<CR>', { desc = 'Tab previous' })
vim.keymap.set('n', '<leader>tgf', '<C-w>gf', { desc = 'Goto file' })
vim.keymap.set('n', '<leader>tgF', '<C-w>gF', { desc = 'Goto file with line number' })

local function get_path()
  local path = vim.fn.expand '%:p:h'
  if string.match(path, '^term') then
    return nil
  end

  return path
end

local function get_project_path()
  return require('project_nvim.project').find_pattern_root()
end

local function get_git_path()
  return vim.fn.trim(vim.fn.system 'git rev-parse --show-toplevel')
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

vim.keymap.set('n', '<leader>t<S-t>', openTerminalInTab, { desc = 'Tab terminal' })

vim.keymap.set('n', '<leader>gt', function()
  local path = get_git_path()
  runInTerminal(path, '$SHELL')
end, { desc = 'Tab terminal (git dir)' })

local openProjectTerminalInTab = function()
  local path = get_project_path()

  runInTerminal(path, '$SHELL')
end

vim.keymap.set('n', '<leader>tt', openProjectTerminalInTab, { desc = 'Tab terminal (project)' })

local openLazyGit = function()
  local path = get_project_path()

  runInTerminal(path, 'lazygit')
end

vim.keymap.set('n', '<leader>gg', openLazyGit, { desc = 'Lazygit' })

local openTabInBufDir = function()
  local path = get_path()

  vim.cmd 'tabnew'
  if path then
    vim.cmd('tcd ' .. path)
  end
end

vim.keymap.set('n', '<leader>tn', openTabInBufDir, { desc = 'Tab create' })

local commands = {
  {
    dir = 'project',
    command = 'yarn test --watch',
  },
  {
    dir = 'git',
    command = 'yarn lint',
  },
  {
    dir = 'git',
    command = 'yarn build',
  },
  {
    dir = 'git',
    command = 'yarn install',
  },
  {
    dir = 'git',
    command = 'bundle exec rubocop -a',
  },
  {
    dir = 'git',
    command = 'bundle exec rspec',
  },
}

vim.keymap.set('n', '<leader>tr', function()
  vim.ui.select(commands, {
    prompt = 'Command:',
    format_item = function(item)
      return item.command
    end,
  }, function(choice)
    if not choice then
      return
    end

    local path
    if choice.dir == 'project' then
      path = get_project_path()
    elseif choice.dir == 'git' then
      path = get_git_path()
    else
      path = get_path()
    end

    runInTerminal(path, choice.command .. '; read -n1')
  end)
end, { desc = 'Run' })

for i = 1, 4 do
  vim.keymap.set('n', '<leader>t' .. i, i .. 'gt', { desc = 'Tab ' .. i })
end

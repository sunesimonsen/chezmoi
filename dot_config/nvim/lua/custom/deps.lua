-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath 'data' .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd 'packadd mini.nvim | helptags ALL'
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup { path = { package = path_package } }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local make = function(data)
  vim.system({ 'make' }, { cwd = data.path }):wait()
end

local add = MiniDeps.add

local add_and_make = function(source)
  add { source = source, hooks = { post_install = make, post_checkout = make } }
end

add 'folke/lazydev.nvim'

return {
  add = add,
  add_and_make = add_and_make,
  make = make,
}

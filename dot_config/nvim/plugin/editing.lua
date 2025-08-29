local deps = require 'custom.deps'

deps.add { source = 'echasnovski/mini.completion', checkout = '7254cce7766f330170318c8bd4826ec3a3aac183' }

require('mini.completion').setup {
  delay = {
    completion = 10 ^ 10,
    info = 500,
    signature = 500,
  },
  lsp_completion = {
    snippet_insert = function(snippet)
      vim.snippet.expand(snippet)
    end,
  },
}

deps.add { source = 'folke/flash.nvim', checkout = '3c942666f115e2811e959eabbdd361a025db8b63' }

require('flash').setup {
  modes = {
    search = {
      enabled = false,
    },
  },
}

vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
  require('flash').jump()
end, { desc = 'Flash' })

vim.keymap.set({ 'n', 'x', 'o' }, '<leader>jv', function()
  require('flash').treesitter {
    label = { before = true, after = true },
  }
end, { desc = 'Treesitter select' })

vim.keymap.set({ 'n', 'x', 'o' }, '<leader>jj', function()
  require('flash').treesitter {
    jump = {
      pos = 'start',
      autojump = false,
    },
    label = { before = true, after = false },
  }
end, { desc = 'Treesitter jump' })

deps.add { source = 'kylechui/nvim-surround', checkout = 'c271c9082886a24866353764cf96c9d957e95b2b' }
require('nvim-surround').setup {}

deps.add { source = 'sunesimonsen/killring.nvim', checkout = '33f7f25486371bf61abfd3805aae7ab1428197ad' }

require('killring').setup {}
vim.keymap.set('n', '<leader>yy', ':KillRing<CR>', { desc = 'View yank history' })

deps.add { source = 'poljar/typos.nvim', checkout = '9315badebfe72efd8020ae7b1d2f176903ea6794' }
require('typos').setup()

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

-- Fuzzy auto completion
vim.opt.completeopt = 'menuone,noinsert,fuzzy'

-- get contents of visual selection
-- handle unpack deprecation
table.unpack = table.unpack or unpack

local function get_visual()
  local _, ls, cs = table.unpack(vim.fn.getpos 'v')
  local _, le, ce = table.unpack(vim.fn.getpos '.')
  if ls < le or cs < ce then
    return vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce, {})
  else
    return vim.api.nvim_buf_get_text(0, le - 1, ce - 1, ls - 1, cs, {})
  end
end

vim.keymap.set('v', '<C-r>', function()
  local pattern = table.concat(get_visual())
  -- escape regex and line endings
  pattern = vim.fn.substitute(vim.fn.escape(pattern, '^$.*\\/~[]'), '\n', '\\n', 'g')
  -- send parsed substitution command to command line
  vim.api.nvim_input('<Esc>:.,$s/' .. pattern .. '//gc<Left><Left><Left>')
end)

-- Center on page jumps
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

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

require('mini.jump').setup()

local jump2d = require 'mini.jump2d'
jump2d.setup()

vim.keymap.set({ 'n', 'x', 'o' }, '<cr>', function()
  local gen_spotter = jump2d.gen_spotter
  local function jump_to_word()
    local res = {
      allowed_lines = { blank = false, fold = false },
    }

    local before_start = function()
      local input = vim.fn.getcharstr()
      -- Allow user to cancel input and not show any jumping spots
      if input == nil then
        return
      end
      res.spotter = gen_spotter.vimpattern('\\c\\<' .. vim.pesc(input) .. '\\k\\+')
    end
    res.hooks = { before_start = before_start }

    return res
  end

  jump2d.start(jump_to_word())
end, { desc = 'Jump to word' })

require('mini.surround').setup { respect_selection_type = true }
require('mini.pairs').setup()
require('mini.bracketed').setup()

local spec_treesitter = require('mini.ai').gen_spec.treesitter
require('mini.ai').setup {
  custom_textobjects = {
    F = spec_treesitter {
      a = '@function.outer',
      i = '@function.inner',
    },
    o = spec_treesitter {
      a = { '@conditional.outer', '@loop.outer' },
      i = { '@conditional.inner', '@loop.inner' },
    },
  },
}

require('killring').setup()
vim.keymap.set('n', '<leader>yy', ':KillRing<CR>', { desc = 'View yank history' })

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

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

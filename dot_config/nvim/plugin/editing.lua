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

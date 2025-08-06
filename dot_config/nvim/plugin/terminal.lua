vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Configure new terminals',
  group = vim.api.nvim_create_augroup('custom-terminal-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('TermClose', {
  desc = 'Cleanup existed terms',
  group = vim.api.nvim_create_augroup('custom-terminal-process-exit', { clear = true }),
  callback = function()
    vim.schedule(function()
      vim.cmd 'bdelete'
    end)
  end,
})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[><C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

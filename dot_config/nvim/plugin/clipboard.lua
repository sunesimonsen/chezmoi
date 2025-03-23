-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Copy/paste with system clipboard
-- vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
-- vim.keymap.set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })

-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
-- vim.keymap.set('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })

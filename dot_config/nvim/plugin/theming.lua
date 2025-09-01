vim.opt.cursorline = true

vim.cmd.colorscheme 'tokyonight'

-- Make comments brighter
vim.api.nvim_set_hl(0, 'Comment', { fg = '#848ebb' })
vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#848ebb' })

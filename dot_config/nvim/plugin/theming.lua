local deps = require 'custom.deps'

vim.opt.cursorline = true

deps.add { source = 'folke/tokyonight.nvim', checkout = '057ef5d260c1931f1dffd0f052c685dcd14100a3' }

vim.cmd.colorscheme 'tokyonight'

-- Make comments brighter
vim.api.nvim_set_hl(0, 'Comment', { fg = '#848ebb' })
vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#848ebb' })

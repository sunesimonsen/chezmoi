if vim.b.current_compiler then
  return
end

vim.b.current_compiler = 'yarn-lint'

vim.opt_local.makeprg = "yarn eslint --format stylish `git diff --name-only -- '*.js' '*.ts' '*.tsx'`"
vim.opt_local.errorformat = [[%-P%f,%\s%#%l:%c %# %trror  %m,%\s%#%l:%c %# %tarning  %m,%-Q,%-G%.%#,]]

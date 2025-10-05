vim.cmd 'packadd cfilter'

local toggle_quickfix = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd 'cclose'
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd 'copen'
  end
end

vim.keymap.set('n', '<leader>qq', toggle_quickfix, { desc = 'Toggle quickfix' })
vim.keymap.set('n', '<leader>qd', ':cdo ', { desc = 'Quickfix do' })

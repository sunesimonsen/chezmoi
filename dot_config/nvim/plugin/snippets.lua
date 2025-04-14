---@param trigger string trigger string for snippet
---@param body string snippet text that will be expanded
---
---Refer to <https://microsoft.github.io/language-server-protocol/specification/#snippet_syntax>
---for the specification of valid body.
function vim.snippet.add(trigger, body)
  vim.keymap.set('ia', trigger, function()
    -- If abbrev is expanded with keys like "(", ")", "<cr>", "<space>",
    -- don't expand the snippet. Only accept "<c-]>" as trigger key.
    local c = vim.fn.nr2char(vim.fn.getchar(0))
    if c ~= '' then
      vim.api.nvim_feedkeys(trigger .. c, 'i', true)
      return
    end

    vim.snippet.expand(body)
  end, { buffer = 0 })
end

--- Opens the snippet file for the current file type
function vim.snippet.open()
  local filetype = vim.bo.filetype

  local snippetPath = '~/.config/nvim/lua/snippets/' .. filetype .. '-snippets.lua'

  vim.cmd('e ' .. snippetPath)
end

vim.keymap.set('n', '<leader>vos', vim.snippet.open, { desc = 'Open snippets' })

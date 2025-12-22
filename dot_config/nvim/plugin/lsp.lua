vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('config-lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto definition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto declaration' })
    vim.keymap.set('n', 'grr', ":Pick lsp scope='references'<cr>", { desc = 'Goto references' })
    vim.keymap.set('n', 'gri', ":Pick lsp scope='implementation'<cr>", { desc = 'Goto implementation' })
    vim.keymap.set('n', '<leader>ct', ":Pick lsp scope='type_definition'<cr>", { desc = 'Type definition' })
    vim.keymap.set('n', 'gO', ":Pick lsp scope='document_symbol'<cr>", { desc = 'Document symbols' })
    vim.keymap.set('n', '<leader>cc', ":Pick lsp scope='document_symbol'<cr>", { desc = 'Document symbols' })
    vim.keymap.set('n', '<leader>cw', ":Pick lsp scope='workspace_symbol_live'<cr>", { desc = 'Workspace symbols' })
    vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
  end,
})

local servers = {
  stylua = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  ts_ls = {},
  eslint = {},
  cssls = {},
  marksman = {},
  gopls = {},
}

require('mason-tool-installer').setup { ensure_installed = servers }
require('mason').setup()
require('fidget').setup {}

require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      vim.lsp.enable(server_name)
      vim.lsp.config(server_name, servers[server_name] or {})
      --TODO remove
      --local server = servers[server_name] or {}
      --require('lspconfig')[server_name].setup(server)
    end,
  },
}

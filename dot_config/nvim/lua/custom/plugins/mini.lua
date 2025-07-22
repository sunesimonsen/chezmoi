return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - Visually select Around [)]paren
      --  - yinq - Yank Inside Next Quote
      --  - ci'  - Change Inside [']quote
      require('mini.ai').setup { n_lines = 500 }

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

      require('mini.statusline').setup {
        use_icons = vim.g.have_nerd_font,
      }
    end,
  },
}

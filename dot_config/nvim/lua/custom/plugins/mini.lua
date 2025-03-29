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

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}

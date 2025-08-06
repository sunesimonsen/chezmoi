local deps = require 'custom.deps'

local post_tree_sitter = function(data)
  deps.make(data)
  vim.cmd 'TSUpdate'
end

deps.add {
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main',
  hooks = {
    post_install = post_tree_sitter,
    post_checkout = post_tree_sitter,
  },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'diff',
    'html',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
  },
  -- Autoinstall languages that are not installed
  auto_install = true,
  highlight = {
    enable = true,
    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<S-CR>',
    },
  },
}

deps.add 'nvim-treesitter/nvim-treesitter-textobjects'
deps.add 'echasnovski/mini.ai'

local spec_treesitter = require('mini.ai').gen_spec.treesitter
require('mini.ai').setup {
  custom_textobjects = {
    F = spec_treesitter { a = '@function.outer', i = '@function.inner' },
    o = spec_treesitter {
      a = { '@conditional.outer', '@loop.outer', '@function.outer', '@class.outer' },
      i = { '@conditional.inner', '@loop.inner' },
    },
  },
}

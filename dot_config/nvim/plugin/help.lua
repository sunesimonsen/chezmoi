local miniclue = require 'mini.clue'
miniclue.setup {
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    { mode = 'n', keys = '<Leader>m' },
    { mode = 'x', keys = '<Leader>m' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },

    -- `[` key
    { mode = 'n', keys = '[' },
    { mode = 'x', keys = '[' },

    -- `]` key
    { mode = 'n', keys = ']' },
    { mode = 'x', keys = ']' },

    -- `g` key
    { mode = 'n', keys = 's' },
    { mode = 'x', keys = 's' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),

    { mode = 'n', keys = '<leader>a', desc = '+AI' },
    { mode = 'n', keys = '<leader>ac', desc = '+Chat' },
    { mode = 'n', keys = '<leader>b', desc = '+Buffers' },
    { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
    { mode = 'n', keys = '<leader>c', desc = '+Code' },
    { mode = 'n', keys = '<leader>d', desc = '+Directories' },
    { mode = 'n', keys = '<leader>e', desc = '+Errors' },
    { mode = 'n', keys = '<leader>f', desc = '+Files' },
    { mode = 'n', keys = '<leader>g', desc = '+Git' },
    { mode = 'n', keys = '<leader>h', desc = '+Help' },
    { mode = 'n', keys = '<leader>j', desc = '+Jump' },
    { mode = 'n', keys = '<leader>m', desc = '+Move' },
    { mode = 'n', keys = '<Leader>mh', postkeys = '<Leader>m' },
    { mode = 'n', keys = '<Leader>mj', postkeys = '<Leader>m' },
    { mode = 'n', keys = '<Leader>mk', postkeys = '<Leader>m' },
    { mode = 'n', keys = '<Leader>ml', postkeys = '<Leader>m' },
    { mode = 'n', keys = '<leader>n', desc = '+Notes' },
    { mode = 'n', keys = '<leader>o', desc = '+Open' },
    { mode = 'n', keys = '<leader>p', desc = '+Projects' },
    { mode = 'n', keys = '<leader>pt', desc = '+Tests' },
    { mode = 'n', keys = '<leader>py', desc = '+Node' },
    { mode = 'n', keys = '<leader>q', desc = '+Quickfix' },
    { mode = 'n', keys = '<leader>r', desc = '+Run' },
    { mode = 'n', keys = '<leader>s', desc = '+Search' },
    { mode = 'n', keys = '<leader>t', desc = '+Tabs' },
    { mode = 'n', keys = '<leader>tg', desc = '+Goto' },
    { mode = 'n', keys = '<leader>v', desc = '+Vim' },
    { mode = 'n', keys = '<leader>vo', desc = '+Open' },
    { mode = 'n', keys = '<leader>w', desc = '+Windows' },
    { mode = 'n', keys = '<leader>x', desc = '+Execute' },
    { mode = 'n', keys = '<leader>y', desc = '+Yank' },
    { mode = 'v', keys = '<leader>ac', desc = '+Chat' },
    { mode = 'x', keys = '<Leader>mh', postkeys = '<Leader>m' },
    { mode = 'x', keys = '<Leader>mj', postkeys = '<Leader>m' },
    { mode = 'x', keys = '<Leader>mk', postkeys = '<Leader>m' },
    { mode = 'x', keys = '<Leader>ml', postkeys = '<Leader>m' },
  },
}

vim.keymap.set('n', '<leader>hh', ':Pick help<cr>', { desc = 'Search help' })
vim.keymap.set('n', '<leader>hk', ':Pick keymaps<cr>', { desc = 'Search keymaps' })

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
    'olimorris/neotest-rspec',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'yarn test --watch',
          jestConfigFile = 'jest.config.js',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        require 'neotest-rspec' {
          rspec_cmd = function()
            return vim
              .iter({
                'bundle',
                'exec',
                'rspec',
              })
              :flatten()
              :totable()
          end,
        },
      },
    }

    vim.keymap.set('n', '<leader>ptr', ':Neotest run<CR>', { desc = 'Run tests' })
    vim.keymap.set('n', '<leader>ptk', ':Neotest stop<CR>', { desc = 'Kill tests' })
    vim.keymap.set('n', '<leader>pts', ':Neotest summary<CR>', { desc = 'Toggle summary' })
  end,
}

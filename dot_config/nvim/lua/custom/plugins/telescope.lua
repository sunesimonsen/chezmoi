return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      { -- Projects
        'ahmedkhalf/project.nvim',
        config = function()
          require('project_nvim').setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end,
      },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },

        defaults = {
          layout_config = {
            horizontal = {
              width = 0.95,
              height = 0.95,
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension 'projects')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<leader>hs', builtin.help_tags, { desc = 'Search help' })
      vim.keymap.set('n', '<leader>hk', builtin.keymaps, { desc = 'Search keymaps' })

      vim.keymap.set('n', '<leader>*', builtin.grep_string, { desc = 'Search current word' })
      vim.keymap.set('n', "<leader>s'", builtin.resume, { desc = 'Search resume' })

      vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Search recent files' })

      vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = 'Search dianostics' })

      vim.keymap.set('n', '<leader>sp', builtin.live_grep, { desc = 'Search with grep' })
      vim.keymap.set('n', '<leader>sd', function()
        builtin.live_grep {
          cwd = require('telescope.utils').buffer_dir(),
        }
      end, { desc = 'Search with grep (dir)' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>ss', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end, { desc = 'Search buffer' })

      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files {
          cwd = require('project_nvim.project').find_pattern_root(),
        }
      end, { desc = 'Search project files' })

      vim.keymap.set('n', '<leader>fg', function()
        builtin.git_files {
          cwd = require('telescope.utils').buffer_dir(),
        }
      end, { desc = 'Search Git files' })

      vim.keymap.set('n', '<leader>fd', function()
        require('telescope').extensions.file_browser.file_browser { path = '%:p:h' }
      end, { desc = 'Browse' })

      vim.keymap.set('n', '<leader>pp', function()
        require('telescope').extensions.projects.projects {}
      end, { desc = 'Search projects' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>sS', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search buffers' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>vs', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files' })

      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search Git branches' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search Git status' })
    end,
  },
}

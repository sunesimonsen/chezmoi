local deps = require 'custom.deps'

deps.add {
  source = 'nvim-telescope/telescope-fzf-native.nvim',
  checkout = '1f08ed60cafc8f6168b72b80be2b2ea149813e55',
  hooks = { post_install = deps.make, post_checkout = deps.make },
}
deps.add { source = 'nvim-lua/plenary.nvim', checkout = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509' }
deps.add { source = 'nvim-telescope/telescope-ui-select.nvim', checkout = '6e51d7da30bd139a6950adf2a47fda6df9fa06d2' }
deps.add { source = 'nvim-telescope/telescope-live-grep-args.nvim', checkout = 'b80ec2c70ec4f32571478b501218c8979fab5201' }
deps.add { source = 'nvim-telescope/telescope-file-browser.nvim', checkout = '3610dc7dc91f06aa98b11dca5cc30dfa98626b7e' }
deps.add { source = 'nvim-tree/nvim-web-devicons', checkout = '3362099de3368aa620a8105b19ed04c2053e38c0' }
deps.add { source = 'DrKJeff16/project.nvim', checkout = '8c6bad7d22eef1b71144b401c9f74ed01526a4fb' }
deps.add { source = 'nvim-telescope/telescope.nvim', checkout = 'b4da76be54691e854d3e0e02c36b0245f945c2c7' }

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-'>"] = require('telescope.actions.layout').toggle_preview,
      },
    },
    preview = {
      hide_on_startup = true,
    },
    layout_config = {
      horizontal = {
        width = 0.95,
        height = 0.95,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
    fzf = {
      fuzzy = false,
    },
  },
}

require('project_nvim').setup {
  detection_methods = { 'pattern' },
  patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.project' },
  scope_chdir = 'tab',
}

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'ui-select'
require('telescope').load_extension 'projects'
require('telescope').load_extension 'live_grep_args'

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = 'Search registers' })

vim.keymap.set('n', '<leader>*', require('telescope.builtin').grep_string, { desc = 'Search current word' })
vim.keymap.set('n', "<leader>'", require('telescope.builtin').resume, { desc = 'Search resume' })

vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Search recent files' })

vim.keymap.set('n', '<leader>es', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search help' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = 'Search keymaps' })

vim.keymap.set('n', '<leader>sp', function()
  require('telescope').extensions.live_grep_args.live_grep_args()
end, { desc = 'Search with grep' })

vim.keymap.set('n', '<leader>sd', function()
  require('telescope').extensions.live_grep_args.live_grep_args {
    search_dirs = { require('telescope.utils').buffer_dir() },
  }
end, { desc = 'Search with grep (dir)' })

vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = 'Search commands' })

vim.keymap.set('n', '<leader>qs', require('telescope.builtin').quickfix, { desc = 'Search quickfixes' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Search buffer' })

vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files {
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    cwd = require('project_nvim.project').find_pattern_root(),
  }
end, { desc = 'Search project files' })

vim.keymap.set('n', '<leader>tf', function()
  vim.cmd 'tabnew %'
  require('telescope.builtin').find_files {
    cwd = require('project_nvim.project').find_pattern_root(),
  }
end, { desc = 'Tab search project files' })

vim.keymap.set('n', '<leader>ts', function()
  vim.cmd 'tabnew %'
  require('telescope.builtin').live_grep {
    cwd = require('project_nvim.project').find_pattern_root(),
  }
end, { desc = 'Tab search project files' })

vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').git_files {
    cwd = require('telescope.utils').buffer_dir(),
  }
end, { desc = 'Search Git files' })

vim.keymap.set('n', '<leader>fd', function()
  require('telescope').extensions.file_browser.file_browser {
    path = '%:p:h',
    select_buffer = true,
    no_ignore = true,
    respect_gitignore = false,
  }
end, { desc = 'Browse' })

vim.keymap.set('n', '<leader>pp', function()
  require('telescope').extensions.projects.projects {}
end, { desc = 'Search projects' })

vim.keymap.set('n', '<leader>tp', function()
  vim.cmd 'tabnew %'
  require('telescope').extensions.projects.projects {}
end, { desc = 'Tab search projects' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>sS', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Search buffers' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>vf', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim files' })

vim.keymap.set('n', '<leader>vs', function()
  require('telescope.builtin').live_grep { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim files' })

vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'Search Git branches' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'Search Git commits' })
vim.keymap.set('n', '<leader>gl', require('telescope.builtin').git_bcommits, { desc = 'Search file log' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search Git status' })

vim.keymap.set('n', '<leader>yr', require('telescope.builtin').registers, { desc = 'Yarn register' })

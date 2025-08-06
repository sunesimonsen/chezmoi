local deps = require 'custom.deps'

deps.add_and_make 'nvim-telescope/telescope-fzf-native.nvim'
deps.add 'nvim-lua/plenary.nvim'
deps.add 'nvim-telescope/telescope-fzf-native.nvim'
deps.add 'nvim-telescope/telescope-ui-select.nvim'
deps.add 'nvim-telescope/telescope-live-grep-args.nvim'
deps.add 'nvim-telescope/telescope-file-browser.nvim'
deps.add 'nvim-tree/nvim-web-devicons'
deps.add 'ahmedkhalf/project.nvim'
deps.add 'nvim-telescope/telescope.nvim'

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
pcall(require('telescope').load_extension 'live_grep_args')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>sr', builtin.registers, { desc = 'Search registers' })

vim.keymap.set('n', '<leader>*', builtin.grep_string, { desc = 'Search current word' })
vim.keymap.set('n', "<leader>'", builtin.resume, { desc = 'Search resume' })

vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Search recent files' })

vim.keymap.set('n', '<leader>es', builtin.diagnostics, { desc = 'Search diagnostics' })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })

vim.keymap.set('n', '<leader>sp', function()
  require('telescope').extensions.live_grep_args.live_grep_args()
end, { desc = 'Search with grep' })

vim.keymap.set('n', '<leader>sd', function()
  require('telescope').extensions.live_grep_args.live_grep_args {
    search_dirs = { require('telescope.utils').buffer_dir() },
  }
end, { desc = 'Search with grep (dir)' })

vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = 'Search commands' })

vim.keymap.set('n', '<leader>qs', builtin.quickfix, { desc = 'Search quickfixes' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>ss', builtin.current_buffer_fuzzy_find, { desc = 'Search buffer' })

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files {
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    cwd = require('project_nvim.project').find_pattern_root(),
  }
end, { desc = 'Search project files' })

vim.keymap.set('n', '<leader>tf', function()
  vim.cmd 'tabnew %'
  builtin.find_files {
    cwd = require('project_nvim.project').find_pattern_root(),
  }
end, { desc = 'Tab search project files' })

vim.keymap.set('n', '<leader>ts', function()
  vim.cmd 'tabnew %'
  builtin.live_grep {
    cwd = require('project_nvim.project').find_pattern_root(),
  }
end, { desc = 'Tab search project files' })

vim.keymap.set('n', '<leader>fg', function()
  builtin.git_files {
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
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Search buffers' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>vf', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim files' })

vim.keymap.set('n', '<leader>vs', function()
  builtin.live_grep { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim files' })

vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search Git branches' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search Git commits' })
vim.keymap.set('n', '<leader>gl', builtin.git_bcommits, { desc = 'Search file log' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search Git status' })

vim.keymap.set('n', '<leader>yr', builtin.registers, { desc = 'Yarn register' })

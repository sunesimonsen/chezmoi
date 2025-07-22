return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 400,

      -- Document existing key chains
      spec = {
        { '<leader>a', group = 'AI' },
        { '<leader>ac', group = 'Chat' },
        { '<leader>ar', group = 'Rewrite' },
        { '<leader>b', group = 'Buffers' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Directories' },
        { '<leader>e', group = 'Errors' },
        { '<leader>f', group = 'Files' },
        { '<leader>g', group = 'Git' },
        { '<leader>y', group = 'Yank' },
        { '<leader>h', group = 'Help' },
        { '<leader>n', group = 'Notes' },
        { '<leader>o', group = 'Open' },
        { '<leader>p', group = 'Projects' },
        { '<leader>pt', group = 'Tests' },
        { '<leader>q', group = 'Quickfix' },
        { '<leader>r', group = 'Run' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Tabs' },
        { '<leader>v', group = 'Vim' },
        { '<leader>w', group = 'Windows' },
        { '<leader>x', group = 'Execute' },
        { '<leader>vo', group = 'Open' },

        -- Hide the window switching
        { '<leader>1', hidden = true },
        { '<leader>2', hidden = true },
        { '<leader>3', hidden = true },
        { '<leader>4', hidden = true },

        -- Hide tab switching
        { '<leader>t1', hidden = true },
        { '<leader>t2', hidden = true },
        { '<leader>t3', hidden = true },
        { '<leader>t4', hidden = true },
      },

      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = {},
      },
    },
  },
}

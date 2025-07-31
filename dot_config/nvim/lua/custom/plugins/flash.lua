return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = { modes = { search = { enabled = true } } },
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "gt", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
}

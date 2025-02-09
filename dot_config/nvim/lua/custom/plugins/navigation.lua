return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = { modes = { search = { enabled = true } } },
    -- stylua: ignore
    keys = {
 --      { "gt", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
}

local deps = require("custom.deps")

deps.add("nvim-telescope/telescope.nvim")
--deps.add('sunesimonsen/notes.nvim')
deps.add("file:///Users/ssimonsen/Code/nvim/notes.nvim")

require("notes").setup({
  dir = "/Users/ssimonsen/Library/CloudStorage/Dropbox/denoted",
})

vim.keymap.set("n", "<leader>nn", ":Notes find<CR>", { desc = "Find note" })
vim.keymap.set("n", "<leader>nl", ":Notes link_to_note<CR>", { desc = "Link to note" })
vim.keymap.set("n", "<leader>nr", ":Notes retitle<CR>", { desc = "Retitle note" })
vim.keymap.set("n", "<leader>ns", ":Notes search<CR>", { desc = "Search through notes" })
vim.keymap.set("n", "<leader>nt", ":Notes toggle_tag<CR>", { desc = "Toggle tag" })
vim.keymap.set("n", "<leader>ni", function()
  local notes = require("notes")
  vim.cmd("edit " .. vim.fn.expand(notes.dir .. "/*--inbox__*"))
end, { desc = "Open inbox" })

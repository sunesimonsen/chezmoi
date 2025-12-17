vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local deps = require 'custom.deps'

-- Everything from mini.nvim

deps.add { source = 'nvim-mini/mini.nvim', checkout = '6bd3a01aaf7d248aea1b78aacdd5d44bffa002c1' }

-- Projects

deps.add { source = 'DrKJeff16/project.nvim', checkout = '8c6bad7d22eef1b71144b401c9f74ed01526a4fb' }

-- LSP

deps.add {
  source = 'artempyanykh/marksman',
  checkout = '6cea2d1552b11e7000a5dac5a03291f0071a921f',
  hooks = { post_install = deps.make, post_checkout = deps.make },
}
deps.add { source = 'williamboman/mason.nvim', checkout = '9e25c98d4826998460926f8c5c2284848d80ae89' }
deps.add { source = 'williamboman/mason-lspconfig.nvim', checkout = '9141be4c1332afc83bdf1b0278dbb030f75ff8e3' }
deps.add { source = 'WhoIsSethDaniel/mason-tool-installer.nvim', checkout = '517ef5994ef9d6b738322664d5fdd948f0fdeb46' }
deps.add { source = 'j-hui/fidget.nvim', checkout = '4ec7bed6c86b671ddde03ca1b227343cfa3e65fa' }
deps.add { source = 'neovim/nvim-lspconfig', checkout = '9141be4c1332afc83bdf1b0278dbb030f75ff8e3' }

-- Tree sitter

local post_tree_sitter = function()
  vim.cmd 'TSUpdate'
end

deps.add {
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = '4d9916e477e5d4e3b245845dfd285edf429f3252',
  monitor = 'main',
  hooks = { post_install = post_tree_sitter, post_checkout = post_tree_sitter },
}

deps.add {
  source = 'nvim-treesitter/nvim-treesitter-textobjects',
  checkout = '0d7c800fadcfe2d33089f5726cb8907fc846eece',
  monitor = 'main',
}

-- Formatting

deps.add { source = 'stevearc/conform.nvim', checkout = '973f3cb73887d510321653044791d7937c7ec0fa' }

-- Editing

deps.add 'sunesimonsen/killring.nvim'
deps.add { source = 'poljar/typos.nvim', checkout = '9315badebfe72efd8020ae7b1d2f176903ea6794' }

-- Notes

deps.add 'sunesimonsen/notes.nvim'

-- AI

deps.add { source = 'robitx/gp.nvim', checkout = 'b32327fe4ee65d24acbab0f645747c113eb935c0' }

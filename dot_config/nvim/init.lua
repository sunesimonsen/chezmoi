vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local deps = require 'custom.deps'

-- Telescope

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

local post_tree_sitter = function(data)
  deps.make(data)
  vim.cmd 'TSUpdate'
end

deps.add {
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = '4d9916e477e5d4e3b245845dfd285edf429f3252',
  monitor = 'main',
  hooks = { post_install = post_tree_sitter, post_checkout = post_tree_sitter },
}

-- Formatting

deps.add { source = 'tpope/vim-sleuth', checkout = 'be69bff86754b1aa5adcbb527d7fcd1635a84080' }
deps.add { source = 'stevearc/conform.nvim', checkout = '973f3cb73887d510321653044791d7937c7ec0fa' }

-- Editing

deps.add { source = 'echasnovski/mini.completion', checkout = '7254cce7766f330170318c8bd4826ec3a3aac183' }
deps.add { source = 'folke/flash.nvim', checkout = '3c942666f115e2811e959eabbdd361a025db8b63' }
deps.add { source = 'kylechui/nvim-surround', checkout = 'c271c9082886a24866353764cf96c9d957e95b2b' }
deps.add { source = 'sunesimonsen/killring.nvim', checkout = '33f7f25486371bf61abfd3805aae7ab1428197ad' }
deps.add { source = 'poljar/typos.nvim', checkout = '9315badebfe72efd8020ae7b1d2f176903ea6794' }
deps.add { source = 'echasnovski/mini.ai', checkout = '1cd4f021a05c29acd4ab511c0981da14217daf38' }

-- Notes

--deps.add('sunesimonsen/notes.nvim')

deps.add { source = 'file:///Users/ssimonsen/Code/nvim/notes.nvim' }

-- AI

deps.add { source = 'robitx/gp.nvim', checkout = 'b32327fe4ee65d24acbab0f645747c113eb935c0' }

-- UI

deps.add { source = 'lewis6991/gitsigns.nvim', checkout = '736f51d2bb684c06f39a2032f064d7244f549981' }
deps.add { source = 'echasnovski/mini.statusline', checkout = 'f6917f4da995d64edf3728b1302dbd5d4561c912' }

-- Theming

deps.add { source = 'folke/tokyonight.nvim', checkout = '057ef5d260c1931f1dffd0f052c685dcd14100a3' }

-- Help

deps.add { source = 'folke/which-key.nvim', checkout = '370ec46f710e058c9c1646273e6b225acf47cbed' }

-- Files

deps.add { source = 'stevearc/oil.nvim', checkout = 'bbad9a76b2617ce1221d49619e4e4b659b3c61fc' }

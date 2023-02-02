vim.cmd [[packadd packer.nvim]]

function plugins(use)
  use 'wbthomason/packer.nvim'

  -- Color Schemes
  use {
    {
      'projekt0n/github-nvim-theme',
      -- config = require'mmfallacy.themes.github'
    },
    {
      'navarasu/onedark.nvim',
      config = require'mmfallacy.themes.onedark'
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = require'mmfallacy.configs.treesitter'
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }
end

return require'packer'.startup(plugins)

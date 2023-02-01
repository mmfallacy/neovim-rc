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
end

return require'packer'.startup(plugins)

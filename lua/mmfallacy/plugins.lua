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
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end

return require'packer'.startup(plugins)

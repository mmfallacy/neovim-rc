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

    -- Syntax analyzers
    use {
        'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = require'mmfallacy.configs.treesitter'
    }

    use {
        'echasnovski/mini.comment',
        config = require'mmfallacy.configs.comment'
    }

    -- QOL
    use {
        'rafamadriz/friendly-snippets'
    }

    use {
        'echasnovski/mini.surround',
        config = function() require'mini.surround'.setup() end
    }

    use {
        'echasnovski/mini.pairs',
        config = require'mmfallacy.configs.autopairs'
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = require'mmfallacy.configs.indents'
    }
    
    use {
        'echasnovski/mini.tabline',
        config = function() require'mini.tabline'.setup() end
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
end

return require'packer'.startup(plugins)

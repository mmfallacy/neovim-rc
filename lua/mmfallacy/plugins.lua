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
        requires = { {'nvim-lua/plenary.nvim'} },
        config = require'mmfallacy.configs.telescope'
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

    -- Snippet
    use 'rafamadriz/friendly-snippets'
    use 'L3MON4D3/LuaSnip'
    use {
        'hrsh7th/nvim-cmp',
        requires = 'L3MON4D3/LuaSnip',
        config = require'mmfallacy.configs.cmp',
    }
    use {
        'hrsh7th/cmp-buffer',
        requires = 'hrsh7th/nvim-cmp',
    }
    use {
        'saadparwaiz1/cmp_luasnip',
        requires = 'hrsh7th/nvim-cmp',
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        requires = 'hrsh7th/nvim-cmp',
    }
    use {
        'hrsh7th/cmp-path',
        requires = 'hrsh7th/nvim-cmp',
    }

end

return require'packer'.startup(plugins)

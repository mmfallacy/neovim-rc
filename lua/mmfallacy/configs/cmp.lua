return function()
    require 'luasnip.loaders.from_vscode'.lazy_load()
    local cmp = require 'cmp'
    cmp.setup {
        view = { entries = 'native' },
        snippet = { expand = function(args) require 'luasnip'.lsp_expand(args.body) end },
        sources = cmp.config.sources({
            { name = 'nvim_lsp', max_item_count = 15 },
            { name = 'luasnip', max_item_count = 5 },
            { name = 'buffer', max_item_count = 10, keyword_length = 5 },
            { name = 'path', max_item_count = 5 },
        }),
        mapping = cmp.mapping.preset.insert {
            ['<Up>'] = cmp.mapping.close(),
            ['<Down>'] = cmp.mapping.close(),
            ['<C-Up>'] = cmp.mapping.select_prev_item(),
            ['<C-Down>'] = cmp.mapping.select_next_item(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-Enter>'] = cmp.mapping.confirm {
                select = true,
                behavior = cmp.ConfirmBehavior.Replace,
            },
        },
        experimental = {
            ghost_text = true
        }

    }
end

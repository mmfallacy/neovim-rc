require"mason".setup()
require"mason-lspconfig".setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer', 
    }
})

local on_attach = function (_,_ )
    vim.keymap.set('n', "K", vim.lsp.buf.hover)
end

local lsp = require"lspconfig"

-- Language Server Setups
lsp.lua_ls.setup{on_attach = on_attach}
lsp.eslint.setup{on_attach = on_attach}
lsp.tsserver.setup{on_attach = on_attach}
lsp.rust_analyzer.setup{on_attach = on_attach}

require "mason".setup()
require "mason-lspconfig".setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'emmet_ls',
        'denols',
        'svelte'
    }
})

local lsp = require "lspconfig"
local caps = require 'cmp_nvim_lsp'.default_capabilities()

local on_attach = function(client, bufnr)
    local function bufmap(mode, combo, macro)
        vim.keymap.set(mode, combo, macro, { buffer = bufnr, noremap = true, silent = true })
    end

    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    -- if lsp.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) and client.name == "tsserver" then
    --     client.stop()
    -- end
end
-- Language Server Setups
lsp.lua_ls.setup { on_attach = on_attach, capabilities = caps }
lsp.eslint.setup { on_attach = on_attach, capabilities = caps }
lsp.denols.setup {
    on_attach = on_attach,
    capabilities = caps,
    root_dir = lsp.util.root_pattern('deno.jsonc', 'deno.json'),
    settings = {
        deno = {
            enable = true,
            lint = true,
            config = 'deno.jsonc'
        }
    },
    filetypes = {
        "json", "jsonc", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
        "typescript.tsx"
    }
}
lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = caps,
    single_file_support = false,
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "tsconfig.jsonc", "package.jsonc")
}
lsp.rust_analyzer.setup { on_attach = on_attach, capabilities = caps }
lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = caps,
    filetypes = {
        'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss'
    }
}
lsp.svelte.setup {
    on_attach = on_attach,
    capabilities = caps
}

require "mason".setup()
require "mason-lspconfig".setup({
    ensure_installed = {
        'tsserver',
        'lua_ls',
        'rust_analyzer',
        'emmet_ls',
        'denols',
        'svelte',
        'pyright',
        'tailwindcss-language-server'
    }
})

local lsp = require "lspconfig"
local caps = require 'cmp_nvim_lsp'.default_capabilities()

local on_attach_base = function(client, bufnr)
    local function bufmap(mode, combo, macro)
        vim.keymap.set(mode, combo, macro, { buffer = bufnr, noremap = true, silent = true })
    end

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
    bufmap('n', '<leader>fmt', function() vim.lsp.buf.format { async = true } end)
    bufmap('n', '<leader>pd', function() vim.diagnostic.open_float { scope = 'cursor' } end)
    bufmap('n', '<leader>ld', function() vim.diagnostic.open_float { scope = 'line' } end)
    bufmap('n', '<leader>ca', vim.lsp.buf.code_action)

    local t = require 'telescope.builtin'
    bufmap('n', '<leader>wd', t.diagnostics)
    bufmap('n', '<leader>dd', function() t.diagnostics({ bufnr = 0 }) end)
    bufmap('n', 'gd', t.lsp_definitions)
    -- bufmap('n', 'gi', t.lsp_implementations)
    bufmap('n', 'gt', t.lsp_type_definitions)
    bufmap('n', 'gr', t.lsp_references)
    -- bufmap('n', '<leader>ws', t.lsp_workspace_symbols)
    bufmap('n', '<leader>ds', t.lsp_document_symbols)
    -- if lsp.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) and client.name == "tsserver" then
    --     client.stop()
    -- end
end

local on_attach = function(client, bufnr)
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms = 5000})]]
    on_attach_base(client, bufnr);
end
-- Language Server Setups
lsp.lua_ls.setup { on_attach = on_attach, capabilities = caps }
-- lsp.eslint.setup {
--     on_attach = function(client, bufnr)
--         on_attach_base(client, bufnr)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             command = "EslintFixAll",
--         })
--     end,
--     root_dir = lsp.util.root_pattern('.eslintrc',
--         'eslintrc.js',
--         '.eslintrc.cjs',
--         '.eslintrc.yaml',
--         '.eslintrc.yml',
--         '.eslintrc.json',
--         'eslint.config.js'),
--     capabilities = caps
-- }
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
    on_attach = on_attach_base,
    capabilities = caps,
    single_file_support = false,
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "tsconfig.jsonc", "package.jsonc")
}
lsp.rust_analyzer.setup { on_attach = on_attach, capabilities = caps }
lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = caps,
    filetypes = {
        'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'svelte'
    }
}
lsp.svelte.setup {
    on_attach = on_attach_base,
    capabilities = caps
}
lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = caps,
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                typeCheckingMode = 'strict',
                useLibraryCodeForTypes = true,
            }
        }
    }
}
lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = caps,
}

local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        null_ls.builtins.code_actions.eslint_d.with {
            extra_filetypes = { "svelte" },
        },
        null_ls.builtins.diagnostics.eslint_d.with {
            extra_filetypes = { "svelte" },
        },
        null_ls.builtins.formatting.eslint_d.with {
            extra_filetypes = { "svelte" },
        },
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.prettierd.with {
            extra_filetypes = { "svelte" },
            env = {
                PRETTIERD_LOCAL_PRETTIER_ONLY = 1
            }
        },
    },
    on_attach = on_attach
}

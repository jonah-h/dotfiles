-- rust
vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        default_settings = {
            ["rust-analyzer"] = {
                check = {
                    workspace = false,
                },
                cargo = {
                    -- NOTE: This may need to be a per-project setting
                    features = "all",
                },
                inlayHints = {
                    parameterHints = {
                        enable = false,
                    },
                    typeHints = {
                        enable = false,
                    },
                    --implicitDrops = {
                    --    enable = true,
                    --},
                },
            },
        },
    },
}

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- c++
vim.lsp.config("clangd", {
    capabilities = capabilities
})
vim.lsp.enable("clangd")
-- lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },
        },
    },
})
vim.lsp.enable("lua_ls")
-- tex
vim.lsp.config("texlab", {
    capabilities = capabilities
})
vim.lsp.enable("texlab")
-- python
vim.lsp.config("pyright", {
    capabilities = capabilities
})
vim.lsp.enable("pyright")
-- wgsl
vim.lsp.config("wgsl_analyzer", {
    capabilities = capabilities
})
vim.lsp.enable("wgsl_analyzer")

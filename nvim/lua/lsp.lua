-- lsp server installer
require("mason").setup {
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "texlab", "pyright" },
}

vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        default_settings = {
            ["rust-analyzer"] = {
                cargo = {
                    -- NOTE: This may need to be a per-project setting
                    features = "all"
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

-- c++
require("clangd_extensions").setup()

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")
lsp["clangd"].setup {
    capabilities = capabilities
}
lsp["lua_ls"].setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },
        },
    },
}
lsp["texlab"].setup {
    capabilities = capabilities
}
lsp["pyright"].setup {
    capabilities = capabilities
}
lsp["wgsl_analyzer"].setup {
    capabilities = capabilities
}

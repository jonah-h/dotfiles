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
    ensure_installed = { "lua_ls", "rust_analyzer", "texlab", "pyright" },
}

-- lsp loading indicator
--require("fidget").setup()

-- rust
local rt = require("rust-tools")

rt.setup {
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
      inlay_hints = {
          parameter_hints_prefix = "< ",
          other_hints_prefix = "-> ",
      },
  },
}

-- c++
require("clangd_extensions").setup()

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")
--lsp["rust_analyzer"].setup {
--    capabilities = capabilities
--}
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

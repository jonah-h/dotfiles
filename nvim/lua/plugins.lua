return {
    -- collection of common configurations for the Nvim LSP client
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },

    -- lsp management
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "",
                    package_uninstalled = "",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                --"lua_ls", -- NOTE: use distro package
                "texlab",
                "pyright",
            },
        },
    },

    -- lsp progress visualization
    {
        "j-hui/fidget.nvim",
        version = "*",
        event = "LspAttach",
        --lazy = false,
        opts = {},
    },

    -- autocompletion framework
    {
        "hrsh7th/nvim-cmp",
        version=false,
        dependencies = {
            -- cmp LSP completion
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            -- cmp Snippet completion
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-vsnip",
            -- cmp Path completion
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
        },
    },

    -- language parser
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
    },

    -- indention guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = 'v0.2.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- file browser
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            window = {
                width = 30,
            },
        }
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "gruvbox",
                section_separators = { left = "", right = "" },
                component_separators = { left = "│", right = "│" },
                --component_separators = "┃",
                --component_separators = "⏽",
            },
            tabline = {
                lualine_a = { "buffers" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = { "tabs" },
                lualine_y = {},
                lualine_z = {},
            },
        },
    },

    -- collect diagnostics and TODOs
    {
        "folke/trouble.nvim",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            highlight = {
            --    pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true,
            },
            search = {
                pattern = [[\b(KEYWORDS)\b]], -- ripgrep regex
            },
        },
    },

    -- color scheme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
    },

    -- rust addons
    {
        "mrcjkb/rustaceanvim",
        --version = "4.26.1",
        version = "^6",
        lazy = false,
    },
    {
        "saecki/crates.nvim",
        --tag = "stable",
        opts = {},
        --config = function()
        --    require('crates').setup()
        --end,
    },

    -- tex addon
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_latexmk = {
                out_dir = "out",
                aux_dir = ".aux",
                options = {
                    "-shell-escape",
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                }
            }
        end,
    },

    -- c++ addon
    {
        "p00f/clangd_extensions.nvim",
        opts = {},
    },

    -- dap
    { "mfussenegger/nvim-dap" },
}

-- ensure the packer plugin manager is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    -- let packer manage itself
    use("wbthomason/packer.nvim")

    -- collection of common configurations for the Nvim LSP client
    use("neovim/nvim-lspconfig")

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- visualize lsp progress
    use {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup {
            -- options
        }
        end,
    }

    -- autocompletion framework
    use("hrsh7th/nvim-cmp")
    use {
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
        after = { "hrsh7th/nvim-cmp" },
        requires = { "hrsh7th/nvim-cmp" },
    }

    -- language parser
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    -- indention guides
    use("lukas-reineke/indent-blankline.nvim")

    -- fuzzy finder
    use("nvim-telescope/telescope.nvim")

    -- file browser
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }

    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    -- tabline
    use {
        "kdheepak/tabline.nvim",
        requires = {
            { "hoob3rt/lualine.nvim", opt=true },
            {"kyazdani42/nvim-web-devicons", opt = true},
        }
    }

    -- collect diagnostics and TODOs
    use("folke/trouble.nvim")
    use("folke/todo-comments.nvim")

    -- color scheme
    use("ellisonleao/gruvbox.nvim")
    --use("morhetz/gruvbox")
    --use("sainnhe/gruvbox-material")

    -- rust addons
    use("simrat39/rust-tools.nvim")
    use {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- tex addon
    use("lervag/vimtex")

    -- c++ addon
    use("p00f/clangd_extensions.nvim")

end)

-- the first run will install packer and our plugins
if packer_bootstrap then
    require("packer").sync()
    return
end

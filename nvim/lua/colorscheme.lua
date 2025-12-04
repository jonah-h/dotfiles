-- treesitter
require("nvim-treesitter").install { "all" }
local bufnr = vim.api.nvim_get_current_buf()
vim.bo[bufnr].syntax = "on"
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    callback = function(args)
        -- Safely try to enable Tree-Sitter highlighting
        pcall(function()
            vim.treesitter.start(args.buf)
        end)
    end,
})

-- configure colorscheme
require("gruvbox").setup {
    overrides = {
        -- punctuation
        ["@punctuation.bracket"] = { link = "GruvboxFg1" },
        ["@punctuation.delimiter"] = { link = "GruvboxFg1" },
        ["@lsp.type.attributeBracket"] = { link = "GruvboxOrange" },

        -- variables
        ["@parameter"] = { link = "GruvboxFg1" },
        ["@variable.builtin"] = { link = "GruvboxPurple" },
        ["@property"] = { link = "GruvboxFg1" },
        ["@field"] = { link = "GruvboxFg1" },
        ["@lsp.type.enumMember"] = { link = "GruvboxPurple" },
        ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "GruvboxPurpleBold" },
        ["@constant"] = { link = "GruvboxFg1" },
        ["@constant.builtin"] = { link = "GruvboxPurple" },

        -- types
        ["@type.builtin"] = { link = "GruvboxYellow" },
        ["@lsp.type.interface"] = { link = "GruvboxYellow" },
        ["@lsp.type.class"] = { link = "GruvboxBlue" },
        ["@lsp.type.struct"] = { link = "GruvboxBlue" },
        ["@lsp.type.enum"] = { link = "GruvboxBlue" },
        ["@lsp.type.typeAlias"] = { link = "GruvboxYellow" },

        -- other
        ["@include"] = { link = "GruvboxRed" },
        ["@namespace"] = { link = "GruvboxAqua" },
        ["@type.qualifier"] = { link = "GruvboxOrange" },
        ["@lsp.type.decorator"] = { link = "GruvboxAqua" },
        ["@storageclass.lifetime"] = { link = "GruvboxRed" },
        ["@comment.documentation"] = { link = "GruvboxFg3" },

        -- rust
        ["@lsp.type.variable.rust"] = {}, -- this group messes up async functions
        ["@keyword.import.rust"] = { link = "GruvboxRed" },

        -- cpp
        ["@include.cpp"] = { link = "GruvboxAqua" },

        -- latex
        ["@module.latex"] = { link = "GruvboxAqua" },
        --["@function.macro.latex"] = { link = "@module.latex" },
        --["@label.latex"] = { link = "GruvboxBlue" },


        -- for linux console
        GruvboxFg1 = { ctermfg = 15 },
        GruvboxRed = { ctermfg = 9 },
        GruvboxGreen = { ctermfg = 10 },
        GruvboxYellow = { ctermfg = 11 },
        GruvboxBlue = { ctermfg = 12 },
        GruvboxPurple = { ctermfg = 13 },
        GruvboxAqua = { ctermfg = 14 },
        GruvboxOrange = { ctermfg = 15 },
        GruvboxRedBold = { ctermfg = 9 },
        GruvboxGreenBold = { ctermfg = 10 },
        GruvboxYellowBold = { ctermfg = 11 },
        GruvboxBlueBold = { ctermfg = 12 },
        GruvboxPurpleBold = { ctermfg = 13 },
        GruvboxAquaBold = { ctermfg = 14 },
        GruvboxOrangeBold = { ctermfg = 15 },
        Operator = { ctermfg = 15 },
        String = { ctermfg = 10 },
    }
}

vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- fix colors in linux console
if os.getenv("TERM") == "linux" then
    vim.o.termguicolors = false
end

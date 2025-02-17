-- sub scripts
require("plugins")
require("colorscheme")
require("status_lines")
require("lsp")
require("completion")

-- file browser
require("neo-tree").setup {
    window = {
        width = 30,
    },
}

-- collect diagnostics and TODOs
require("trouble").setup()
require("todo-comments").setup {
    highlight = {
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,
    },
    search = {
        pattern = [[\b(KEYWORDS)\b]], -- ripgrep regex
    },
}


-- tex
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = {
    out_dir = "out",
    aux_dir = ".aux",
    options = {"-shell-escape", "-verbose"}
}

-- line numbering
vim.o.number = true
vim.o.cursorline = true

-- min vertical cursor offset for scrolling
vim.o.scrolloff = 10

-- convert tabs to spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- indentation settings
vim.o.smartindent = true
vim.o.cino = "g0"

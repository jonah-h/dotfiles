-- sub scripts
require("config.lazy")
require("config.colorscheme")
require("config.lsp")
require("config.completion")
require("config.dap")

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

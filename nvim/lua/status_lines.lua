-- status line
require("lualine").setup {
    options = {
        theme = "gruvbox",
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
        --component_separators = "┃",
        --component_separators = "⏽",
    },
    tabline = {
        lualine_a = { require("tabline").tabline_buffers },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { require("tabline").tabline_tabs },
        lualine_y = {},
        lualine_z = {},
    },
}

-- tabline
require("tabline").setup {
    enable = true,
}

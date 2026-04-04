vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim"
})

require("lualine").setup({
    options = {
        icons_enabled = false,
        section_separators = { left = "", right = "" },
        component_separators = "",
    },
    sections = {
        lualine_c = {
            {
                "filename",
                path = 3
            },
        },
    }
})

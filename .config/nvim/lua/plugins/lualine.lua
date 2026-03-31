vim.pack.add({
    "https://github.com/kyazdani42/nvim-web-devicons", -- Dependency
    "https://github.com/nvim-lualine/lualine.nvim"
})

require("lualine").setup({
    options = {
        section_separators = { left = "", right = "" },
        component_separators = "",
    },
    sections = {
        lualine_a = {
            {
                "mode",
                icon = ""
            },
        },
        lualine_c = {
            {
                "filename",
                path = 3
            },
        },
    }
})

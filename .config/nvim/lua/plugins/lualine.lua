return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
        require("lualine").setup({
            options = {
                section_separators = { left = "", right = "" },
                component_separators = "",
            },
            sections = {
                lualine_c = {
                    {"filename", path = 3},
                },
            }
        })
    end
}


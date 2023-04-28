return {
    "prichrd/netrw.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
        require("netrw").setup{
            use_devicons = true,
        }
    end
}


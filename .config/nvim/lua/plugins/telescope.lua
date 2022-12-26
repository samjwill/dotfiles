return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy = 'ascending',
                layout_config = {
                    prompt_position = 'top'
                }
            }
        })
    end
}


if packer_plugins["telescope.nvim"] and packer_plugins["telescope.nvim"].loaded then

require("telescope").setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top'
        }
    }
})
end

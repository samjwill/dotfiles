if packer_plugins["telescope.nvim"] and packer_plugins["telescope.nvim"].loaded then

--TODO: Unsure if these parenthesis are necessary or not?
require("telescope").setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top'
        }
    }
})
end

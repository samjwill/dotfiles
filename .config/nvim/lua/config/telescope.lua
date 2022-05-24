if packer_plugins["telescope"] and packer_plugins["telescope"].loaded then


--TODO: Unsure if these parenthesis are necessary or not?
require("telescope").setup({
    defaults =
    {
        sorting_strategy = 'ascending',
        layout_config =
        {
            prompt_position = 'top',
        },
    }
})
end

local telescope = require("telescope")

--TODO: Unsure if these parenthesis are necessary or not?
telescope.setup({
    defaults =
    {
        sorting_strategy = 'ascending',
        layout_config =
        {
            prompt_position = 'top',
        },
    }
})

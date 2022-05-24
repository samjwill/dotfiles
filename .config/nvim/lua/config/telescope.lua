local status_ok telescope = pcall(require, "telescope")
if not status_ok then
    return
end

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

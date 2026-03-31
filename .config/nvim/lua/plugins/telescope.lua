vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top'
        },
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close
            },
        }
    }
})

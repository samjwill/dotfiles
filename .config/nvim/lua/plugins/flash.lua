vim.pack.add({"https://github.com/folke/flash.nvim"})

require("flash").setup{
    highlight = {
        groups = {
            -- Makes distinguishing between labels and matches easier when jumping.
            match = "Search",
            current = "Substitute",
            backdrop = "FlashBackdrop",
            label = "Error",
        },
    },
    modes = {
        search = {
            enabled = false,
        },
        char = {
            enabled = false, -- TODO: Re-enable when colorscheme cooperates with flash.
            char_actions = function()
                return {
                    [";"] = "next",
                    [","] = "prev",
                }
            end,
            highlight = {
                -- show a backdrop with hl FlashBackdrop
                backdrop = false,
                -- Highlight the search matches
                matches = true,
                groups = {
                    match = "IncSearch",
                    current = "IncSearch",
                    backdrop = "FlashBackdrop",
                    label = "Search",
                },
            },
        },
    },
}


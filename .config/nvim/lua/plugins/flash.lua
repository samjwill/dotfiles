return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "s",
            mode = { "n", "o", "x", "t"},
            function()
                require("flash").jump()
            end,
            desc = "Flash"
        },

        {
            "S",
            mode = { "n", "o", "x", "t"},
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter"
        },

        {
            "<c-s>",
            mode = { "c" },
            function()
                require("flash").toggle()
            end,
            desc = "Toggle Flash Search"
        },

        -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
}


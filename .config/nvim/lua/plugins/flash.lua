return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                keys = {
                    -- TODO: Re-enable F/f/T/t when you figure out how to disable clever-f style repeat motions when pressing "f" a second time.
                    -- TODO: Find a way to remove highlighting when a jump is made via F/f/T/t
                },
            },
        },
    },
    keys = {
        {
            "s",
            -- TODO: Why doesn't this work in terminal-normal mode? Adding "t" here also forces it to be used in terminal-insert mode.
            -- Even bringing this out doesn't have the desired effect because it breaks when you try to leave flash mode.
            -- config = function()
            --     vim.keymap.set("t", "s", function() require("flash").jump() end, {desc = "Flash"})
            -- end
            mode = { "n", "o", "x"},
            function()
                require("flash").jump()
            end,
            desc = "Flash"
        },

        {
            "S",
            mode = { "n", "o", "x"},
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


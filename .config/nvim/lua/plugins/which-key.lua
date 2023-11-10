return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        -- TODO: May be worth investigating moving keymaps themselves to this file.
        require("which-key").register({
            l = {
                name = "Language Server Protocol",
            },
            c = {
                name = "Command Line",
            },
            t = {
                name = "Telescope",
            },
            d = {
                name = "Debugger",
            }
        }, { prefix = "<leader>" })
    end,

    opts = {
        window = {
            border = "single", -- none, single, double, shadow
        },
    }
}

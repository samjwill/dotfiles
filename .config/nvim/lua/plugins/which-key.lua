return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        -- TODO: May be worth investigating moving keymaps themselves to this file.
        require("which-key").add({
            { "<leader>l", group = "Language Server Protocol" },
            { "<leader>c", group = "Command Line" },
            { "<leader>t", group = "Telescope" },
            { "<leader>d", group = "Debugger" },
        })
    end,

    opts = {
        preset = "helix",
    }
}

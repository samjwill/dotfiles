vim.o.timeout = true
vim.o.timeoutlen = 300

vim.pack.add({"https://github.com/folke/which-key.nvim"})

require("which-key").setup({
    preset = "helix",
    icons = {
        mappings = false,
    },
})

-- TODO: May be worth investigating moving keymaps themselves to this file.
require("which-key").add({
    { "<leader>l", group = "Language Server" },
    { "<leader>c", group = "Command Line" },
    { "<leader>t", group = "Telescope" },
    { "<leader>d", group = "Debugger" },
})

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
        disable = { "help" }
    }
})

-- Override default folding options.
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 999999 -- Leave unfolded by default.
vim.opt.foldmethod = "expr"


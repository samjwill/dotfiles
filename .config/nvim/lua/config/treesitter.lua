require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true
    }
    --TODO: Incremental Selection
})

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 999999
vim.opt.foldmethod = "expr"

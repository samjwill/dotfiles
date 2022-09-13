require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true
    }
    --TODO: Incremental Selection
})

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 9 -- Same as set by pressing `zR`
vim.opt.foldmethod = "expr"

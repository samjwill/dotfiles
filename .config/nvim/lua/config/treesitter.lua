require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true
    }
    --TODO: Incremental Selection
    --TODO: Folds
})

if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true
    }
    --TODO: Incremental Selection
    --TODO: Folds
})

end

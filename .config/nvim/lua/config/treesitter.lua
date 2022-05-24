if packer_plugins["nvim-treesitter"] and packer_plugins["nvim-treesitter"].loaded then

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true
    }
    --TODO: Incremental Selection
})

-- Workaround because there appears to be an issue with :TSUpdate
vim.cmd("autocmd VimEnter * TSUpdate")

end

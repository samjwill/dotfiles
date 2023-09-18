return {
    "folke/flash.nvim",
    config = function()
        -- Makes the flash .jump() search look better with gruvbox-material "original"
        -- Otherwise, colors are too similar for the label and the highlighted search text
        vim.cmd("highlight clear FlashLabel")
        vim.cmd("highlight link FlashLabel ErrorMsg")
        vim.cmd("highlight clear FlashCurrent")
        vim.cmd("highlight link FlashCurrent Substitute")

        require("flash").setup {
            modes = {
                search = {
                    enabled = false,
                },
                char = {
                   -- TODO: Re-enable F/f/T/t when you figure out how to disable clever-f style repeat motions when pressing "f" a second time.
                   -- TODO: Find a way to remove highlighting when a jump is made via F/f/T/t
                    enabled = false,
                },
            },
        }
    end
}

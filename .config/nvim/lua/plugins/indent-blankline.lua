local function get_foreground_color_hex(group_name)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group_name)), "fg#")
end

return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()

        local highlight = {
            "Color1",
            "Color2",
            "Color3",
            "Color4",
            "Color5",
            "Color6",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "Color1", { fg = get_foreground_color_hex("Identifier") })
            vim.api.nvim_set_hl(0, "Color2", { fg = get_foreground_color_hex("Macro") })
            vim.api.nvim_set_hl(0, "Color3", { fg = get_foreground_color_hex("Type") })
            vim.api.nvim_set_hl(0, "Color4", { fg = get_foreground_color_hex("Label") })
            vim.api.nvim_set_hl(0, "Color5", { fg = get_foreground_color_hex("Error") })
            vim.api.nvim_set_hl(0, "Color6", { fg = get_foreground_color_hex("Number") })
        end)

        require("ibl").setup({
            scope = {
                enabled = false,
            },
            indent = {
                highlight = highlight
            },
        })
    end
}

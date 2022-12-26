return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require('indent_blankline').setup{}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        -- See: https://github.com/lukas-reineke/indent-blankline.nvim/issues/489#issuecomment-1276972280
        vim.api.nvim_create_autocmd("CursorMoved", {command = "IndentBlanklineRefresh"})
    end
}


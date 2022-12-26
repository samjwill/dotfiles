return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require('indent_blankline').setup{}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.api.nvim_create_autocmd("CursorMoved", {command = "IndentBlanklineRefresh"})
    end
}


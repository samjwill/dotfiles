return {
    "sainnhe/gruvbox-material",
    config = function()
        -- See: https://github.com/sainnhe/gruvbox-material/issues/152#issuecomment-1312721186
        -- TODO: Look at colors here instead? Might match scheme better:
        -- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua

        -- Apply custom highlights on colorscheme change.
        -- Must be declared before executing ':colorscheme'.
        grpid = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = grpid,
            pattern = 'gruvbox-material',
            command = -- terminal bright colors
            [[let g:terminal_color_0  = '#45403d' |]] ..
            [[let g:terminal_color_9  = '#f0948f' |]] ..
            [[let g:terminal_color_10 = '#cfd6a9' |]] ..
            [[let g:terminal_color_11 = '#e7c898' |]] ..
            [[let g:terminal_color_12 = '#b0cec7' |]] ..
            [[let g:terminal_color_13 = '#dda2b2' |]] ..
            [[let g:terminal_color_14 = '#b4cfaf' |]] ..
            [[let g:terminal_color_15 = '#ddc7a1'  ]]
        })
        vim.g.gruvbox_material_foreground='original'
        vim.cmd('colorscheme gruvbox-material')
    end
}


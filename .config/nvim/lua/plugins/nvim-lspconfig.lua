return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", { callback =
            function(args)
                vim.api.nvim_set_option_value( "omnifunc", "v:lua.vim.lsp.omnifunc", { buf = args.buf })
            end,
        })

        vim.lsp.enable("clangd")
    end,
}

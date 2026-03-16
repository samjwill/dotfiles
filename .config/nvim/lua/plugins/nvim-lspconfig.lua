return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", { callback =
            function(args)
                vim.api.nvim_set_option_value( "omnifunc", "v:lua.vim.lsp.omnifunc", { buf = args.buf })
            end,
        })

        -- Lua. Uses lazydev above for configuration for editing Neovim config.
        vim.lsp.enable("lua_ls")

        -- C and C++
        vim.lsp.enable("clangd")

        -- Python
        vim.lsp.enable("basedpyright")
    end,
}

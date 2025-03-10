return {
    "neovim/nvim-lspconfig",
    config = function()
        local on_attach_func = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end

        require("lspconfig").clangd.setup{
            clangd_keymaps, -- Defined in keymaps file.
            on_attach = on_attach_func
        }

        require("lspconfig").pylsp.setup{
            on_attach = on_attach_func,
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "E501" }, -- Ignore "line too long" warnings
                        },
                    },
                },
            },
        }

        require("lspconfig").rust_analyzer.setup{
            on_attach = on_attach_func
        }
    end
}

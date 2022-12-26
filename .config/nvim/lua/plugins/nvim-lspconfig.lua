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
    end
}


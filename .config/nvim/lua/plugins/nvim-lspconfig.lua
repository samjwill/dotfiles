return {
    "neovim/nvim-lspconfig",
    config = function()
        local on_attach_func = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end

        vim.lsp.config("clangd", {
            clangd_keymaps, -- Defined in keymaps file.
            on_attach = on_attach_func
        })
        vim.lsp.enable("clangd")
    end
}

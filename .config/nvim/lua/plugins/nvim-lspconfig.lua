vim.pack.add({
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

-- Lua. Uses lazydev above for configuration for editing Neovim config.
vim.lsp.enable("lua_ls")

-- C and C++
vim.lsp.enable("clangd")

-- Python
vim.lsp.enable("basedpyright")

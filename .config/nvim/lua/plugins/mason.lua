-- At the time of writing, mason expects the following packages to be installed.
-- See https://github.com/williamboman/mason.nvim for a list of up-to-date dependencies.
-- * git
-- * curl or wget
-- * unzip
-- * tar or gtar
-- * gzip

vim.pack.add(
    {
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    {
        load = true,
    }
)

require("mason").setup()
require("mason-tool-installer").setup({
    ensure_installed = {"lua-language-server", "clangd", "cpptools", "basedpyright", "debugpy", "tree-sitter-cli"},
    run_on_start = false,
})

-- TODO: This is not great since it blocks the GUI temporarily.
-- Install synchronously
vim.cmd("MasonToolsInstallSync")

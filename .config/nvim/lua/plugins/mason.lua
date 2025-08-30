-- At the time of writing, mason expects the following packages to be installed.
-- See https://github.com/williamboman/mason.nvim for a list of up-to-date dependencies.
-- * git
-- * curl or wget
-- * unzip
-- * tar or gtar
-- * gzip

-- Define a list of packages to install
-- clangd for LSP
-- cpptools for dap
local mason_package_list = { "clangd", "cpptools", "bash-language-server" }

return {
    "williamboman/mason.nvim",

    -- "build" is executed when a plugin is installed or updated.
    build = function()
        vim.g.mason_run_install_post_build = true
    end,

    -- "config" is executed when the plugin loads.
    config = function()
        require("mason").setup()
        if vim.g.mason_run_install_post_build then
            vim.schedule(function()
                vim.cmd("MasonInstall " .. table.concat(mason_package_list, " "))
            end)
        end
    end
}

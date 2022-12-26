local mason_package_list = { "clangd", "cpptools" }

return {
    "williamboman/mason.nvim",
    build = function()
        -- TODO: This causes some odd issues if Neovim is currently being
        -- bootstrapped. Leaving in place because at least this installs
        -- packages automatically on launch if they haven't been installed
        -- already.
        vim.cmd("MasonInstall "..table.concat(mason_package_list, " "))
    end,
    config = function()
        require("mason").setup()

        -- Create an autocmd that allows for simple headless installation.
        vim.api.nvim_create_user_command("MasonInstallAll", function ()
            vim.cmd("MasonInstall "..table.concat(mason_package_list, " "))
        end, {})
    end
}


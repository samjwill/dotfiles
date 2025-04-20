-- clangd for LSP
-- cpptools for dap
local mason_package_list = { "clangd", "cpptools" }

-- Use a global flag to signal that a build/update occurred.

-- At the time of writing, mason expects the following packages to be installed.
-- See https://github.com/williamboman/mason.nvim for a list of up-to-date dependencies.
-- * git
-- * curl or wget
-- * unzip
-- * tar or gtar
-- * gzip

return {
    "williamboman/mason.nvim",

    -- "build" is executed when a plugin is installed or updated.
    build = function()
        _G.mason_run_install_post_build = true
    end,

    -- "config" is executed when the plugin loads.
    config = function()
        require("mason").setup()
        if _G.mason_run_install_post_build then
            vim.schedule(function()
                vim.cmd("MasonInstall " .. table.concat(mason_package_list, " "))
            end)
            -- Reset the flag after handling installation.
        end

        -- Create a command that allows for simple, headless installation.
        vim.api.nvim_create_user_command("MasonInstallAll", function ()
            vim.cmd("MasonInstall "..table.concat(mason_package_list, " "))
        end, {})
    end
}

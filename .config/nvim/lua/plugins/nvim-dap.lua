return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        ------------------------------------------------------------------------
        -- Shared DAP params
        ------------------------------------------------------------------------
        local bin_path = vim.fn.getcwd() .. "/"
        local work_dir = vim.fn.getcwd() .. "/"
        local args = {}

        -- Creates a command that allows for setting DAP parameters
        vim.api.nvim_create_user_command("DapConfig", function()
            bin_path = vim.fn.input("Path to executable: ", bin_path, "file")
            work_dir = vim.fn.input("Path to working directory: ", work_dir, "file")
            local arg_str = vim.fn.input("Program arguments: ", table.concat(args, " "))
            args = vim.fn.split(arg_str, " ", true)
        end, { desc = "Configure DAP launch params" })

        ------------------------------------------------------------------------
        -- C and C++
        ------------------------------------------------------------------------
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            -- Binary location for vscode-cpptools as installed by Mason
            command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
        }

        local cpp_config = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return bin_path
                end,
                cwd = function()
                    return work_dir
                end,
                args = function()
                    return args
                end,
                stopAtEntry = false,
                -- TODO: Check that the setup commands below work as intended.
                setupCommands = {
                    {
                        text = "-enable-pretty-printing",
                        description = "enable pretty printing",
                        ignoreFailures = false,
                    },
                },
            },
        }

        dap.configurations.c = cpp_config
        dap.configurations.cpp = cpp_config
    end,
}

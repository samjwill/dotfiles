-- Debugger params
local default_working_dir = vim.fn.getcwd().."/"
local default_bin_path = vim.fn.getcwd().."/"
local default_argument_string = ""

local dap = require('dap')

-- C++
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    -- Binary location for vscode-cpptools as installed by Mason
    command = vim.fn.stdpath("data").."/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            default_bin_path = vim.fn.input('Path to executable: ', default_bin_path, 'file')
            return default_bin_path
        end,
        cwd = function()
            default_working_dir = vim.fn.input('Path to working directory: ', default_working_dir, 'file')
            return default_working_dir
        end,
        args = function()
            default_argument_string = vim.fn.input('Program arguments: ')
            return vim.fn.split(default_argument_string, " ", true)
        end,
        stopAtEntry = true,
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                description =  'enable pretty printing',
                ignoreFailures = false
            },
        },
    },
}

-- DAP UI
require("dapui").setup()
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

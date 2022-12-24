local dap = require('dap')

-- C++
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    -- Binary location for vscode-cpptools as installed by Mason
    command = vim.fn.stdpath("data").."/mason/bin/OpenDebugAD7",
}

-- Debugger params
local default_working_dir = vim.fn.getcwd().."/"
local default_bin_path = vim.fn.getcwd().."/"
local default_argument_string = ""

-- This is pretty messy. Lua doesn't have classes so I'm not sure how much
-- cleaner I can make it with just a table. The idea is, only prompt the user
-- to specify these fields if it is initial run. Otherwise, the user will be
-- prompted every time debugging is restarted, even by click the restart button
-- on the ui.
local work_dir_set = false
local bin_path_set = false
local args_set = false

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            if (work_dir_set and bin_path_set and args_set) then
                return default_bin_path
            end
            -- Update the default value so that the next time the prompt is
            -- done, it's pre-populated with the last entered value.
            default_bin_path = vim.fn.input('Path to executable: ', default_bin_path, 'file')
            bin_path_set = true
            return default_bin_path
        end,
        cwd = function()
            if (work_dir_set and bin_path_set and args_set) then
                return default_working_dir
            end
            -- Update the default value so that the next time the prompt is
            -- done, it's pre-populated with the last entered value.
            default_working_dir = vim.fn.input('Path to working directory: ', default_working_dir, 'file')
            work_dir_set = true
            return default_working_dir
        end,
        args = function()
            if (work_dir_set and bin_path_set and args_set) then
                return default_argument_string
            end
            -- Update the default value so that the next time the prompt is
            -- done, it's pre-populated with the last entered value.
            default_argument_string = vim.fn.input('Program arguments: ')
            args_set = true
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

    -- We now want the user to be prompted.
    work_dir_set = false
    bin_path_set = false
    args_set = false
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()

    -- We now want the user to be prompted.
    work_dir_set = false
    bin_path_set = false
    args_set = false
end

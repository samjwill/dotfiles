vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/rcarriga/nvim-dap-ui",
})

---@diagnostic disable: missing-fields
require("dapui").setup({
    controls = {
        icons = {
            disconnect = "DC",
            pause = "Pause",
            play = "Play",
            run_last = "Run-Last",
            step_back = "Step-Back",
            step_into = "Step-Into",
            step_out = "Step-Out",
            step_over = "Step-Over",
            terminate = "Kill"
        }
    },
    icons = {
        collapsed = "Collapsed",
        current_frame = "Current-Frame",
        expanded = "Expanded"
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
        }, {
            id = "breakpoints",
            size = 0.25
        }, {
            id = "stacks",
            size = 0.25
        }, {
            id = "watches",
            size = 0.25
        } },
        position = "left",
        size = 40
    }, {
        elements = { {
            id = "repl",
            size = 0.6
        }, {
            id = "console",
            size = 0.4
        } },
        position = "bottom",
        size = 10
    } },
})
---@diagnostic enable: missing-fields
local dap = require("dap")

------------------------------------------------------------------------
-- Shared DAP params
------------------------------------------------------------------------
local bin_path = vim.fn.getcwd() .. "/"
local work_dir = vim.fn.getcwd() .. "/"
local args = {}

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
    },
}

dap.configurations.c = cpp_config
dap.configurations.cpp = cpp_config

------------------------------------------------------------------------
-- Python
------------------------------------------------------------------------
dap.adapters.python = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        name = "Launch file",
        type = "python",
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
    },
}

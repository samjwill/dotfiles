local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

-- Turn off line numbers in terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

-- Automatically press some key to dismiss "[Process exited 0]"
-- Need to use feedkeys because of https://github.com/neovim/neovim/issues/4895
vim.api.nvim_create_autocmd("TermClose",
    {
        group = init_group,
        callback = function()
            -- Key pressed is arbitrary.
            vim.fn.feedkeys("i")
        end
    }
)

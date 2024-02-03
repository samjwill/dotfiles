local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

-- Turn off line numbers in terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

-- Automatically press some key to dismiss "[Process exited 0]"
-- Need to use feedkeys because of https://github.com/neovim/neovim/issues/4895
vim.api.nvim_create_autocmd("TermClose",
    {
        group = init_group,
        callback = function()
            -- Plugins like unception can delete a terminal buffer when opening
            -- a new file. This is expected, but that means that without
            -- filtering this callback, it can trigger when not desired, and we
            -- don't appear to have the ability to try to get the buftype to
            -- filter it due to the issue linked above.
            --
            -- As a result, we need to just make sure that the keys fed not do
            -- anything. Feeding "jk" won't work, because if j is pressed, it
            -- may or may not close the terminal buffer, and then "k" will be
            -- feed on the following buffer iff j dismisses the finished
            -- terminal buffer. Trying to execute feedkeys "\\<Esc>" appears to
            -- confuse flash.nvim. This is what I came up with...
            local escape_key = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
            vim.api.nvim_feedkeys(escape_key, 'n', false)
        end
    }
)

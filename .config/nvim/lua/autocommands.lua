local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

-- Turn off line numbers in terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

vim.api.nvim_create_autocmd("TermClose",
    {
        group = init_group,
        callback = function()
            -- Check if we just closed the last open window.
            local should_exit = false
            local num_tabs_open = vim.fn.tabpagenr('$')
            if (num_tabs_open == 1) then
                local num_windows_open = #vim.fn.tabpagebuflist()
                if (num_windows_open == 1) then
                    should_exit = true
                end
            end

            -- Automatically press some key to dismiss "[Process exited 0]"
            -- Need to use feedkeys because of https://github.com/neovim/neovim/issues/4895
            --
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

            if (should_exit) then
                vim.cmd("quit")
            end
        end
    }
)

local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

-- Turn off line numbers in terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

-- Automatically press some key to dismiss "[Process exited 0]", and close nvim
-- if the terminal buffer that closed was the only unhidden, unmodified buffer.
vim.api.nvim_create_autocmd("TermClose",
    {
        group = init_group,
        callback = function()
            -- Need to use feedkeys because of https://github.com/neovim/neovim/issues/4895
            --
            -- Plugins like unception can delete a terminal buffer when opening
            -- a new file. This is expected, but that means that without
            -- filtering this callback, it can trigger when not desired, and we
            -- don't appear to have the ability to get the buftype to filter
            -- out the undesired occasions wherein this function is invoked due
            -- to the issue linked above.
            --
            -- As a result, we need to just make sure that the keys that are
            -- fed not do anything. Feeding "jk" won't work, because if "j" is
            -- pressed, it may or may not close the terminal buffer, and then
            -- "k" would be fed on the following buffer iff "j" dismisses the
            -- completed terminal buffer. Trying to execute feedkeys "\\<Esc>"
            -- appears to confuse flash.nvim. This is what I came up with...
            local escape_key = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
            vim.api.nvim_feedkeys(escape_key, 'n', false)

            -- This is deep magic and doesn't work the way that you would
            -- expect it to. "no_modified_buffers_exist" is only set to true if
            -- the last open buffer is a terminal, that terminal buffer is not
            -- open in another window in the same tab, AND the terminal buffer
            -- is exited normally (e.g. via entering the "exit" command).
            --
            -- Using :bdelete! <terminal_buffer#> will not cause it to be true,
            -- which is actually desireable, as if we had another unmodified
            -- buffer open in another tab or window (or if the terminal buffer
            -- was hidden), and then called bdelete! on the terminal buffer we
            -- wouldn't want to :quit.
            local no_modified_buffers_exist = true
            for _, buffer in ipairs(vim.fn.getbufinfo()) do
                if buffer.changed == 1 then
                    no_modified_buffers_exist = false
                    break
                end
            end
            if (no_modified_buffers_exist) then
                vim.cmd("quit")
            end
        end
    }
)

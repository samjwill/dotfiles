-- TODO - list of things that don't work quite right and need to be addressed.
-- Using `:ter <my_command>` without automatically closing buffer.
-- Terminal buffer being deleted when it's still visible using unception
-- Termdebug does not always follow highlighting
-- Hop not working when terminal buffer has focus or when inside of commandline window

require("settings")
require("keymaps")

-- Autocommands
    local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

    -- Turn off line numbers in terminal emulator
    vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

    -- Automatically close terminal buffer when done.
    -- TODO: This breaks the :ter command.
    vim.api.nvim_create_autocmd("TermClose", {group = init_group,command = "if !v:event.status | execute 'bdelete! ' . expand('<abuf>') | endif"})

--------------------------------------------------------------------------------
--                                 Plugins                                    --
--                                                                            --
--------------------------------------------------------------------------------

require("plugins")


local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

-- Turn off line numbers in terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

-- Automatically close terminal buffer when done.
-- TODO: This breaks the :ter command.
vim.api.nvim_create_autocmd("TermClose", {group = init_group,command = "if !v:event.status | execute 'bdelete! ' . expand('<abuf>') | endif"})


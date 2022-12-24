local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

-- Turn off line numbers in terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

-- Automatically close terminal buffer when done.
-- vim.api.nvim_create_autocmd("TermClose", {group = init_group,command = "if !v:event.status | execute 'bdelete! ' . expand('<abuf>') | endif"})
-- TODO: This autocmd causes the error below...
-- Error detected while processing TermClose Autocommands for "*":
-- E516: No buffers were deleted: bdelete! 7

-------------------------------------------------------------------------------
-- Netrw
-------------------------------------------------------------------------------
vim.g.netrw_banner = 0
-- vim.g.netrw_bufsettings = "noma nomod number nobl nowrap ro" -- All but "number" are default.

-- Hide . and .. directories.
vim.g.netrw_list_hide = ""
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. "^\\./"
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ","
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. "^\\.\\./"


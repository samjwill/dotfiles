require('hop').setup{}

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('', 's', '<CMD>HopWordMW<CR>', opts)
vim.api.nvim_set_keymap('', 'S', '<CMD>HopPatternMW<CR>', opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> s <CMD>HopWordMW<CR>")
vim.cmd("autocmd FileType netrw nnoremap <buffer> S <CMD>HopPatternMW<CR>")

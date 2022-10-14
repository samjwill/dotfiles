require'hop'.setup {
    keys = 'etovxqpdygfblzhckisuran'
}

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', 's', '<CMD>HopWordMW<CR>', opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> s <CMD>HopWordMW<CR>")

vim.api.nvim_set_keymap('n', 'S', '<CMD>HopChar1MW<CR>', opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> S <CMD>HopChar1MW<CR>")

vim.api.nvim_set_keymap('n', '/', '<CMD>HopPatternMW<CR>', opts)
vim.api.nvim_set_keymap('n', '?', '<CMD>HopPatternMW<CR>', opts)

local opts = { noremap=true, silent=true }

require'hop'.setup {
    keys = 'etovxqpdygfblzhckisuran'
}

vim.api.nvim_set_keymap('n', 's', ':HopWordMW<CR>',    opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> s :HopWordMW<CR>")

vim.api.nvim_set_keymap('n', 'S', ':HopChar1MW<CR>',    opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> S :HopChar1MW<CR>")

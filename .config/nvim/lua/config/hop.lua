require'hop'.setup {
    keys = 'etovxqpdygfblzhckisuran',
    multi_windows = true,
}
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('', 's', ':HopWordMW<CR>',    opts)
vim.api.nvim_set_keymap('', 'S', ':HopChar1MW<CR>',    opts)

require'hop'.setup {
    keys = 'etovxqpdygfblzhckisuran'
}

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('', 's', '<CMD>HopWordMW<CR>', opts)
vim.api.nvim_set_keymap('', 'S', '<CMD>HopChar1MW<CR>', opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> s <CMD>HopWordMW<CR>")
vim.cmd("autocmd FileType netrw nnoremap <buffer> S <CMD>HopChar1MW<CR>")

vim.api.nvim_set_keymap('', '/', '<CMD>HopPatternMW<CR>', opts)
vim.api.nvim_set_keymap('', '?', '<CMD>HopPatternMW<CR>', opts)
vim.cmd("noremap <Leader>/ /")
vim.cmd("noremap <Leader>? ?")

vim.keymap.set('', 'f', function()
    require('hop').hint_char1({ require('hop.hint').HintDirection = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
    require('hop').hint_char1({ require('hop.hint').HintDirection = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
    require('hop').hint_char1({ require('hop.hint').HintDirection = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
    require('hop').hint_char1({ require('hop.hint').HintDirection = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

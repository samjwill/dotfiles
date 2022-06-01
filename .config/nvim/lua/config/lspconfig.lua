-- TODO: Group these keybinds where the rest of the keybinds are defined.

local lsp_leader = '<space>l'

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', lsp_leader..'e',     '<cmd>lua vim.diagnostic.open_float()<CR>',   opts)
vim.api.nvim_set_keymap('n', lsp_leader..'[d',    '<cmd>lua vim.diagnostic.goto_prev()<CR>',    opts)
vim.api.nvim_set_keymap('n', lsp_leader..']d',    '<cmd>lua vim.diagnostic.goto_next()<CR>',    opts)
vim.api.nvim_set_keymap('n', lsp_leader..'q',     '<cmd>lua vim.diagnostic.setloclist()<CR>',   opts)
vim.api.nvim_set_keymap('n', lsp_leader..'gD',    '<cmd>lua vim.lsp.buf.declaration()<CR>',     opts)
vim.api.nvim_set_keymap('n', lsp_leader..'gd',    '<cmd>lua vim.lsp.buf.definition()<CR>',      opts)
vim.api.nvim_set_keymap('n', lsp_leader..'K',     '<cmd>lua vim.lsp.buf.hover()<CR>',           opts)
vim.api.nvim_set_keymap('n', lsp_leader..'gi',    '<cmd>lua vim.lsp.buf.implementation()<CR>',  opts)
vim.api.nvim_set_keymap('n', lsp_leader..'<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',  opts)
vim.api.nvim_set_keymap('n', lsp_leader..'td',    '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', lsp_leader..'rn',    '<cmd>lua vim.lsp.buf.rename()<CR>',          opts)
vim.api.nvim_set_keymap('n', lsp_leader..'ca',    '<cmd>lua vim.lsp.buf.code_action()<CR>',     opts)
vim.api.nvim_set_keymap('n', lsp_leader..'gr',    '<cmd>lua vim.lsp.buf.references()<CR>',      opts)
vim.api.nvim_set_keymap('n', lsp_leader..'f',     '<cmd>lua vim.lsp.buf.formatting()<CR>',      opts)

require('lspconfig').clangd.setup{
    map('n', lsp_leader..'a', ':ClangdSwitchSourceHeader<CR>')
}

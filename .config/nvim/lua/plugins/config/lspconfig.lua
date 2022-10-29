--TODO: Look into snippets and auto-completion.
local lsp_leader = '<space>l'
local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', lsp_leader..'[', '<cmd>lua vim.diagnostic.goto_prev()<CR>',    opts)
vim.api.nvim_set_keymap('n', lsp_leader..']', '<cmd>lua vim.diagnostic.goto_next()<CR>',    opts)
vim.api.nvim_set_keymap('n', lsp_leader..'c', '<cmd>lua vim.lsp.buf.code_action()<CR>',     opts)
vim.api.nvim_set_keymap('n', lsp_leader..'d', '<cmd>lua vim.lsp.buf.definition()<CR>',      opts)
vim.api.nvim_set_keymap('n', lsp_leader..'D', '<cmd>lua vim.lsp.buf.declaration()<CR>',     opts)
vim.api.nvim_set_keymap('n', lsp_leader..'f', '<cmd>lua vim.lsp.buf.formatting()<CR>',      opts)
vim.api.nvim_set_keymap('n', lsp_leader..'i', '<cmd>lua vim.lsp.buf.implementation()<CR>',  opts)
vim.api.nvim_set_keymap('n', lsp_leader..'r', '<cmd>lua vim.lsp.buf.references()<CR>',      opts)
vim.api.nvim_set_keymap('n', lsp_leader..'e', '<cmd>lua vim.diagnostic.open_float()<CR>',   opts)
vim.api.nvim_set_keymap('n', lsp_leader..'k', '<cmd>lua vim.lsp.buf.hover()<CR>',           opts)
vim.api.nvim_set_keymap('n', lsp_leader..'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>',  opts)
vim.api.nvim_set_keymap('n', lsp_leader..'q', '<cmd>lua vim.diagnostic.setloclist()<CR>',   opts)
vim.api.nvim_set_keymap('n', lsp_leader..'s', '<cmd>lua vim.lsp.buf.rename()<CR>',          opts)
vim.api.nvim_set_keymap('n', lsp_leader..'t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

local on_attach_func = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- If changing these, update the values in mason-lspconfig as well.
require('lspconfig').clangd.setup{
    vim.api.nvim_set_keymap('n', lsp_leader..'a', '<cmd>ClangdSwitchSourceHeader<CR>',       opts),
    on_attach = on_attach_func
}

--require('lspconfig').sumneko_lua.setup{
--    on_attach = on_attach_func
--}

--TODO: Look into potentially using: vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

--TODO: Implement below:
local symbols = {
    {name = "DiagnosticSignError", text = ''}, -- xf659
    {name = "DiagnosticSignWarn", text = ''}, -- xf529
    {name = "DiagnosticSignInfo", text = ''}, -- xf7fc
    {name = "DiagnosticSignHint", text = ''}, -- xf835
}


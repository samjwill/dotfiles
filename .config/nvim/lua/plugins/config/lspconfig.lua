--TODO: Look into snippets and auto-completion.
local lsp_leader = '<space>l'
local opts = { noremap=true, silent=true }


local on_attach_func = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- If changing these, update the values in mason-lspconfig as well.
require('lspconfig').clangd.setup{
    clangd_keymaps,
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


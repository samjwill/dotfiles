-- TODO: Group these keybinds where the rest of the keybinds are defined.

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>le',     '<cmd>lua vim.diagnostic.open_float()<CR>',   opts)
vim.api.nvim_set_keymap('n', '<space>l[d',    '<cmd>lua vim.diagnostic.goto_prev()<CR>',    opts)
vim.api.nvim_set_keymap('n', '<space>l]d',    '<cmd>lua vim.diagnostic.goto_next()<CR>',    opts)
vim.api.nvim_set_keymap('n', '<space>lq',     '<cmd>lua vim.diagnostic.setloclist()<CR>',   opts)
vim.api.nvim_set_keymap('n', '<space>lgD',    '<cmd>lua vim.lsp.buf.declaration()<CR>',     opts)
vim.api.nvim_set_keymap('n', '<space>lgd',    '<cmd>lua vim.lsp.buf.definition()<CR>',      opts)
vim.api.nvim_set_keymap('n', '<space>lK',     '<cmd>lua vim.lsp.buf.hover()<CR>',           opts)
vim.api.nvim_set_keymap('n', '<space>lgi',    '<cmd>lua vim.lsp.buf.implementation()<CR>',  opts)
vim.api.nvim_set_keymap('n', '<space>l<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',  opts)
vim.api.nvim_set_keymap('n', '<space>ltd',    '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>lrn',    '<cmd>lua vim.lsp.buf.rename()<CR>',          opts)
vim.api.nvim_set_keymap('n', '<space>lca',    '<cmd>lua vim.lsp.buf.code_action()<CR>',     opts)
vim.api.nvim_set_keymap('n', '<space>lgr',    '<cmd>lua vim.lsp.buf.references()<CR>',      opts)
vim.api.nvim_set_keymap('n', '<space>lf',     '<cmd>lua vim.lsp.buf.formatting()<CR>',      opts)

require('lspconfig').clangd.setup{}

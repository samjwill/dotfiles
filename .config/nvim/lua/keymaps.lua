vim.g.mapleader = " "

-- Don't want to :set ignorecase because * and # should be case-sensitive
vim.api.nvim_set_keymap("", "/", "/\\c", {})
vim.api.nvim_set_keymap("", "?", "?\\c", {})
vim.api.nvim_set_keymap("", "<Leader>/", "/", {})
vim.api.nvim_set_keymap("", "<Leader>?", "?", {})

-- "-" to edit directory of current file
vim.api.nvim_set_keymap("", "-", ":e %:p:h<CR>", {})

-- shift-tab to inverse tab
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", {})

-- Tab switching
--     Some terminals intercept these keystrokes, so if these mappings don't
--     work, check the terminal settings. For Konsole, unbind everything else
--     in Settings>Keyboard Shortcuts and then bind:
--         Backtab+Ctrl+Ansi -> \E[27;6;9~
--         Tab+Ctrl+Ansi     -> \E[27;5;9~
vim.api.nvim_set_keymap("n", "<C-Tab>",   "<CMD>tabn<CR>",            {})
vim.api.nvim_set_keymap("c", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.api.nvim_set_keymap("i", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.api.nvim_set_keymap("t", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.api.nvim_set_keymap("v", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.api.nvim_set_keymap("n", "<C-S-Tab>", "<CMD>tabp<CR>",            {})
vim.api.nvim_set_keymap("c", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})
vim.api.nvim_set_keymap("i", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})
vim.api.nvim_set_keymap("t", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})
vim.api.nvim_set_keymap("v", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})

-- Escape to escape a terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- Ctrl-q to send escape to a terminal
vim.api.nvim_set_keymap("t", "<C-q>", "<Esc>", {})


-------------------------------------------------------------------------------
-- Hop Plugin
-------------------------------------------------------------------------------
vim.api.nvim_set_keymap('', 's', '<CMD>HopWordMW<CR>', {})
vim.api.nvim_set_keymap('', 'S', '<CMD>HopChar2MW<CR>', {})
vim.cmd("autocmd FileType netrw nnoremap <buffer> s <CMD>HopWordMW<CR>")
vim.cmd("autocmd FileType netrw nnoremap <buffer> S <CMD>HopChar2MW<CR>")


-------------------------------------------------------------------------------
-- LSP Plugin
-------------------------------------------------------------------------------
local lsp_leader = vim.g.mapleader.."l"

vim.api.nvim_set_keymap('n', lsp_leader..'[', '<CMD>lua vim.diagnostic.goto_prev()<CR>',    {})
vim.api.nvim_set_keymap('n', lsp_leader..']', '<CMD>lua vim.diagnostic.goto_next()<CR>',    {})
vim.api.nvim_set_keymap('n', lsp_leader..'c', '<CMD>lua vim.lsp.buf.code_action()<CR>',     {})
vim.api.nvim_set_keymap('n', lsp_leader..'d', '<CMD>lua vim.lsp.buf.definition()<CR>',      {})
vim.api.nvim_set_keymap('n', lsp_leader..'D', '<CMD>lua vim.lsp.buf.declaration()<CR>',     {})
vim.api.nvim_set_keymap('n', lsp_leader..'f', '<CMD>lua vim.lsp.buf.formatting()<CR>',      {})
vim.api.nvim_set_keymap('n', lsp_leader..'i', '<CMD>lua vim.lsp.buf.implementation()<CR>',  {})
vim.api.nvim_set_keymap('n', lsp_leader..'r', '<CMD>lua vim.lsp.buf.references()<CR>',      {})
vim.api.nvim_set_keymap('n', lsp_leader..'e', '<CMD>lua vim.diagnostic.open_float()<CR>',   {})
vim.api.nvim_set_keymap('n', lsp_leader..'k', '<CMD>lua vim.lsp.buf.hover()<CR>',           {})
vim.api.nvim_set_keymap('n', lsp_leader..'K', '<CMD>lua vim.lsp.buf.signature_help()<CR>',  {})
vim.api.nvim_set_keymap('n', lsp_leader..'q', '<CMD>lua vim.diagnostic.setloclist()<CR>',   {})
vim.api.nvim_set_keymap('n', lsp_leader..'s', '<CMD>lua vim.lsp.buf.rename()<CR>',          {})
vim.api.nvim_set_keymap('n', lsp_leader..'t', '<CMD>lua vim.lsp.buf.type_definition()<CR>', {})

clangd_keymaps = vim.api.nvim_set_keymap('n', lsp_leader..'a', '<CMD>ClangdSwitchSourceHeader<CR>', {})


-------------------------------------------------------------------------------
-- Bufdir Plugin
-------------------------------------------------------------------------------
local command_line_leader = vim.g.mapleader.."c"

vim.api.nvim_set_keymap("", command_line_leader.."c", "<CMD>Bufdir terminal<CR>i", {})
vim.api.nvim_set_keymap("", command_line_leader.."C", "<CMD>terminal<CR>i", {})
vim.api.nvim_set_keymap("", command_line_leader.."s", "<CMD>split | Bufdir terminal<CR>i", {})
vim.api.nvim_set_keymap("", command_line_leader.."S", "<CMD>split | terminal<CR>i", {})
vim.api.nvim_set_keymap("", command_line_leader.."v", "<CMD>vsplit | Bufdir terminal<CR>i", {})
vim.api.nvim_set_keymap("", command_line_leader.."V", "<CMD>vsplit | terminal<CR>i", {})


-------------------------------------------------------------------------------
-- Telescope Plugin
-------------------------------------------------------------------------------
local telescope_leader = vim.g.mapleader.."t"

vim.api.nvim_set_keymap("", telescope_leader.."/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", {})
vim.api.nvim_set_keymap("", telescope_leader.."f", "<CMD>Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("", telescope_leader.."l", "<CMD>Telescope live_grep<CR>", {})
vim.api.nvim_set_keymap("", telescope_leader.."t", "<CMD>Telescope<CR>", {})


-------------------------------------------------------------------------------
-- Mini.Map Plugin
-------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<Leader>m", "<CMD>lua MiniMap.toggle()<CR>", { desc="Toggle MiniMap"})


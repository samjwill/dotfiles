vim.g.mapleader = " "

-- Don't want to :set ignorecase because * and # should be case-sensitive
vim.keymap.set("", "/", "/\\c", {})
vim.keymap.set("", "?", "?\\c", {})
vim.keymap.set("", "<Leader>/", "/", {})
vim.keymap.set("", "<Leader>?", "?", {})

-- "-" to edit directory of current file
vim.keymap.set("", "-", ":e %:p:h<CR>", {})

-- shift-tab to inverse tab
vim.keymap.set("i", "<S-Tab>", "<C-d>", {})

-- Tab switching
--     Some terminals intercept these keystrokes, so if these mappings don't
--     work, check the terminal settings. For Konsole, unbind everything else
--     in Settings>Keyboard Shortcuts and then bind:
--         Backtab+Ctrl+Ansi -> \E[27;6;9~
--         Tab+Ctrl+Ansi     -> \E[27;5;9~
vim.keymap.set("n", "<C-Tab>",   "<CMD>tabn<CR>",            {})
vim.keymap.set("c", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.keymap.set("i", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.keymap.set("t", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.keymap.set("v", "<C-Tab>",   "<C-\\><C-N><CMD>tabn<CR>", {})
vim.keymap.set("n", "<C-S-Tab>", "<CMD>tabp<CR>",            {})
vim.keymap.set("c", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})
vim.keymap.set("i", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})
vim.keymap.set("t", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})
vim.keymap.set("v", "<C-S-Tab>", "<C-\\><C-N><CMD>tabp<CR>", {})

-- Escape to escape a terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})

-- Ctrl-q to send escape to a terminal
vim.keymap.set("t", "<C-q>", "<Esc>", {})


-------------------------------------------------------------------------------
-- Hop Plugin
-------------------------------------------------------------------------------
vim.keymap.set('', 's', '<CMD>HopWordMW<CR>', {})
vim.keymap.set('', 'S', '<CMD>HopChar2MW<CR>', {})
vim.cmd("autocmd FileType netrw nnoremap <buffer> s <CMD>HopWordMW<CR>")
vim.cmd("autocmd FileType netrw nnoremap <buffer> S <CMD>HopChar2MW<CR>")


-------------------------------------------------------------------------------
-- LSP Plugin
-------------------------------------------------------------------------------
local lsp_leader = vim.g.mapleader.."l"

vim.keymap.set('n', lsp_leader..'[', '<CMD>lua vim.diagnostic.goto_prev()<CR>',    {})
vim.keymap.set('n', lsp_leader..']', '<CMD>lua vim.diagnostic.goto_next()<CR>',    {})
vim.keymap.set('n', lsp_leader..'c', '<CMD>lua vim.lsp.buf.code_action()<CR>',     {})
vim.keymap.set('n', lsp_leader..'d', '<CMD>lua vim.lsp.buf.definition()<CR>',      {})
vim.keymap.set('n', lsp_leader..'D', '<CMD>lua vim.lsp.buf.declaration()<CR>',     {})
vim.keymap.set('n', lsp_leader..'f', '<CMD>lua vim.lsp.buf.formatting()<CR>',      {})
vim.keymap.set('n', lsp_leader..'i', '<CMD>lua vim.lsp.buf.implementation()<CR>',  {})
vim.keymap.set('n', lsp_leader..'r', '<CMD>lua vim.lsp.buf.references()<CR>',      {})
vim.keymap.set('n', lsp_leader..'e', '<CMD>lua vim.diagnostic.open_float()<CR>',   {})
vim.keymap.set('n', lsp_leader..'k', '<CMD>lua vim.lsp.buf.hover()<CR>',           {})
vim.keymap.set('n', lsp_leader..'K', '<CMD>lua vim.lsp.buf.signature_help()<CR>',  {})
vim.keymap.set('n', lsp_leader..'q', '<CMD>lua vim.diagnostic.setloclist()<CR>',   {})
vim.keymap.set('n', lsp_leader..'s', '<CMD>lua vim.lsp.buf.rename()<CR>',          {})
vim.keymap.set('n', lsp_leader..'t', '<CMD>lua vim.lsp.buf.type_definition()<CR>', {})

clangd_keymaps = vim.keymap.set('n', lsp_leader..'a', '<CMD>ClangdSwitchSourceHeader<CR>', {})


-------------------------------------------------------------------------------
-- Bufdir Plugin
-------------------------------------------------------------------------------
local command_line_leader = vim.g.mapleader.."c"

vim.keymap.set("", command_line_leader.."c", "<CMD>Bufdir terminal<CR>i", {})
vim.keymap.set("", command_line_leader.."C", "<CMD>terminal<CR>i", {})
vim.keymap.set("", command_line_leader.."s", "<CMD>split | Bufdir terminal<CR>i", {})
vim.keymap.set("", command_line_leader.."S", "<CMD>split | terminal<CR>i", {})
vim.keymap.set("", command_line_leader.."v", "<CMD>vsplit | Bufdir terminal<CR>i", {})
vim.keymap.set("", command_line_leader.."V", "<CMD>vsplit | terminal<CR>i", {})


-------------------------------------------------------------------------------
-- Telescope Plugin
-------------------------------------------------------------------------------
local telescope_leader = vim.g.mapleader.."t"

vim.keymap.set("", telescope_leader.."/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", {})
vim.keymap.set("", telescope_leader.."f", "<CMD>Telescope find_files<CR>", {})
vim.keymap.set("", telescope_leader.."l", "<CMD>Telescope live_grep<CR>", {})
vim.keymap.set("", telescope_leader.."t", "<CMD>Telescope<CR>", {})


-------------------------------------------------------------------------------
-- Mini.Map Plugin
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>m", "<CMD>lua MiniMap.toggle()<CR>", { desc="Toggle MiniMap"})


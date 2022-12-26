prefix_list = {} -- For key menu plugin.

vim.g.mapleader = " "
table.insert(prefix_list, {"n", "<Space>"})

-- Don't want to :set ignorecase because * and # should be case-sensitive
vim.keymap.set("", "/", "/\\c", {})
vim.keymap.set("", "?", "?\\c", {})

-- "-" to edit directory of current file
vim.keymap.set("", "-", ":e %:p:h<CR>", {silent=true})

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
-- LSP Plugin
-------------------------------------------------------------------------------
local lsp_leader = vim.g.mapleader.."l"
table.insert(prefix_list, {"n", "<Space>l", {desc="Language Server Protocol"}})

vim.keymap.set('n', lsp_leader..'[', '<CMD>lua vim.diagnostic.goto_prev()<CR>',    {desc = "Previous Diagnostic"})
vim.keymap.set('n', lsp_leader..']', '<CMD>lua vim.diagnostic.goto_next()<CR>',    {desc = "Next Diagnostic"})
vim.keymap.set('n', lsp_leader..'c', '<CMD>lua vim.lsp.buf.code_action()<CR>',     {desc = "Code Action"})
vim.keymap.set('n', lsp_leader..'d', '<CMD>lua vim.lsp.buf.definition()<CR>',      {desc = "Go to Definition"})
vim.keymap.set('n', lsp_leader..'D', '<CMD>lua vim.lsp.buf.declaration()<CR>',     {desc = "Go to Declaration"})
vim.keymap.set('n', lsp_leader..'f', '<CMD>lua vim.lsp.buf.formatting()<CR>',      {desc = "Format Buffer"})
vim.keymap.set('n', lsp_leader..'i', '<CMD>lua vim.lsp.buf.implementation()<CR>',  {desc = "Go to Implementation"})
vim.keymap.set('n', lsp_leader..'r', '<CMD>lua vim.lsp.buf.references()<CR>',      {desc = "Show All References"})
vim.keymap.set('n', lsp_leader..'e', '<CMD>lua vim.diagnostic.open_float()<CR>',   {desc = "Floating Diagnostic"})
vim.keymap.set('n', lsp_leader..'k', '<CMD>lua vim.lsp.buf.hover()<CR>',           {desc = "Hover"})
vim.keymap.set('n', lsp_leader..'K', '<CMD>lua vim.lsp.buf.signature_help()<CR>',  {desc = "Signature"})
vim.keymap.set('n', lsp_leader..'q', '<CMD>lua vim.diagnostic.setloclist()<CR>',   {desc = "Set Location List"})
vim.keymap.set('n', lsp_leader..'s', '<CMD>lua vim.lsp.buf.rename()<CR>',          {desc = "Rename"})
vim.keymap.set('n', lsp_leader..'t', '<CMD>lua vim.lsp.buf.type_definition()<CR>', {desc = "Type Definition"})

clangd_keymaps = vim.keymap.set('n', lsp_leader..'a', '<CMD>ClangdSwitchSourceHeader<CR>', {desc = "Switch to Source/Header"})


-------------------------------------------------------------------------------
-- Bufdir Plugin
-------------------------------------------------------------------------------
local command_line_leader = vim.g.mapleader.."c"
table.insert(prefix_list, {"n", "<Space>c", {desc="Command Line"}})

vim.keymap.set("", command_line_leader.."c", "<CMD>Bufdir terminal<CR>i", {desc = "Open Terminal in Focused Buffer's Directory"})
vim.keymap.set("", command_line_leader.."C", "<CMD>terminal<CR>i", {desc = "Open Terminal"})
vim.keymap.set("", command_line_leader.."s", "<CMD>split | Bufdir terminal<CR>i", {desc = "Split Terminal in Focused Buffer's Directory"})
vim.keymap.set("", command_line_leader.."S", "<CMD>split | terminal<CR>i", {desc = "Split Terminal"})
vim.keymap.set("", command_line_leader.."v", "<CMD>vsplit | Bufdir terminal<CR>i", {desc = "VSplit Terminal in Focused Buffer's Directory"})
vim.keymap.set("", command_line_leader.."V", "<CMD>vsplit | terminal<CR>i", {desc = "VSplit Terminal"})
vim.keymap.set("", command_line_leader.."t", "<CMD>tab split | Bufdir terminal<CR>i", {desc = "Tabnew Terminal in Focused Buffer's Directory"})
vim.keymap.set("", command_line_leader.."T", "<CMD>tabnew | terminal<CR>i", {desc = "Tabnew Terminal"})

-------------------------------------------------------------------------------
-- Telescope Plugin
-------------------------------------------------------------------------------
local telescope_leader = vim.g.mapleader.."t"
table.insert(prefix_list, {"n", "<Space>t", {desc="Telescope"}})

vim.keymap.set("", telescope_leader.."/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", {desc = "Search Current Buffer"})
vim.keymap.set("", telescope_leader.."f", "<CMD>Telescope find_files<CR>", {desc = "Find Files"})
vim.keymap.set("", telescope_leader.."l", "<CMD>Telescope live_grep<CR>", {desc = "Live Grep Files"})
vim.keymap.set("", telescope_leader.."t", "<CMD>Telescope<CR>", {desc = "All Options"})


-------------------------------------------------------------------------------
-- Mini.Map Plugin
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>m", "<CMD>lua MiniMap.toggle()<CR>", { desc="Toggle MiniMap"})

-------------------------------------------------------------------------------
-- Debug Adapter Protocol Plugin
-------------------------------------------------------------------------------

local debug_leader = vim.g.mapleader.."d"
table.insert(prefix_list, {"n", "<Space>d", {desc="Debugger"}})
vim.keymap.set("n", "<F1>", "<CMD>lua require('dap').continue()<CR>", {desc = "Continue"})
vim.keymap.set("n", "<F2>", "<CMD>lua require('dap').step_into()<CR>", {desc = "Step Into"})
vim.keymap.set("n", "<F3>", "<CMD>lua require('dap').step_over()<CR>", {desc = "Step Over"})
vim.keymap.set("n", "<F4>", "<CMD>lua require('dap').step_out()<CR>", {desc = "Step Out"})
vim.keymap.set("n", debug_leader.."b", "<CMD>lua require('dap').toggle_breakpoint()<CR>", {desc = "Add Breakpoint"})
vim.keymap.set("n", debug_leader.."B", "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {desc = "Add Conditional Breakpoint"})
vim.keymap.set("n", debug_leader.."p", "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {desc = "Log Point Message"})
vim.keymap.set("n", debug_leader.."r", "<CMD>lua require('dap').repl.open()<CR>", {desc = "Open REPL Console"})
vim.keymap.set("n", debug_leader.."l", "<CMD>lua require('dap').run_last()<CR>", {desc = "Run Last"})


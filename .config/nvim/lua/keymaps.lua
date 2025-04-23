vim.g.mapleader = " "

-- Do this instead of :set ignorecase because * and # should be case-sensitive
vim.keymap.set("", "/", "/\\c", {})
vim.keymap.set("", "?", "?\\c", {})

-- "-" to edit directory of current file
vim.keymap.set("", "-", ":e %:p:h<CR>", {silent=true})

-- shift-tab to inverse tab
vim.keymap.set("i", "<S-Tab>", "<C-d>", {})

-- Tab switching
--     Some terminals intercept these keystrokes, so if these mappings don't
--     work, check the terminal settings. For Konsole, unbind everything else
--     associated with these keybindings in Settings>Keyboard Shortcuts and
--     then bind:
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

-- Ctrl-q to send escape key to a terminal buffer
vim.keymap.set("t", "<C-q>", "<Esc>", {})

-- Escape key to actually escape a terminal buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})


-------------------------------------------------------------------------------
-- LSP Plugin
-------------------------------------------------------------------------------
local lsp_leader = vim.g.mapleader.."l"

vim.keymap.set('n', lsp_leader..'[', function() vim.diagnostic.jump({ wrap = false, count = -1 })   end, {desc = "Previous Diagnostic"})
vim.keymap.set('n', lsp_leader..']', function() vim.diagnostic.jump({ wrap = false, count = 1 })    end, {desc = "Next Diagnostic"})
vim.keymap.set('n', lsp_leader..'c', function() vim.lsp.buf.code_action()                           end, {desc = "Code Action"})
vim.keymap.set('n', lsp_leader..'d', function() vim.lsp.buf.definition()                            end, {desc = "Go to Definition"})
vim.keymap.set('n', lsp_leader..'D', function() vim.lsp.buf.declaration()                           end, {desc = "Go to Declaration"})
vim.keymap.set('n', lsp_leader..'f', function() vim.lsp.buf.formatting()                            end, {desc = "Format Buffer"})
vim.keymap.set('n', lsp_leader..'i', function() require("telescope.builtin").lsp_implementations()  end, {desc = "Go to Implementation"})
vim.keymap.set("n", lsp_leader..'r', function() require("telescope.builtin").lsp_references()       end, {desc = "Show All References"})
vim.keymap.set('n', lsp_leader..'e', function() vim.diagnostic.open_float()                         end, {desc = "Floating Diagnostic"})
vim.keymap.set('n', lsp_leader..'k', function() vim.lsp.buf.hover()                                 end, {desc = "Hover"})
vim.keymap.set('n', lsp_leader..'K', function() vim.lsp.buf.signature_help()                        end, {desc = "Signature"})
vim.keymap.set('n', lsp_leader..'q', function() vim.diagnostic.setloclist()                         end, {desc = "Set Location List"})
vim.keymap.set('n', lsp_leader..'s', function() vim.lsp.buf.rename()                                end, {desc = "Rename"})
vim.keymap.set('n', lsp_leader..'t', function() require("telescope.builtin").lsp_type_definitions() end, {desc = "Type Definition"})

clangd_keymaps = vim.keymap.set('n', lsp_leader..'a', '<CMD>ClangdSwitchSourceHeader<CR>', {desc = "Switch to Source/Header"})


-------------------------------------------------------------------------------
-- Bufdir Plugin
-------------------------------------------------------------------------------
local command_line_leader = vim.g.mapleader.."c"

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

vim.keymap.set("", telescope_leader.."/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", {desc = "Search Current Buffer"})
vim.keymap.set("", telescope_leader.."\"", "<CMD>Telescope registers<CR>", {desc = "Registers"})
vim.keymap.set("", telescope_leader.."f", "<CMD>Telescope find_files<CR>", {desc = "Find Files"})
vim.keymap.set("", telescope_leader.."g", "<CMD>Telescope git_files<CR>", {desc = "Find Tracked Git Files"})
vim.keymap.set("", telescope_leader.."l", "<CMD>Telescope live_grep<CR>", {desc = "Live Grep Files"})
vim.keymap.set("", telescope_leader.."q", "<CMD>Telescope quickfix<CR>", {desc = "Quickfix"})
vim.keymap.set("", telescope_leader.."t", "<CMD>Telescope<CR>", {desc = "All Telescope Options"})


-------------------------------------------------------------------------------
-- Mini.Map Plugin
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>m", "<CMD>lua MiniMap.toggle()<CR>", { desc="Toggle MiniMap"})


-------------------------------------------------------------------------------pcall
-- Debug Adapter Protocol Plugin
-------------------------------------------------------------------------------
local debug_leader = vim.g.mapleader.."d"

vim.keymap.set("n", "<F1>", "<CMD>lua require('dap').continue()<CR>", {desc = "Continue"})
vim.keymap.set("n", "<F2>", "<CMD>lua require('dap').step_into()<CR>", {desc = "Step Into"})
vim.keymap.set("n", "<F3>", "<CMD>lua require('dap').step_over()<CR>", {desc = "Step Over"})
vim.keymap.set("n", "<F4>", "<CMD>lua require('dap').step_out()<CR>", {desc = "Step Out"})
vim.keymap.set("n", debug_leader.."b", "<CMD>lua require('dap').toggle_breakpoint()<CR>", {desc = "Add Breakpoint"})
vim.keymap.set("n", debug_leader.."B", "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {desc = "Add Conditional Breakpoint"})
vim.keymap.set("n", debug_leader.."p", "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {desc = "Log Point Message"})
vim.keymap.set("n", debug_leader.."r", "<CMD>lua require('dap').repl.open()<CR>", {desc = "Open REPL Console"})
vim.keymap.set("n", debug_leader.."l", "<CMD>lua require('dap').run_last()<CR>", {desc = "Run Last"})


-------------------------------------------------------------------------------
-- Flash Plugin
-------------------------------------------------------------------------------

local function invoke_with_smartcase(function_to_invoke)
    local initial_ignorecase = vim.opt.ignorecase
    local initial_smartcase = vim.opt.smartcase
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    function_to_invoke()
    vim.opt.ignorecase = initial_ignorecase
    vim.opt.smartcase = initial_smartcase
end

vim.keymap.set("n", "s", function() invoke_with_smartcase(require("flash").jump) end, {desc = "Flash"})
vim.keymap.set("o", "s", function() invoke_with_smartcase(require("flash").jump) end, {desc = "Flash"})
vim.keymap.set("x", "s", function() invoke_with_smartcase(require("flash").jump) end, {desc = "Flash"})

vim.keymap.set("n", "S", function() invoke_with_smartcase(require("flash").treesitter) end, {desc = "Flash Treesitter"})
vim.keymap.set("o", "S", function() invoke_with_smartcase(require("flash").treesitter) end, {desc = "Flash Treesitter"})
vim.keymap.set("x", "S", function() invoke_with_smartcase(require("flash").treesitter) end, {desc = "Flash Treesitter"})

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  callback = function()
    vim.keymap.set("n", "s", function() invoke_with_smartcase(require("flash").jump) end, {remap = true, buffer = true, desc = "Flash"})
    -- Treesitter map won't work with netrw. Just disable it.
    vim.keymap.set("n", "S", function() vim.notify("Flash's treesitter is disabled for netrw buffers!") end, {remap = true, buffer = true})
  end
})

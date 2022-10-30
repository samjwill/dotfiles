vim.g.mapleader = " "

-- Don't want to :set ignorecase because * and # should be case-sensitive
vim.api.nvim_set_keymap("", "/", "/\\c", { noremap=true})
vim.api.nvim_set_keymap("", "?", "?\\c", { noremap=true})
vim.api.nvim_set_keymap("", "<Leader>/", "/", { noremap=true})
vim.api.nvim_set_keymap("", "<Leader>?", "?", { noremap=true})

-- "-" to edit directory of current file
vim.api.nvim_set_keymap("", "-", ":e %:p:h<CR>", { noremap=true, silent=true })

-- shift-tab to inverse tab
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap=true, silent=true })

-------------------------------------------------------------------------------
-- Tab switching
-------------------------------------------------------------------------------
-- Some terminals intercept these keystrokes, so if these mappings don't
-- work, check the terminal settings. For Konsole, unbind everything else
-- in Settings>Keyboard Shortcuts and then bind:
--     Backtab+Ctrl+Ansi -> \E[27;6;9~
--     Tab+Ctrl+Ansi     -> \E[27;5;9~
vim.api.nvim_set_keymap("n", "<C-Tab>", ":tabn<CR>",            {noremap=true, silent=true})
vim.api.nvim_set_keymap("c", "<C-Tab>", "<C-\\><C-N>:tabn<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("i", "<C-Tab>", "<C-\\><C-N>:tabn<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("t", "<C-Tab>", "<C-\\><C-N>:tabn<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<C-Tab>", "<C-\\><C-N>:tabn<CR>", {noremap=true, silent=true})

vim.api.nvim_set_keymap("n", "<C-S-Tab>", ":tabp<CR>",            {noremap=true, silent=true})
vim.api.nvim_set_keymap("c", "<C-S-Tab>", "<C-\\><C-N>:tabp<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("i", "<C-S-Tab>", "<C-\\><C-N>:tabp<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("t", "<C-S-Tab>", "<C-\\><C-N>:tabp<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<C-S-Tab>", "<C-\\><C-N>:tabp<CR>", {noremap=true, silent=true})

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap=true })
vim.api.nvim_set_keymap("t", "<C-q>", "<Esc>", { noremap=true })


-------------------------------------------------------------------------------
-- Hop
-------------------------------------------------------------------------------
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('', 's', '<CMD>HopWordMW<CR>', opts)
vim.api.nvim_set_keymap('', 'S', '<CMD>HopChar2MW<CR>', opts)
vim.cmd("autocmd FileType netrw nnoremap <buffer> s <CMD>HopWordMW<CR>")
vim.cmd("autocmd FileType netrw nnoremap <buffer> S <CMD>HopChar2MW<CR>")


-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
local lsp_leader = vim.g.mapleader.."l"

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

clangd_keymaps = vim.api.nvim_set_keymap('n', lsp_leader..'a', '<cmd>ClangdSwitchSourceHeader<CR>', opts)


-------------------------------------------------------------------------------
-- Bufdir Plugin
-------------------------------------------------------------------------------
local command_line_leader = vim.g.mapleader.."c"

vim.api.nvim_set_keymap("", command_line_leader.."c", ":Bufdir terminal<CR>i", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", command_line_leader.."C", ":terminal<CR>i", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", command_line_leader.."s", ":split | Bufdir terminal<CR>i", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", command_line_leader.."S", ":split | terminal<CR>i", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", command_line_leader.."v", ":vsplit | Bufdir terminal<CR>i", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", command_line_leader.."V", ":vsplit | terminal<CR>i", { noremap=true, silent=true })


-------------------------------------------------------------------------------
-- Telescope Plugin
-------------------------------------------------------------------------------
local telescope_leader = vim.g.mapleader.."t"

vim.api.nvim_set_keymap("", telescope_leader.."/", ":Telescope current_buffer_fuzzy_find<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", telescope_leader.."f", ":Telescope find_files<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", telescope_leader.."l", ":Telescope live_grep<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", telescope_leader.."t", ":Telescope<CR>", { noremap=true, silent=true })


-------------------------------------------------------------------------------
-- Mini.Map Plugin
-------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<Leader>m", "<CMD>lua MiniMap.toggle()<CR>", { noremap=true, silent=true })


-- TODO - list of things that don't work quite right and need to be addressed.
-- Using `:ter <my_command>` without automatically closing buffer.
-- Terminal buffer being deleted when it's still visible using unception
-- Termdebug does not always follow highlighting
-- Hop not working when terminal buffer has focus or when inside of commandline window

--------------------------------------------------------------------------------
--                              Neovim Settings                               --
--                                                                            --
--------------------------------------------------------------------------------

vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.equalalways = false
vim.opt.fileformats = "unix,dos,mac"
vim.opt.hidden = false
vim.opt.laststatus=3
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 3000
vim.opt.undofile = true
vim.opt.winbar= "%t" -- filename without path
vim.opt.wrap = false

-- Formatting Marks
vim.opt.list = true
vim.opt.listchars = {precedes = "<", extends = ">", tab = "  ", trail = "_"}
vim.opt.showbreak = "..."

-- Tabs
vim.opt.breakindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.tabstop=4

-- Wildmenu
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest:full,full"

-- Swap directory
vim.g.swap_dir = vim.fn.stdpath("data") .. "/swap"
vim.fn.mkdir(vim.g.swap_dir, "p")
vim.o.directory = vim.g.swap_dir .. ',.'

-- Prefer ripgrep to grep.
vim.cmd([[
if executable('rg')
    lua vim.opt.grepprg="rg --vimgrep"
    set grepformat^=%f:%l:%c:%m
endif
]])

-- Settings for both netrw and neovim
vim.opt.number = true
vim.g.netrw_bufsettings = "noma nomod number nobl nowrap ro" -- All but "number" are default.

-- Netrw Settings
vim.g.netrw_banner = 0

-- Hide . and .. directories.
vim.g.netrw_list_hide = ""
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. "^\\./"
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ","
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. "^\\.\\./"

--------------------------------------------------------------------------------
--                        Keybinds and Autocommands                           --
--                                                                            --
--------------------------------------------------------------------------------
-- TODO: Sort these mappings more logically.
vim.g.mapleader = " "

-- Normal, Visual, Select, Operator-pending Modes

    -- Don't want to :set ignorecase because * and # should be case-sensitive
    vim.api.nvim_set_keymap("", "/", "/\\c", { noremap=true})
    vim.api.nvim_set_keymap("", "?", "?\\c", { noremap=true})
    vim.api.nvim_set_keymap("", "<Leader>/", "/", { noremap=true})
    vim.api.nvim_set_keymap("", "<Leader>?", "?", { noremap=true})

    -- "-" to edit directory of current file
    -- TODO: disallow for terminal buffers
    vim.api.nvim_set_keymap("", "-", ":e %:p:h<CR>", { noremap=true, silent=true })

    -- Bufdir Plugin
    -- Open command-line
    vim.api.nvim_set_keymap("", "<Leader>cc", ":Bufdir terminal<CR>i", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>cC", ":terminal<CR>i", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>cs", ":split | Bufdir terminal<CR>i", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>cS", ":split | terminal<CR>i", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>cv", ":vsplit | Bufdir terminal<CR>i", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>cV", ":vsplit | terminal<CR>i", { noremap=true, silent=true })

    -- Telescope Plugin
    vim.api.nvim_set_keymap("", "<Leader>t/", ":Telescope current_buffer_fuzzy_find<CR>", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>tf", ":Telescope find_files<CR>", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>tl", ":Telescope live_grep<CR>", { noremap=true, silent=true })
    vim.api.nvim_set_keymap("", "<Leader>tt", ":Telescope<CR>", { noremap=true, silent=true })

    -- shift-tab to inverse tab
    vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap=true, silent=true })

-- Tab switching
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

-- Autocommands
    local init_group = vim.api.nvim_create_augroup("INIT_CMDS", {clear = true})

    -- Turn off line numbers in terminal emulator
    vim.api.nvim_create_autocmd("TermOpen", {group = init_group, command = "setlocal nonumber"})

    -- Automatically close terminal buffer when done.
    -- TODO: This breaks the :ter command.
    vim.api.nvim_create_autocmd("TermClose", {group = init_group,command = "if !v:event.status | execute 'bdelete! ' . expand('<abuf>') | endif"})

--------------------------------------------------------------------------------
--                                 Plugins                                    --
--                                                                            --
--------------------------------------------------------------------------------

require("plugins")


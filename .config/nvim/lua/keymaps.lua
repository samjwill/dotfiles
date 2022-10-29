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

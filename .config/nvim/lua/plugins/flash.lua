return {
    "folke/flash.nvim",
    event = "VeryLazy", -- TODO: Not certain why this needs to be here, but if it's not, the settings in the config aren't taken consistently.
    config = function()

        -- -- Cursor is basically impossible to see when using F/f/T/t motions with gruvbox colorscheme if you don't tweak the cursor highlight colors.
        -- -- Not 100% sure what's going on, but it really only appears to affect the cursor color in operator-pending mode.
        -- local function get_highlight_attributes(group_name)
        --     local hl_id = vim.fn.hlID(group_name)
        --     local guifg = vim.fn.synIDattr(hl_id, "fg#")
        --     local guibg = vim.fn.synIDattr(hl_id, "bg#")
        --     local ctermfg = vim.fn.synIDattr(hl_id, "fg", "cterm")
        --     local ctermbg = vim.fn.synIDattr(hl_id, "bg", "cterm")
        --     return guifg, guibg, ctermfg, ctermbg
        -- end
        --
        -- local function make_termcursor_independent()
        --     vim.cmd(string.format("highlight clear TermCursor"))
        --     vim.cmd(string.format("highlight clear TermCursorNC"))
        --     vim.cmd(string.format("highlight TermCursor cterm=reverse gui=reverse"))
        --     vim.cmd(string.format("highlight TermCursorNC cterm=reverse gui=reverse"))
        -- end
        -- make_termcursor_independent() -- Termcursor is linked to this, which makes it invisible in terminal buffers otherwise.
        --
        -- local function set_cursor_highlight_to_incsearch()
        --     local incsearch_guifg, incsearch_guibg, incsearch_ctermfg, incsearch_ctermbg = get_highlight_attributes("IncSearch")
        --     vim.cmd(string.format("highlight Cursor guifg=%s guibg=%s ctermfg=%s ctermbg=%s", incsearch_guifg, incsearch_guibg, incsearch_ctermfg, incsearch_ctermbg))
        -- end
        -- set_cursor_highlight_to_incsearch()

        require("flash").setup {
            highlight = {
                groups = {
                    -- Makes distinguishing between labels and matches easier when jumping.
                    match = "Search",
                    current = "Substitute",
                    backdrop = "FlashBackdrop",
                    label = "Error",
                },
            },
            modes = {
                search = {
                    enabled = false,
                },
                char = {
                    enabled = false, -- TODO: Re-enable when colorscheme cooperates with flash.
                    char_actions = function()
                        return {
                            [";"] = "next",
                            [","] = "prev",
                        }
                    end,
                    highlight = {
                        -- show a backdrop with hl FlashBackdrop
                        backdrop = false,
                        -- Highlight the search matches
                        matches = true,
                        groups = {
                            match = "IncSearch",
                            current = "IncSearch",
                            backdrop = "FlashBackdrop",
                            label = "Search",
                        },
                    },
                },
            },
        }
    end
}

return {
    "folke/flash.nvim",
    event = "VeryLazy", -- TODO: Not certain why this needs to be here, but if it's not, the settings in the config aren't taken consistently. Race condition, or maybe intentionally designed like this?
    config = function()

        -- Cursor is basically impossible to see when using F/f/T/t motions with gruvbox colorscheme if you don't tweak the cursor highlight colors.
        -- Not 100% sure what's going on, but it really only appears to affect the cursor color in operator-pending mode.
        local function get_highlight_attributes(group_name)
            local hl_id = vim.fn.hlID(group_name)
            local guifg = vim.fn.synIDattr(hl_id, "fg#")
            local guibg = vim.fn.synIDattr(hl_id, "bg#")
            local ctermfg = vim.fn.synIDattr(hl_id, "fg", "cterm")
            local ctermbg = vim.fn.synIDattr(hl_id, "bg", "cterm")
            return guifg, guibg, ctermfg, ctermbg
        end
        local function set_cursor_highlight_to_incsearch()
            local incsearch_guifg, incsearch_guibg, incsearch_ctermfg, incsearch_ctermbg = get_highlight_attributes("IncSearch")
            vim.cmd(string.format("highlight Cursor guifg=%s guibg=%s ctermfg=%s ctermbg=%s", incsearch_guifg, incsearch_guibg, incsearch_ctermfg, incsearch_ctermbg))
        end
        set_cursor_highlight_to_incsearch()

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
                        -- extmark priority
                        priority = 5000,
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

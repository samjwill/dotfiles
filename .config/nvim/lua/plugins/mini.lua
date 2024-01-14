return {
    "echasnovski/mini.nvim",
    config = function()
        ------------------------------------------------------------------------
        -- Mini Completion
        ------------------------------------------------------------------------
        require('mini.completion').setup{
            fallback_action = function() end -- None. Only auto-complete with LSP.
        }

        ------------------------------------------------------------------------
        -- Mini Map
        ------------------------------------------------------------------------
        local map = require('mini.map')
        map.setup(
        {
            symbols =
            {
                scroll_line = '┃', -- Box Drawings Heavy Vertical
                scroll_view = '┃', -- Box Drawings Heavy Vertical
            },
            integrations =
            {
                -- map.gen_integration.builtin_search(), -- Doesn't work well because of https://github.com/neovim/neovim/issues/18879. Autocmds that set hlsearch cannot be detected and the minimap is not refreshed.
                -- map.gen_integration.gitsigns(), -- Gets confusing if you leave both of these on. Maybe it's possible to just show one at a time?
                map.gen_integration.diagnostic(
                {
                    error = 'DiagnosticFloatingError',
                    warn  = 'DiagnosticFloatingWarn',
                    info  = 'DiagnosticFloatingInfo',
                    hint  = 'DiagnosticFloatingHint',
                }),
            },

            window = {
                show_integration_count = true,
            }
        })
    end
}

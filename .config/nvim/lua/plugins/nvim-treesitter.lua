return {
    "nvim-treesitter/nvim-treesitter",
    commit = "287ffdccc1dd7ed017d844a4fad069fd3340fa94",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",

            -- Only sync_install if running headless.
            -- From: https://github.com/nvim-treesitter/nvim-treesitter/issues/3579#issuecomment-1278662119
            sync_install = #vim.api.nvim_list_uis() == 0,

            highlight = {
                enable = true,
                -- Treesitter help page highlighting has broken before. The default highlighting's fine.
                disable = { "help" }
            }
        })

        -- Override default folding options.
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldlevel = 999999 -- Leave unfolded by default.
        vim.opt.foldmethod = "expr"
    end,
    build = ":TSUpdate"
}


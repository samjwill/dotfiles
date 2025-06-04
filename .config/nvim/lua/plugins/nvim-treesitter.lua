return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "comment",
                "cpp",
                "css",
                "csv",
                "diff",
                "doxygen",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "groovy",
                "html",
                "java",
                "javascript",
                "json",
                "julia",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "ninja",
                "perl",
                "python",
                "r",
                "rust",
                "sql",
                "tcl",
                "toml",
                "typescript",
                "typst",
                "vim",
                "xml",
                "yaml",
            },

            -- Only sync_install if running headless.
            -- From: https://github.com/nvim-treesitter/nvim-treesitter/issues/3579#issuecomment-1278662119
            sync_install = #vim.api.nvim_list_uis() == 0,

            highlight = {
                enable = true,
            }
        })

        -- Override default folding options.
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldlevel = 999999 -- Leave unfolded by default.
        vim.opt.foldmethod = "expr"
    end,
    build = ":TSUpdate"
}

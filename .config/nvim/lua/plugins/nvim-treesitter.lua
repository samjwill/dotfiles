vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 999999 -- Leave unfolded by default.
vim.opt.foldmethod = "expr"

vim.pack.add({"nvim-treesitter/nvim-treesitter"})

require("nvim-treesitter").install({
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
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

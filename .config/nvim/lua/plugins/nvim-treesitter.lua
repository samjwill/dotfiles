if vim.fn.executable("tar") == 0 then
    vim.notify("Missing external dependency for treesitter: tar", vim.log.levels.ERROR)
end

if vim.fn.executable("curl") == 0 then
    vim.notify("Missing external dependency for treesitter: curl", vim.log.levels.ERROR)
end

if vim.fn.executable("tree-sitter") == 0 then
    vim.notify("Missing external dependency for treesitter: tree-sitter-cli", vim.log.levels.ERROR)
end

if vim.fn.executable("cc") == 0 then
    vim.notify("Missing external dependency for treesitter: $CC is not set", vim.log.levels.ERROR)
end

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 999999 -- Leave unfolded by default.
vim.opt.foldmethod = "expr"

vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

require("nvim-treesitter").install({
    "bash",
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
    "make",
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
    "xml",
    "yaml",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})


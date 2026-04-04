-- See: https://github.com/mason-org/mason.nvim?tab=readme-ov-file#requirements
if vim.fn.executable("git") == 0 then
    vim.notify("Missing external dependency for mason: git", vim.log.levels.ERROR)
end

if vim.fn.executable("curl") == 0 and vim.fn.executable("wget") == 0 then
    vim.notify("Missing external dependency for mason: curl or wget", vim.log.levels.ERROR)
end

if vim.fn.executable("unzip") == 0 then
    vim.notify("Missing external dependency for mason: unzip", vim.log.levels.ERROR)
end

if vim.fn.executable("tar") == 0 and vim.fn.executable("gtar") == 0 then
    vim.notify("Missing external dependency for mason: tar or gtar", vim.log.levels.ERROR)
end

if vim.fn.executable("gzip") == 0 then
    vim.notify("Missing external dependency for mason: gzip", vim.log.levels.ERROR)
end

vim.pack.add(
    {
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    {
        load = true,
    }
)

require("mason").setup()
require("mason-tool-installer").setup({
    ensure_installed = {"lua-language-server", "clangd", "cpptools", "basedpyright", "debugpy", "tree-sitter-cli"},
    run_on_start = false,
})

-- TODO: This is not great since it blocks the GUI temporarily.
-- Install synchronously
vim.cmd("MasonToolsInstallSync")


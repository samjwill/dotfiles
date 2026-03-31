vim.pack.add({"https://github.com/echasnovski/mini.completion"})

require('mini.completion').setup{
    fallback_action = function() end -- None. Only auto-complete with LSP.
}

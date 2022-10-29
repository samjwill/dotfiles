require('mini.completion').setup{
    fallback_action = function() end -- None. Only auto-complete with LSP.
}

require('mini.cursorword').setup{}

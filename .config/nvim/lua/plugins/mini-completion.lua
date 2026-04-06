-- vim.opt.autocomplete = true
-- vim.opt.complete = "o"
-- vim.opt.completeopt = "menuone,noselect,popup"

-- TODO: Replace with above? Unfortunately, the above settings are very aggressive and start providing suggestions as soon as insert mode is entered, without typing anything at all.
vim.pack.add({"https://github.com/echasnovski/mini.completion"})
require('mini.completion').setup{
    fallback_action = function() end -- None. Only auto-complete with LSP.
}


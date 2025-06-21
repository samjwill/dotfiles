return {
  'echasnovski/mini.completion',
  version = false,
  config = function()
      require('mini.completion').setup{
          fallback_action = function() end -- None. Only auto-complete with LSP.
      }
  end,
}
